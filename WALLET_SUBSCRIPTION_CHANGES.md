# Wallet Subscription-Only Implementation - Changes Summary

## Overview
The backend has been updated to make wallet **subscription-only**. Drivers can only add money to wallet (for subscriptions) and cannot withdraw. All ride access is now controlled by subscription status only.

## Database Changes

### 1. New Table: `tbl_wallet_transactions`
Run the SQL script: `create_wallet_transactions_table.sql`

This table stores:
- `wallet_topup` transactions (when driver adds money)
- `subscription_purchase` transactions (when driver buys subscription)

## API Endpoint Changes

### Disabled Endpoints (Return Error Message)

1. **`POST /driver/Wallet_withdraw`**
   - Now returns: `"Withdrawals are disabled. Wallet is for subscriptions only."`
   - Previously allowed UPI/PayPal/Bank withdrawals

2. **`POST /driver/wallet_payout_data`**
   - Now returns: `"Withdrawals are disabled. Wallet is for subscriptions only."`
   - Previously showed withdrawal history

### Updated Endpoints

3. **`POST /driver/wallet_data`**
   - **Changed**: Now uses `tbl_wallet_transactions` table
   - **Returns**: 
     - `wallet_amount`: Current wallet balance
     - `wallet_data[]`: Array of transactions with:
       - `type`: `'wallet_topup'` or `'subscription_purchase'`
       - `amount`: Transaction amount
       - `date`: Transaction date
       - `reference_id`: Payment gateway reference (if any)
       - `subscription_plan_id`: Plan ID (for subscription purchases)

4. **`POST /driver/subscription_recharge`**
   - **Updated**: Now properly deducts from wallet and creates `wallet_transactions` record
   - **Flow**:
     1. Checks wallet balance ≥ plan price
     2. Deducts from wallet
     3. Creates `tbl_wallet_transactions` with `transaction_type='subscription_purchase'`
     4. Updates driver subscription fields
     5. Creates `tbl_subscription_history` record
     6. Sends notification: "Subscription Activated"
   - **Response**: Includes `subscription_data` and `wallet_amount`

### New Endpoints

5. **`POST /driver/wallet_topup`**
   - **Purpose**: Add money to wallet (called after payment gateway confirms payment)
   - **Input**:
     - `uid`: Driver ID
     - `amount`: Amount to add
     - `payment_type`: Payment method
     - `reference_id`: Payment gateway transaction ID (optional)
   - **Flow**:
     1. Validates driver exists
     2. Credits wallet
     3. Creates `tbl_wallet_transactions` with `transaction_type='wallet_topup'`
     4. Sends notification: "Wallet Top-up Successful"
   - **Response**: `wallet_amount` (new balance)

### Existing Endpoints (No Changes, Already Have Subscription Checks)

6. **`POST /driver/update_latlon`** (Go Online)
   - Already checks subscription before allowing driver to go online
   - Returns error if subscription expired

7. **`POST /driver/accept_vehicle_ride`**
   - Already checks subscription before accepting ride
   - Returns error if subscription expired

## Notification Hooks

### Already Implemented:
- ✅ **Wallet Top-up**: Sent when `wallet_topup` succeeds
- ✅ **Subscription Purchase**: Sent when `subscription_recharge` succeeds
- ✅ **Subscription Expired**: Sent by cron job when subscription expires
- ✅ **Subscription Expiring Soon**: Sent by cron job 2 days before expiry

## Testing Checklist

### 1. Database Setup
- [ ] Run `create_wallet_transactions_table.sql` in MySQL Workbench
- [ ] Verify table exists: `SHOW TABLES LIKE 'tbl_wallet_transactions';`

### 2. Wallet Top-up Flow
- [ ] Call `POST /driver/wallet_topup` with valid driver ID and amount
- [ ] Verify wallet balance increased in `tbl_driver`
- [ ] Verify transaction created in `tbl_wallet_transactions` with `type='wallet_topup'`
- [ ] Check notification was sent

### 3. Subscription Purchase Flow
- [ ] Ensure driver has sufficient wallet balance
- [ ] Call `POST /driver/subscription_recharge` with `uid` and `subscription_plan_id`
- [ ] Verify wallet deducted correctly
- [ ] Verify subscription activated in `tbl_driver`
- [ ] Verify transaction created in `tbl_wallet_transactions` with `type='subscription_purchase'`
- [ ] Verify record created in `tbl_subscription_history`
- [ ] Check notification was sent

### 4. Subscription Checks
- [ ] Try to go online with expired subscription → Should fail
- [ ] Try to accept ride with expired subscription → Should fail
- [ ] Go online with active subscription → Should succeed
- [ ] Accept ride with active subscription → Should succeed

### 5. Disabled Endpoints
- [ ] Call `POST /driver/Wallet_withdraw` → Should return error message
- [ ] Call `POST /driver/wallet_payout_data` → Should return error message

### 6. Wallet Data
- [ ] Call `POST /driver/wallet_data` → Should return wallet balance and transaction history
- [ ] Verify transactions show `wallet_topup` and `subscription_purchase` types

## Important Notes

1. **Payment Gateway Integration**: The `wallet_topup` endpoint assumes payment is already verified. In production, integrate with your payment gateway callbacks to verify payment before crediting wallet.

2. **No Wallet Withdrawals**: All withdrawal endpoints are disabled. Wallet can only be used for subscription purchases.

3. **Subscription-Only Access**: Drivers can only go online and accept rides if they have an active subscription. Wallet balance alone is not sufficient.

4. **Transaction History**: All wallet transactions are now tracked in `tbl_wallet_transactions` with proper types for easy filtering and reporting.

## Files Modified

1. `route_mobile/driver_api.js`
   - Disabled `Wallet_withdraw` endpoint
   - Disabled `wallet_payout_data` endpoint
   - Updated `wallet_data` endpoint
   - Updated `subscription_recharge` endpoint
   - Added `wallet_topup` endpoint

2. `create_wallet_transactions_table.sql` (new file)
   - SQL script to create wallet transactions table

3. `cron/subscription_expiration.js`
   - Already has notification hooks (no changes needed)

## Next Steps for Production

1. Integrate payment gateway callbacks with `wallet_topup` endpoint
2. Add payment verification before crediting wallet
3. Test all flows end-to-end with real payment gateways
4. Monitor `tbl_wallet_transactions` for transaction history
5. Set up alerts for failed wallet top-ups or subscription purchases


