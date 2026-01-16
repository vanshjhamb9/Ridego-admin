# Razorpay Payment Gateway Integration

## Overview
Razorpay has been integrated into the wallet top-up flow. Drivers can now add money to their wallet using Razorpay payment gateway.

## Setup Instructions

### 1. Install Razorpay Package
```bash
npm install razorpay
```

### 2. Configure Environment Variables
Add these to your `.env` file:

```env
# Razorpay Configuration
RAZORPAY_KEY_ID=rzp_test_YOUR_KEY_ID
RAZORPAY_KEY_SECRET=YOUR_SECRET_KEY
```

**For Testing (Current Setup):**
- Test keys are hardcoded in the code for now
- Replace with your actual Razorpay test keys from: https://dashboard.razorpay.com/app/keys
- For production, use live keys and remove hardcoded values

### 3. Get Razorpay Test Keys
1. Sign up at https://razorpay.com
2. Go to Dashboard → Settings → API Keys
3. Generate Test Keys
4. Copy `Key ID` and `Key Secret`
5. Add them to `.env` file

## API Endpoints

### 1. Create Razorpay Order
**Endpoint:** `POST /driver/create_razorpay_order`

**Request:**
```json
{
  "uid": 123,
  "amount": 500.00
}
```

**Response:**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Order created successfully",
  "order_id": "order_ABC123",
  "amount": 50000,
  "currency": "INR",
  "key_id": "rzp_test_1DP5mmOlF5G5ag"
}
```

**Usage:**
- Mobile app calls this endpoint first
- Receives `order_id` and `key_id`
- Uses these to initialize Razorpay Checkout in the app

### 2. Wallet Top-up (Verify Payment)
**Endpoint:** `POST /driver/wallet_topup`

**Request:**
```json
{
  "uid": 123,
  "amount": 500.00,
  "razorpay_payment_id": "pay_ABC123",
  "razorpay_order_id": "order_ABC123",
  "razorpay_signature": "signature_hash"
}
```

**Response (Success):**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Money added successfully",
  "wallet_amount": 500.00,
  "new_balance": 500.00
}
```

**Response (Failure):**
```json
{
  "ResponseCode": 401,
  "Result": false,
  "message": "Payment verification failed. Invalid signature."
}
```

**Usage:**
- Mobile app calls this after Razorpay payment succeeds
- Backend verifies payment signature and Razorpay API
- Credits wallet if verification passes
- Prevents duplicate payments

## Payment Flow

1. **Mobile App** → Calls `POST /driver/create_razorpay_order` with `uid` and `amount`
2. **Backend** → Creates Razorpay order, returns `order_id` and `key_id`
3. **Mobile App** → Initializes Razorpay Checkout with `order_id` and `key_id`
4. **User** → Completes payment in Razorpay Checkout
5. **Razorpay** → Returns payment details (`payment_id`, `order_id`, `signature`)
6. **Mobile App** → Calls `POST /driver/wallet_topup` with payment details
7. **Backend** → Verifies signature and payment status
8. **Backend** → Credits wallet if verification succeeds
9. **Backend** → Sends notification to driver
10. **Backend** → Returns success response with new balance

## Security Features

1. **Signature Verification**: Backend verifies Razorpay signature to ensure payment authenticity
2. **Payment Status Check**: Verifies payment status via Razorpay API
3. **Amount Verification**: Ensures paid amount matches requested amount
4. **Duplicate Prevention**: Checks if payment was already processed
5. **Driver Verification**: Validates driver exists before processing

## Error Handling

### Common Errors:

1. **Invalid Signature**
   - Message: "Payment verification failed. Invalid signature."
   - Cause: Signature mismatch or tampered payment data
   - Solution: Ensure mobile app sends correct signature from Razorpay

2. **Payment Not Successful**
   - Message: "Payment not successful. Status: {status}"
   - Cause: Payment failed or not captured
   - Solution: Check payment status in Razorpay dashboard

3. **Amount Mismatch**
   - Message: "Payment amount mismatch"
   - Cause: Paid amount doesn't match requested amount
   - Solution: Verify amount consistency

4. **Duplicate Payment**
   - Message: "This payment has already been processed"
   - Cause: Same payment_id processed twice
   - Solution: Payment already credited, show current balance

## Testing

### Test Keys (Current Setup)
- Key ID: `rzp_test_1DP5mmOlF5G5ag` (example - replace with your test key)
- Key Secret: `test_secret_key` (example - replace with your test secret)

### Test Payment Flow:
1. Use Razorpay test cards: https://razorpay.com/docs/payments/test-cards/
2. Example test card: `4111 1111 1111 1111` (any CVV, any future expiry)
3. Complete payment in test mode
4. Verify wallet is credited

### Test Scenarios:
- ✅ Valid payment → Wallet credited
- ✅ Invalid signature → Payment rejected
- ✅ Duplicate payment → Rejected
- ✅ Amount mismatch → Rejected
- ✅ Payment not captured → Rejected

## Production Checklist

- [ ] Replace test keys with live keys in `.env`
- [ ] Remove hardcoded test keys from code
- [ ] Enable webhook for additional security (optional)
- [ ] Set up payment failure notifications
- [ ] Monitor `tbl_wallet_transactions` for failed payments
- [ ] Test with real payment gateway
- [ ] Set up error logging and alerts

## Mobile App Integration

The mobile app needs to:
1. Call `create_razorpay_order` to get `order_id` and `key_id`
2. Initialize Razorpay Checkout SDK with these values
3. Handle payment success callback
4. Call `wallet_topup` with payment details from callback
5. Display success/error message to user

## Files Modified

1. `package.json` - Added `razorpay` dependency
2. `route_mobile/driver_api.js` - Added Razorpay integration:
   - Razorpay initialization
   - `create_razorpay_order` endpoint
   - Updated `wallet_topup` endpoint with payment verification

## Support

For Razorpay documentation:
- API Docs: https://razorpay.com/docs/api/
- Test Cards: https://razorpay.com/docs/payments/test-cards/
- Dashboard: https://dashboard.razorpay.com


