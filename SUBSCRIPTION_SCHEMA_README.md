# Subscription Schema Documentation

## Overview

This document describes the subscription functionality that has been added to the Ridego database schema. The subscription system allows drivers to purchase subscription plans that enable them to accept rides.

## Database Changes

### 1. Updated `tbl_driver` Table

The following columns have been added to the `tbl_driver` table:

- **`subscription_status`** (varchar(20), DEFAULT 'none')
  - Possible values: 'none', 'active', 'expired'
  - Tracks the current subscription status of the driver

- **`subscription_start_date`** (datetime, DEFAULT NULL)
  - Stores when the current subscription started

- **`subscription_end_date`** (datetime, DEFAULT NULL)
  - Stores when the current subscription expires

- **`current_subscription_plan_id`** (int(11), DEFAULT NULL)
  - Foreign key reference to `tbl_subscription_plans.id`
  - Stores the ID of the currently active subscription plan

### 2. New Table: `tbl_subscription_plans`

This table stores available subscription plans that drivers can purchase.

**Columns:**
- `id` (int(11), PRIMARY KEY, AUTO_INCREMENT)
- `name` (varchar(255), NOT NULL) - Plan name (e.g., "5 Day Plan")
- `price` (decimal(10,2), NOT NULL) - Plan price
- `validity_days` (int(11), NOT NULL) - Number of days the subscription is valid
- `is_active` (tinyint(1), DEFAULT 1) - Whether the plan is currently available
- `created_at` (timestamp, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (timestamp, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)

**Indexes:**
- PRIMARY KEY on `id`

### 3. New Table: `tbl_subscription_history`

This table maintains a history of all subscription purchases and activations.

**Columns:**
- `id` (int(11), PRIMARY KEY, AUTO_INCREMENT)
- `driver_id` (int(11), NOT NULL) - Foreign key to `tbl_driver.id`
- `subscription_plan_id` (int(11), NOT NULL) - Foreign key to `tbl_subscription_plans.id`
- `wallet_transaction_id` (int(11), DEFAULT NULL) - Reference to wallet transaction
- `start_date` (datetime, NOT NULL) - Subscription start date
- `end_date` (datetime, NOT NULL) - Subscription end date
- `price` (decimal(10,2), NOT NULL) - Price paid for this subscription
- `validity_days` (int(11), NOT NULL) - Validity period in days
- `status` (varchar(20), DEFAULT 'active') - Subscription status
- `created_at` (timestamp, DEFAULT CURRENT_TIMESTAMP)

**Indexes:**
- PRIMARY KEY on `id`
- KEY on `driver_id`
- KEY on `subscription_plan_id`

## API Endpoints

The subscription functionality is implemented in `route_mobile/driver_api.js`:

1. **GET Subscription Plans**: `POST /driver/subscription_plans`
   - Returns all active subscription plans

2. **GET Subscription Status**: `POST /driver/subscription_status`
   - Returns the current subscription status for a driver

3. **Subscription Recharge**: `POST /driver/subscription_recharge`
   - Allows a driver to purchase a subscription plan using wallet balance

## Cron Job

A cron job runs every hour to check for expired subscriptions:
- **File**: `cron/subscription_expiration.js`
- **Function**: Automatically updates expired subscriptions and sends notifications

## Migration Files

### For New Database Imports

The main SQL dump file (`zippygo.sql`) now includes all subscription tables and columns. Simply import the file as usual.

### For Existing Databases

If you already have a database imported, use the migration script:

**File**: `subscription_schema_migration.sql`

**Usage:**
1. Open MySQL Workbench
2. Connect to your database
3. Open `subscription_schema_migration.sql`
4. Execute the script

This script will:
- Add subscription columns to `tbl_driver`
- Create `tbl_subscription_plans` table
- Create `tbl_subscription_history` table
- Insert default subscription plans (5 Day, 10 Day, 30 Day)

## Default Subscription Plans

After running the migration, the following default plans are created:

1. **5 Day Plan** - ₹500.00 - 5 days validity
2. **10 Day Plan** - ₹1000.00 - 10 days validity
3. **30 Day Plan** - ₹2500.00 - 30 days validity

You can modify these plans or add new ones directly in the database.

## Testing

Refer to `TESTING_GUIDE.md` for comprehensive API testing instructions for the subscription endpoints.

## Notes

- Subscription purchases are deducted from the driver's wallet balance
- A wallet transaction is created for each subscription purchase
- Subscriptions automatically expire based on the `subscription_end_date`
- The cron job checks for expired subscriptions every hour
- Drivers with expired subscriptions cannot accept rides (enforced in the API)

