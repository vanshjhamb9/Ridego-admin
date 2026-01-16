-- =====================================================
-- MySQL Database Verification Queries
-- =====================================================
-- Use these queries to check your imported data and tables
-- Run these in MySQL Workbench or command line
-- =====================================================

-- Step 1: Select the database
USE ridego_db;

-- =====================================================
-- 1. LIST ALL TABLES
-- =====================================================

-- Show all tables in the database
SHOW TABLES;

-- Count total number of tables
SELECT COUNT(*) AS total_tables 
FROM information_schema.tables 
WHERE table_schema = 'ridego_db';

-- =====================================================
-- 2. CHECK TABLE STRUCTURE
-- =====================================================

-- View structure of a specific table (replace 'tbl_driver' with your table name)
DESCRIBE tbl_driver;

-- Or use this alternative:
SHOW COLUMNS FROM tbl_driver;

-- Check if subscription columns exist in tbl_driver
SELECT COLUMN_NAME, DATA_TYPE, COLUMN_DEFAULT, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'ridego_db' 
  AND TABLE_NAME = 'tbl_driver' 
  AND COLUMN_NAME LIKE 'subscription%';

-- =====================================================
-- 3. COUNT RECORDS IN TABLES
-- =====================================================

-- Count records in a specific table
SELECT COUNT(*) AS total_records FROM tbl_driver;
SELECT COUNT(*) AS total_records FROM tbl_customer;
SELECT COUNT(*) AS total_records FROM tbl_vehicle;

-- Count records in all tables (useful overview)
SELECT 
    TABLE_NAME AS 'Table Name',
    TABLE_ROWS AS 'Row Count'
FROM information_schema.tables 
WHERE table_schema = 'ridego_db'
ORDER BY TABLE_ROWS DESC;

-- =====================================================
-- 4. VIEW DATA IN TABLES
-- =====================================================

-- View first 10 records from a table
SELECT * FROM tbl_driver LIMIT 10;
SELECT * FROM tbl_customer LIMIT 10;
SELECT * FROM tbl_vehicle LIMIT 10;

-- View all admin records
SELECT * FROM tbl_admin;

-- View all subscription plans
SELECT * FROM tbl_subscription_plans;

-- View subscription history
SELECT * FROM tbl_subscription_history;

-- =====================================================
-- 5. CHECK SUBSCRIPTION TABLES (Newly Added)
-- =====================================================

-- Verify subscription tables exist
SHOW TABLES LIKE 'tbl_subscription%';

-- Check subscription plans table structure
DESCRIBE tbl_subscription_plans;

-- Check subscription history table structure
DESCRIBE tbl_subscription_history;

-- View subscription plans data
SELECT * FROM tbl_subscription_plans;

-- Count subscription plans
SELECT COUNT(*) AS total_plans FROM tbl_subscription_plans;

-- Check drivers with subscriptions
SELECT 
    id, 
    first_name, 
    last_name,
    subscription_status,
    subscription_start_date,
    subscription_end_date,
    current_subscription_plan_id
FROM tbl_driver 
WHERE subscription_status IS NOT NULL 
   AND subscription_status != 'none'
LIMIT 10;

-- =====================================================
-- 6. CHECK SPECIFIC DATA
-- =====================================================

-- Check drivers table
SELECT id, first_name, last_name, email, status, wallet 
FROM tbl_driver 
LIMIT 5;

-- Check customers table
SELECT id, first_name, last_name, email, status 
FROM tbl_customer 
LIMIT 5;

-- Check vehicles table
SELECT id, name, status 
FROM tbl_vehicle 
LIMIT 5;

-- Check orders/rides
SELECT id, c_id, d_id, status, price 
FROM tbl_order_vehicle 
ORDER BY id DESC 
LIMIT 10;

-- =====================================================
-- 7. VERIFY FOREIGN KEY RELATIONSHIPS
-- =====================================================

-- Check if subscription history references exist
SELECT 
    sh.id,
    sh.driver_id,
    d.first_name,
    d.last_name,
    sh.subscription_plan_id,
    sp.name AS plan_name,
    sh.start_date,
    sh.end_date,
    sh.status
FROM tbl_subscription_history sh
LEFT JOIN tbl_driver d ON sh.driver_id = d.id
LEFT JOIN tbl_subscription_plans sp ON sh.subscription_plan_id = sp.id
LIMIT 10;

-- =====================================================
-- 8. CHECK DATABASE SIZE
-- =====================================================

-- Get database size
SELECT 
    table_schema AS 'Database',
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'Size (MB)'
FROM information_schema.tables 
WHERE table_schema = 'ridego_db'
GROUP BY table_schema;

-- Get size of each table
SELECT 
    TABLE_NAME AS 'Table',
    ROUND(((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024), 2) AS 'Size (MB)',
    TABLE_ROWS AS 'Rows'
FROM information_schema.tables 
WHERE table_schema = 'ridego_db'
ORDER BY (DATA_LENGTH + INDEX_LENGTH) DESC;

-- =====================================================
-- 9. QUICK HEALTH CHECK
-- =====================================================

-- Quick overview of your database
SELECT 
    'Total Tables' AS Metric,
    COUNT(*) AS Value
FROM information_schema.tables 
WHERE table_schema = 'ridego_db'

UNION ALL

SELECT 
    'Total Drivers' AS Metric,
    COUNT(*) AS Value
FROM tbl_driver

UNION ALL

SELECT 
    'Total Customers' AS Metric,
    COUNT(*) AS Value
FROM tbl_customer

UNION ALL

SELECT 
    'Total Vehicles' AS Metric,
    COUNT(*) AS Value
FROM tbl_vehicle

UNION ALL

SELECT 
    'Subscription Plans' AS Metric,
    COUNT(*) AS Value
FROM tbl_subscription_plans

UNION ALL

SELECT 
    'Active Subscriptions' AS Metric,
    COUNT(*) AS Value
FROM tbl_driver 
WHERE subscription_status = 'active';

-- =====================================================
-- 10. SEARCH FOR SPECIFIC DATA
-- =====================================================

-- Search for a driver by name
SELECT * FROM tbl_driver 
WHERE first_name LIKE '%john%' OR last_name LIKE '%john%';

-- Search for a customer by email
SELECT * FROM tbl_customer 
WHERE email LIKE '%@gmail.com%';

-- Find drivers with active subscriptions
SELECT 
    d.id,
    d.first_name,
    d.last_name,
    d.email,
    d.subscription_status,
    d.subscription_start_date,
    d.subscription_end_date,
    sp.name AS plan_name
FROM tbl_driver d
LEFT JOIN tbl_subscription_plans sp ON d.current_subscription_plan_id = sp.id
WHERE d.subscription_status = 'active';

-- =====================================================
-- END OF QUERIES
-- =====================================================






