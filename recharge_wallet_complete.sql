-- =====================================================
-- Complete Wallet Recharge Query with Transaction History
-- =====================================================
-- This query adds money to wallet and creates transaction record
-- =====================================================

USE ridego_db;

-- =====================================================
-- Step 1: Find Driver by Email or Phone
-- =====================================================
SELECT 
    id AS driver_id,
    first_name,
    last_name,
    email,
    primary_phoneNo,
    wallet AS current_wallet_balance
FROM tbl_driver 
WHERE email = 'vanshjhamb9@gmail.com' 
   OR primary_phoneNo = '8769626027'
   OR secound_phoneNo = '8769626027';

-- =====================================================
-- Step 2: Recharge Wallet (Add Amount)
-- =====================================================
-- Replace 1000 with your desired amount
-- This query is safe update mode compatible

UPDATE tbl_driver 
SET wallet = wallet + 1000
WHERE id = (
    SELECT id FROM (
        SELECT id FROM tbl_driver 
        WHERE email = 'vanshjhamb9@gmail.com' 
           OR primary_phoneNo = '8769626027'
           OR secound_phoneNo = '8769626027'
        LIMIT 1
    ) AS temp
);

-- =====================================================
-- Step 3: Create Wallet Transaction Record
-- =====================================================
-- This records the transaction in tbl_wallet_transactions

INSERT INTO tbl_wallet_transactions 
(driver_id, amount, transaction_type, reference_id, created_at)
SELECT 
    id AS driver_id,
    1000 AS amount,
    'wallet_topup' AS transaction_type,
    'manual_admin_recharge' AS reference_id,
    NOW() AS created_at
FROM tbl_driver 
WHERE email = 'vanshjhamb9@gmail.com' 
   OR primary_phoneNo = '8769626027'
   OR secound_phoneNo = '8769626027'
LIMIT 1;

-- =====================================================
-- Step 4: Verify Wallet Balance After Recharge
-- =====================================================
SELECT 
    id AS driver_id,
    first_name,
    last_name,
    email,
    primary_phoneNo,
    wallet AS new_wallet_balance,
    (SELECT COUNT(*) FROM tbl_wallet_transactions WHERE driver_id = tbl_driver.id) AS total_transactions
FROM tbl_driver 
WHERE email = 'vanshjhamb9@gmail.com' 
   OR primary_phoneNo = '8769626027'
   OR secound_phoneNo = '8769626027';

-- =====================================================
-- Step 5: View Complete Transaction History
-- =====================================================
SELECT 
    wt.id AS transaction_id,
    wt.driver_id,
    d.first_name,
    d.last_name,
    d.email,
    wt.amount,
    wt.transaction_type,
    wt.reference_id,
    wt.subscription_plan_id,
    wt.created_at AS transaction_date,
    CASE 
        WHEN wt.transaction_type = 'wallet_topup' THEN 'Credit (+)'
        WHEN wt.transaction_type = 'subscription_purchase' THEN 'Debit (-)'
        ELSE wt.transaction_type
    END AS transaction_nature
FROM tbl_wallet_transactions wt
INNER JOIN tbl_driver d ON wt.driver_id = d.id
WHERE d.email = 'vanshjhamb9@gmail.com' 
   OR d.primary_phoneNo = '8769626027'
   OR d.secound_phoneNo = '8769626027'
ORDER BY wt.created_at DESC;

-- =====================================================
-- Step 6: Wallet Summary (Balance + Transaction Count)
-- =====================================================
SELECT 
    d.id AS driver_id,
    d.first_name,
    d.last_name,
    d.email,
    d.primary_phoneNo,
    d.wallet AS current_balance,
    COUNT(wt.id) AS total_transactions,
    COALESCE(SUM(CASE WHEN wt.transaction_type = 'wallet_topup' THEN wt.amount ELSE 0 END), 0) AS total_credited,
    COALESCE(SUM(CASE WHEN wt.transaction_type = 'subscription_purchase' THEN wt.amount ELSE 0 END), 0) AS total_debited,
    (COALESCE(SUM(CASE WHEN wt.transaction_type = 'wallet_topup' THEN wt.amount ELSE 0 END), 0) - 
     COALESCE(SUM(CASE WHEN wt.transaction_type = 'subscription_purchase' THEN wt.amount ELSE 0 END), 0)) AS calculated_balance
FROM tbl_driver d
LEFT JOIN tbl_wallet_transactions wt ON d.id = wt.driver_id
WHERE d.email = 'vanshjhamb9@gmail.com' 
   OR d.primary_phoneNo = '8769626027'
   OR d.secound_phoneNo = '8769626027'
GROUP BY d.id, d.first_name, d.last_name, d.email, d.primary_phoneNo, d.wallet;

-- =====================================================
-- Quick Recharge (All-in-One Query)
-- =====================================================
-- Replace 1000 with your desired amount
-- This does everything in one go

-- Update wallet
UPDATE tbl_driver 
SET wallet = wallet + 1000
WHERE id = (
    SELECT id FROM (
        SELECT id FROM tbl_driver 
        WHERE email = 'vanshjhamb9@gmail.com' 
           OR primary_phoneNo = '8769626027'
        LIMIT 1
    ) AS temp
);

-- Create transaction
INSERT INTO tbl_wallet_transactions 
(driver_id, amount, transaction_type, reference_id, created_at)
SELECT 
    id,
    1000,
    'wallet_topup',
    CONCAT('manual_recharge_', NOW()),
    NOW()
FROM tbl_driver 
WHERE email = 'vanshjhamb9@gmail.com' 
   OR primary_phoneNo = '8769626027'
LIMIT 1;

-- =====================================================
-- Common Amount Examples
-- =====================================================

-- Add ₹500
-- UPDATE tbl_driver SET wallet = wallet + 500 WHERE id = (SELECT id FROM (SELECT id FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1) AS temp);
-- INSERT INTO tbl_wallet_transactions (driver_id, amount, transaction_type, reference_id) SELECT id, 500, 'wallet_topup', 'manual_recharge' FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1;

-- Add ₹1000
-- UPDATE tbl_driver SET wallet = wallet + 1000 WHERE id = (SELECT id FROM (SELECT id FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1) AS temp);
-- INSERT INTO tbl_wallet_transactions (driver_id, amount, transaction_type, reference_id) SELECT id, 1000, 'wallet_topup', 'manual_recharge' FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1;

-- Add ₹5000
-- UPDATE tbl_driver SET wallet = wallet + 5000 WHERE id = (SELECT id FROM (SELECT id FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1) AS temp);
-- INSERT INTO tbl_wallet_transactions (driver_id, amount, transaction_type, reference_id) SELECT id, 5000, 'wallet_topup', 'manual_recharge' FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1;

