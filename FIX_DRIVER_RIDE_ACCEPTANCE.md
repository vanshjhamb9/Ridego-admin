# 🔧 Fix: Driver Unable to Accept Rides

## Problem

Driver cannot accept rides because:
1. **Subscription check is blocking** - Driver needs an active subscription
2. **Driver might not have subscription** - Check driver's subscription status first

## Quick Fix: Add Active Subscription to Driver

### Step 1: Check Driver's Current Status

Run this to see driver's subscription status:

```sql
USE ridego_db;

SELECT 
    id,
    first_name,
    last_name,
    phone,
    subscription_status,
    subscription_start_date,
    subscription_end_date,
    current_subscription_plan_id,
    wallet
FROM tbl_driver 
WHERE id = 321;  -- Replace 321 with your driver ID
```

### Step 2: Add/Update Subscription for Driver

**Option A: Quick Fix - Give Driver 30 Days Active Subscription**

```sql
USE ridego_db;

UPDATE tbl_driver 
SET 
    subscription_status = 'active',
    subscription_start_date = NOW(),
    subscription_end_date = DATE_ADD(NOW(), INTERVAL 30 DAY),
    current_subscription_plan_id = 3  -- 30 Day Plan
WHERE id = 321;  -- Replace 321 with your driver ID
```

**Option B: Use Subscription Recharge API (Recommended)**

Instead of direct SQL, use the subscription recharge endpoint to properly:
- Deduct wallet balance
- Create wallet transaction
- Create subscription history
- Set proper dates

```bash
# First, ensure driver has wallet balance
# Then recharge subscription via API:

curl -X POST http://localhost:8000/driver/subscription_recharge \
  -H "Content-Type: application/json" \
  -d '{"uid": 321, "subscription_plan_id": 3}'
```

### Step 3: Verify Subscription is Active

```sql
SELECT 
    id,
    subscription_status,
    subscription_start_date,
    subscription_end_date,
    CASE 
        WHEN subscription_status = 'active' AND subscription_end_date > NOW() 
        THEN '✅ Active'
        WHEN subscription_status = 'active' AND subscription_end_date <= NOW() 
        THEN '❌ Expired'
        WHEN subscription_status = 'none' 
        THEN '❌ No Subscription'
        ELSE '❌ Inactive'
    END AS status_check
FROM tbl_driver 
WHERE id = 321;
```

---

## Testing Accept Ride

### Test Endpoint:

**POST** `http://localhost:8000/driver/accept_vehicle_ride`

**Request Body:**
```json
{
  "uid": 321,
  "request_id": 123,
  "lat": "28.6046684",
  "lon": "77.0544941"
}
```

**Expected Response (Success):**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Request Accept Successful",
  "requestid": 456
}
```

**Expected Response (Subscription Expired):**
```json
{
  "ResponseCode": 200,
  "Result": false,
  "message": "Your subscription has expired. Please recharge to continue."
}
```

---

## Common Issues & Solutions

### Issue 1: "Your subscription has expired"
**Solution:** Run the UPDATE query above to activate subscription

### Issue 2: "Driver not found"
**Solution:** Check if driver ID exists:
```sql
SELECT id FROM tbl_driver WHERE id = 321;
```

### Issue 3: "Request Not Found"
**Solution:** 
- Ensure customer has created a ride request
- Check request_id is correct
- Verify driver is in the request's driver list

### Issue 4: "Something went wrong"
**Solution:**
- Check server logs for detailed error
- Verify all required fields are sent (uid, request_id, lat, lon)

---

## Complete SQL Setup for Driver

```sql
USE ridego_db;

-- 1. Check if driver exists
SELECT id, first_name, subscription_status FROM tbl_driver WHERE id = 321;

-- 2. Ensure driver has wallet balance (minimum ₹2500 for 30-day plan)
UPDATE tbl_driver 
SET wallet = 5000.00 
WHERE id = 321;

-- 3. Activate subscription (30 days from now)
UPDATE tbl_driver 
SET 
    subscription_status = 'active',
    subscription_start_date = NOW(),
    subscription_end_date = DATE_ADD(NOW(), INTERVAL 30 DAY),
    current_subscription_plan_id = 3
WHERE id = 321;

-- 4. Verify
SELECT 
    id,
    first_name,
    subscription_status,
    subscription_end_date,
    DATEDIFF(subscription_end_date, NOW()) AS days_remaining
FROM tbl_driver 
WHERE id = 321;
```

---

## Alternative: Disable Subscription Check (For Testing Only)

⚠️ **NOT RECOMMENDED FOR PRODUCTION**

If you want to test without subscription (temporarily), comment out the subscription check:

```javascript
// In route_mobile/driver_api.js, line 852-868
// Temporarily comment out subscription check for testing:

/*
// Check subscription status before accepting ride
const driver = await DataFind(`SELECT subscription_status, subscription_end_date FROM tbl_driver WHERE id = '${uid}'`);
if (driver == "" || driver == -1) {
    return res.status(200).json({ ResponseCode: 401, Result: false, message: 'Driver not found' });
}

const now = new Date();
const endDate = driver[0].subscription_end_date ? new Date(driver[0].subscription_end_date) : null;

if (driver[0].subscription_status !== 'active' || !endDate || endDate < now) {
    return res.status(200).json({ 
        ResponseCode: 200, 
        Result: false, 
        message: "Your subscription has expired. Please recharge to continue." 
    });
}
*/
```

**But it's better to just add a subscription!**

---

## Recommended Solution

**Best approach:** Use the subscription recharge API to properly set up the subscription:

1. **Ensure driver has wallet balance:**
   ```sql
   UPDATE tbl_driver SET wallet = 5000.00 WHERE id = 321;
   ```

2. **Recharge subscription via API:**
   ```bash
   POST http://localhost:8000/driver/subscription_recharge
   Body: {"uid": 321, "subscription_plan_id": 3}
   ```

3. **Test accepting ride:**
   ```bash
   POST http://localhost:8000/driver/accept_vehicle_ride
   Body: {"uid": 321, "request_id": 123, "lat": "28.6046684", "lon": "77.0544941"}
   ```

---

## Files Created

- `FIX_DRIVER_RIDE_ACCEPTANCE.md` - This troubleshooting guide

---

## Status

✅ **Root Cause Identified** - Subscription check is blocking ride acceptance
✅ **Solutions Provided** - SQL queries to activate subscription
✅ **Testing Steps** - Commands to verify and test

Fix the subscription and try accepting rides again!
