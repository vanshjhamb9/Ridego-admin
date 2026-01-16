# Where to See the Updates - Admin Panel Guide

## ✅ What We Added

1. **Subscription Functionality** - Database tables and columns
2. **Dummy Data** - Sample drivers, customers, vehicles, subscription plans
3. **Database Schema Updates** - New subscription-related tables

## 📍 Where to View Updates in Admin Panel

### 1. Dashboard (Main Page)
**URL**: `http://localhost:8000/index`

You should see:
- Total Drivers count (should show 5 if dummy data was inserted)
- Total Customers count (should show 5)
- Total Vehicles count (should show 5)
- Ride statistics

### 2. Driver List - View Subscription Status
**URL**: `http://localhost:8000/driver/list`

This shows all drivers. To see subscription data:
- The subscription columns are in the database but may not be visible in the table yet
- You can check individual driver details

### 3. Check Database Directly (MySQL Workbench)

#### View Subscription Plans:
```sql
USE ridego_db;
SELECT * FROM tbl_subscription_plans;
```
Should show 5 plans (5 Day, 7 Day, 10 Day, 15 Day, 30 Day)

#### View Drivers with Subscription Status:
```sql
SELECT 
    id, 
    first_name, 
    last_name,
    email,
    subscription_status,
    subscription_start_date,
    subscription_end_date,
    current_subscription_plan_id,
    wallet
FROM tbl_driver;
```

Should show:
- Driver 1: `subscription_status = 'active'` (5 Day Plan)
- Driver 2: `subscription_status = 'active'` (10 Day Plan)
- Driver 3: `subscription_status = 'expired'` (10 Day Plan)
- Driver 4: `subscription_status = 'none'` (No subscription)
- Driver 5: `subscription_status = 'active'` (30 Day Plan)

#### View Subscription History:
```sql
SELECT 
    sh.id,
    d.first_name,
    d.last_name,
    sp.name AS plan_name,
    sh.start_date,
    sh.end_date,
    sh.price,
    sh.status
FROM tbl_subscription_history sh
LEFT JOIN tbl_driver d ON sh.driver_id = d.id
LEFT JOIN tbl_subscription_plans sp ON sh.subscription_plan_id = sp.id;
```

### 4. Check Other Dummy Data

#### Customers:
**URL**: `http://localhost:8000/customer/list`
- Should show 5 customers

#### Vehicles:
**URL**: `http://localhost:8000/vehicle/list`
- Should show 5 vehicles (Sedan, SUV, Hatchback, Premium, Luxury)

#### Zones:
**URL**: `http://localhost:8000/zone/list`
- Should show 5 zones (Central, North, South, East, West Delhi)

#### Coupons:
**URL**: `http://localhost:8000/coupon/list`
- Should show 3 coupons (Welcome Offer, Flat Discount, New User)

#### Subscription Plans (Database Only):
Currently, there's **no admin UI** for subscription plans. You need to check via:
- MySQL Workbench (see queries above)
- Or API endpoints (see TESTING_GUIDE.md)

### 5. Test Subscription API Endpoints

The subscription functionality is available via **Mobile API endpoints**:

**Base URL**: `http://localhost:8000/driver`

#### Get Subscription Plans:
```bash
POST http://localhost:8000/driver/subscription_plans
Body: {"uid": 1}
```

#### Get Driver Subscription Status:
```bash
POST http://localhost:8000/driver/subscription_status
Body: {"uid": 1}
```

#### Recharge Subscription:
```bash
POST http://localhost:8000/driver/subscription_recharge
Body: {"uid": 1, "subscription_plan_id": 1}
```

See `TESTING_GUIDE.md` for detailed API testing instructions.

## 🔍 Quick Verification Queries

Run these in MySQL Workbench to verify everything:

```sql
USE ridego_db;

-- Count all data
SELECT 'Drivers' AS table_name, COUNT(*) AS count FROM tbl_driver
UNION ALL
SELECT 'Customers', COUNT(*) FROM tbl_customer
UNION ALL
SELECT 'Vehicles', COUNT(*) FROM tbl_vehicle
UNION ALL
SELECT 'Subscription Plans', COUNT(*) FROM tbl_subscription_plans
UNION ALL
SELECT 'Subscription History', COUNT(*) FROM tbl_subscription_history
UNION ALL
SELECT 'Zones', COUNT(*) FROM tbl_zone
UNION ALL
SELECT 'Coupons', COUNT(*) FROM tbl_coupon;

-- View active subscriptions
SELECT 
    d.id,
    CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
    d.subscription_status,
    sp.name AS plan_name,
    d.subscription_end_date,
    DATEDIFF(d.subscription_end_date, NOW()) AS remaining_days
FROM tbl_driver d
LEFT JOIN tbl_subscription_plans sp ON d.current_subscription_plan_id = sp.id
WHERE d.subscription_status = 'active';
```

## 📝 Note About Admin UI

**Important**: The subscription management is currently **API-only**. There's no admin panel UI to:
- View subscription plans
- Manage subscriptions
- View subscription history

To add admin UI for subscriptions, you would need to:
1. Create routes in `router/` (e.g., `router/subscription.js`)
2. Create views in `views/` (e.g., `views/subscription_plans.ejs`)
3. Add menu items in `views/partials/header_sidebar.ejs`

## 🎯 Summary

**What you CAN see in Admin Panel:**
- ✅ Dashboard statistics (drivers, customers, vehicles count)
- ✅ Driver list (but subscription columns not visible in UI yet)
- ✅ Customer list
- ✅ Vehicle list
- ✅ Zone list
- ✅ Coupon list

**What you CAN see in Database:**
- ✅ All subscription plans
- ✅ Driver subscription status
- ✅ Subscription history
- ✅ All dummy data

**What you CAN test:**
- ✅ Subscription API endpoints (see TESTING_GUIDE.md)






