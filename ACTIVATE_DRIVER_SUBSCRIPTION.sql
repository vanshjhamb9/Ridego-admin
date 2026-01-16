-- =====================================================
-- Activate Driver Subscription for Ride Acceptance
-- =====================================================
-- Use this to quickly activate a driver's subscription
-- =====================================================

USE ridego_db;

-- =====================================================
-- STEP 1: Check Driver Status
-- =====================================================

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
WHERE id = 321;  -- ⬅️ REPLACE 321 WITH YOUR DRIVER ID

-- =====================================================
-- STEP 2: Activate Subscription (Quick Fix)
-- =====================================================
-- This gives driver 30 days active subscription

UPDATE tbl_driver 
SET 
    subscription_status = 'active',
    subscription_start_date = NOW(),
    subscription_end_date = DATE_ADD(NOW(), INTERVAL 30 DAY),
    current_subscription_plan_id = 3  -- 30 Day Plan
WHERE id = 321;  -- ⬅️ REPLACE 321 WITH YOUR DRIVER ID

-- =====================================================
-- STEP 3: Verify Subscription is Active
-- =====================================================

SELECT 
    id,
    first_name,
    subscription_status,
    subscription_start_date,
    subscription_end_date,
    DATEDIFF(subscription_end_date, NOW()) AS days_remaining,
    CASE 
        WHEN subscription_status = 'active' AND subscription_end_date > NOW() 
        THEN '✅ Active - Can Accept Rides'
        WHEN subscription_status = 'active' AND subscription_end_date <= NOW() 
        THEN '❌ Expired - Cannot Accept Rides'
        WHEN subscription_status = 'none' 
        THEN '❌ No Subscription - Cannot Accept Rides'
        ELSE '❌ Inactive - Cannot Accept Rides'
    END AS status_check
FROM tbl_driver 
WHERE id = 321;  -- ⬅️ REPLACE 321 WITH YOUR DRIVER ID

-- =====================================================
-- STEP 4: Ensure Driver Has Wallet Balance (Optional)
-- =====================================================
-- Driver needs wallet balance to purchase subscription plans
-- But if you're using the direct UPDATE above, wallet is not required

UPDATE tbl_driver 
SET wallet = 5000.00 
WHERE id = 321;  -- ⬅️ REPLACE 321 WITH YOUR DRIVER ID

-- =====================================================
-- ALTERNATIVE: Different Subscription Durations
-- =====================================================

-- For 7 days:
UPDATE tbl_driver 
SET 
    subscription_status = 'active',
    subscription_start_date = NOW(),
    subscription_end_date = DATE_ADD(NOW(), INTERVAL 7 DAY),
    current_subscription_plan_id = 4
WHERE id = 321;

-- For 15 days:
UPDATE tbl_driver 
SET 
    subscription_status = 'active',
    subscription_start_date = NOW(),
    subscription_end_date = DATE_ADD(NOW(), INTERVAL 15 DAY),
    current_subscription_plan_id = 5
WHERE id = 321;

-- For 1 year (testing):
UPDATE tbl_driver 
SET 
    subscription_status = 'active',
    subscription_start_date = NOW(),
    subscription_end_date = DATE_ADD(NOW(), INTERVAL 365 DAY),
    current_subscription_plan_id = 3
WHERE id = 321;

-- =====================================================
-- CHECK ALL DRIVERS' SUBSCRIPTION STATUS
-- =====================================================

SELECT 
    id,
    CONCAT(first_name, ' ', last_name) AS name,
    subscription_status,
    subscription_end_date,
    DATEDIFF(subscription_end_date, NOW()) AS days_remaining,
    CASE 
        WHEN subscription_status = 'active' AND subscription_end_date > NOW() 
        THEN '✅ Active'
        ELSE '❌ Cannot Accept Rides'
    END AS can_accept_rides
FROM tbl_driver 
WHERE status = '1' 
ORDER BY id;
