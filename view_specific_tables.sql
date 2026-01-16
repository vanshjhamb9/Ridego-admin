-- =====================================================
-- SQL Queries to View Specific Tables
-- =====================================================
-- Tables: tbl_subscription_history, tbl_subscription_plans, 
--         tbl_transaction_driver, tbl_package_category
-- =====================================================

-- First, check if these tables exist
SELECT 
    TABLE_NAME AS 'Table Name',
    TABLE_ROWS AS 'Row Count',
    ROUND(((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024), 2) AS 'Size (MB)',
    CREATE_TIME AS 'Created'
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'ridego_db'
AND TABLE_NAME IN (
    'tbl_subscription_history',
    'tbl_subscription_plans',
    'tbl_transaction_driver',
    'tbl_package_category'
)
ORDER BY TABLE_NAME;

-- =====================================================
-- 1. tbl_subscription_plans
-- =====================================================

-- Show table structure
DESCRIBE tbl_subscription_plans;

-- Show CREATE TABLE statement
SHOW CREATE TABLE tbl_subscription_plans;

-- View all data
SELECT * FROM tbl_subscription_plans;

-- View with formatted output
SELECT 
    id,
    name AS 'Plan Name',
    price AS 'Price',
    validity_days AS 'Validity (Days)',
    is_active AS 'Active',
    created_at AS 'Created At',
    updated_at AS 'Updated At'
FROM tbl_subscription_plans
ORDER BY id;

-- Count records
SELECT COUNT(*) AS total_plans FROM tbl_subscription_plans;

-- =====================================================
-- 2. tbl_subscription_history
-- =====================================================

-- Show table structure
DESCRIBE tbl_subscription_history;

-- Show CREATE TABLE statement
SHOW CREATE TABLE tbl_subscription_history;

-- View all data
SELECT * FROM tbl_subscription_history;

-- View with formatted output
SELECT 
    id,
    driver_id AS 'Driver ID',
    subscription_plan_id AS 'Plan ID',
    wallet_transaction_id AS 'Transaction ID',
    start_date AS 'Start Date',
    end_date AS 'End Date',
    price AS 'Price',
    validity_days AS 'Validity Days',
    status AS 'Status',
    created_at AS 'Created At'
FROM tbl_subscription_history
ORDER BY created_at DESC;

-- Count records
SELECT COUNT(*) AS total_subscriptions FROM tbl_subscription_history;

-- View active subscriptions
SELECT * FROM tbl_subscription_history 
WHERE status = 'active' 
ORDER BY end_date DESC;

-- =====================================================
-- 3. tbl_transaction_driver
-- =====================================================

-- Show table structure
DESCRIBE tbl_transaction_driver;

-- Show CREATE TABLE statement
SHOW CREATE TABLE tbl_transaction_driver;

-- View all data
SELECT * FROM tbl_transaction_driver;

-- View with formatted output (adjust column names based on your actual structure)
SELECT 
    id,
    driver_id AS 'Driver ID',
    transaction_type AS 'Type',
    amount AS 'Amount',
    balance AS 'Balance',
    description AS 'Description',
    created_at AS 'Created At'
FROM tbl_transaction_driver
ORDER BY created_at DESC
LIMIT 100;

-- Count records
SELECT COUNT(*) AS total_transactions FROM tbl_transaction_driver;

-- View recent transactions
SELECT * FROM tbl_transaction_driver 
ORDER BY created_at DESC 
LIMIT 50;

-- =====================================================
-- 4. tbl_package_category
-- =====================================================

-- Show table structure
DESCRIBE tbl_package_category;

-- Show CREATE TABLE statement
SHOW CREATE TABLE tbl_package_category;

-- View all data
SELECT * FROM tbl_package_category;

-- View with formatted output
SELECT 
    id,
    name AS 'Category Name',
    description AS 'Description',
    status AS 'Status',
    created_at AS 'Created At',
    updated_at AS 'Updated At'
FROM tbl_package_category
ORDER BY id;

-- Count records
SELECT COUNT(*) AS total_categories FROM tbl_package_category;

-- View active categories only
SELECT * FROM tbl_package_category 
WHERE status = '1' OR status = 'active'
ORDER BY name;

-- =====================================================
-- Summary Query - All Tables at Once
-- =====================================================

SELECT 
    'tbl_subscription_plans' AS 'Table Name',
    COUNT(*) AS 'Row Count'
FROM tbl_subscription_plans
UNION ALL
SELECT 
    'tbl_subscription_history' AS 'Table Name',
    COUNT(*) AS 'Row Count'
FROM tbl_subscription_history
UNION ALL
SELECT 
    'tbl_transaction_driver' AS 'Table Name',
    COUNT(*) AS 'Row Count'
FROM tbl_transaction_driver
UNION ALL
SELECT 
    'tbl_package_category' AS 'Table Name',
    COUNT(*) AS 'Row Count'
FROM tbl_package_category;

-- =====================================================
-- Check for Related Data
-- =====================================================

-- Check if drivers have subscriptions
SELECT 
    d.id AS 'Driver ID',
    d.name AS 'Driver Name',
    d.subscription_status AS 'Subscription Status',
    d.subscription_end_date AS 'End Date',
    COUNT(sh.id) AS 'Subscription History Count'
FROM tbl_driver d
LEFT JOIN tbl_subscription_history sh ON d.id = sh.driver_id
GROUP BY d.id, d.name, d.subscription_status, d.subscription_end_date
HAVING d.subscription_status = 'active' OR COUNT(sh.id) > 0
LIMIT 20;




