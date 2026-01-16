-- =====================================================
-- Check Driver IDs and Status
-- =====================================================
-- Use these queries to find driver IDs for testing
-- =====================================================

USE ridego_db;

-- =====================================================
-- OPTION 1: List All Drivers with IDs
-- =====================================================

SELECT 
    id AS driver_id,
    CONCAT(first_name, ' ', last_name) AS name,
    primary_phoneNo AS phone,
    email,
    subscription_status,
    subscription_end_date,
    wallet,
    status,
    approval_status
FROM tbl_driver
ORDER BY id;

-- =====================================================
-- OPTION 2: Check Specific Driver by Phone Number
-- =====================================================

SELECT 
    id AS driver_id,
    CONCAT(first_name, ' ', last_name) AS name,
    primary_ccode,
    primary_phoneNo,
    email,
    subscription_status,
    subscription_end_date,
    wallet,
    status,
    approval_status
FROM tbl_driver
WHERE primary_phoneNo = '9876543210';  -- ⬅️ REPLACE WITH YOUR PHONE NUMBER

-- =====================================================
-- OPTION 3: Check Active Drivers with Subscriptions
-- =====================================================

SELECT 
    id AS driver_id,
    CONCAT(first_name, ' ', last_name) AS name,
    primary_phoneNo AS phone,
    subscription_status,
    subscription_end_date,
    DATEDIFF(subscription_end_date, NOW()) AS days_remaining,
    CASE 
        WHEN subscription_status = 'active' AND subscription_end_date > NOW() 
        THEN '✅ Can Accept Rides'
        ELSE '❌ Cannot Accept Rides'
    END AS status_check,
    wallet
FROM tbl_driver
WHERE status = '1' 
  AND approval_status = '1'
ORDER BY id;

-- =====================================================
-- OPTION 4: Find Driver by ID
-- =====================================================

SELECT 
    id AS driver_id,
    CONCAT(first_name, ' ', last_name) AS name,
    primary_ccode,
    primary_phoneNo,
    email,
    subscription_status,
    subscription_start_date,
    subscription_end_date,
    current_subscription_plan_id,
    wallet,
    status,
    approval_status,
    fstatus AS online_status,
    latitude,
    longitude
FROM tbl_driver
WHERE id = 321;  -- ⬅️ REPLACE WITH DRIVER ID YOU WANT TO CHECK

-- =====================================================
-- OPTION 5: Quick Summary - All Drivers
-- =====================================================

SELECT 
    id,
    CONCAT(first_name, ' ', COALESCE(last_name, '')) AS name,
    primary_phoneNo AS phone,
    subscription_status,
    DATEDIFF(COALESCE(subscription_end_date, NOW()), NOW()) AS days_left,
    wallet
FROM tbl_driver
ORDER BY id;

-- =====================================================
-- OPTION 6: Check Driver with Online Status
-- =====================================================

SELECT 
    id AS driver_id,
    CONCAT(first_name, ' ', last_name) AS name,
    primary_phoneNo AS phone,
    fstatus AS is_online,
    subscription_status,
    subscription_end_date,
    CASE 
        WHEN fstatus = 1 THEN '✅ Online'
        ELSE '❌ Offline'
    END AS online_status,
    CASE 
        WHEN subscription_status = 'active' AND subscription_end_date > NOW() 
        THEN '✅ Can Accept Rides'
        ELSE '❌ Cannot Accept Rides'
    END AS ride_status
FROM tbl_driver
WHERE status = '1'
ORDER BY id;

-- =====================================================
-- OPTION 7: Check Drivers Available for Testing
-- =====================================================

SELECT 
    id AS driver_id,
    CONCAT(first_name, ' ', last_name) AS name,
    primary_phoneNo AS phone,
    subscription_status,
    subscription_end_date,
    DATEDIFF(subscription_end_date, NOW()) AS days_remaining,
    wallet,
    CASE 
        WHEN status = '1' AND approval_status = '1' 
             AND subscription_status = 'active' 
             AND subscription_end_date > NOW() 
        THEN '✅ Ready for Testing'
        ELSE '❌ Not Ready'
    END AS testing_status
FROM tbl_driver
ORDER BY id;
