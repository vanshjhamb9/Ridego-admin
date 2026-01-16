-- =====================================================
-- Add Wallet Amount for Driver
-- Email: vanshjhamb9@gmail.com
-- Phone: 8769626027
-- =====================================================

USE ridego_db;

-- Step 1: Find the driver by email or phone
SELECT id, first_name, last_name, email, primary_phoneNo, wallet 
FROM tbl_driver 
WHERE email = 'vanshjhamb9@gmail.com' 
   OR primary_phoneNo = '8769626027'
   OR secound_phoneNo = '8769626027';

-- Step 2: Add amount to wallet (replace 1000 with your desired amount)
-- Example: Add ₹1000 to wallet
-- First find the driver ID, then update using ID (required for safe update mode)
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

-- Step 3: Verify the wallet was updated
SELECT id, first_name, last_name, email, primary_phoneNo, wallet 
FROM tbl_driver 
WHERE email = 'vanshjhamb9@gmail.com' 
   OR primary_phoneNo = '8769626027'
   OR secound_phoneNo = '8769626027';

-- Step 4 (Optional): Create a wallet transaction record for tracking
-- First, get the driver ID from the query above, then use it here
-- Replace DRIVER_ID with the actual ID from Step 1
INSERT INTO tbl_wallet_transactions 
(driver_id, amount, transaction_type, reference_id, created_at)
VALUES 
(
    (SELECT id FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1),
    1000,
    'wallet_topup',
    'manual_admin_add',
    NOW()
);

-- =====================================================
-- Quick One-Liner (Safe Update Mode Compatible)
-- =====================================================
-- Replace 1000 with your desired amount
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
-- Add Different Amounts (Examples)
-- =====================================================

-- Add ₹500
UPDATE tbl_driver 
SET wallet = wallet + 500
WHERE id = (SELECT id FROM (SELECT id FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1) AS temp);

-- Add ₹1000
UPDATE tbl_driver 
SET wallet = wallet + 1000
WHERE id = (SELECT id FROM (SELECT id FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1) AS temp);

-- Add ₹5000
UPDATE tbl_driver 
SET wallet = wallet + 5000
WHERE id = (SELECT id FROM (SELECT id FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1) AS temp);

-- =====================================================
-- Set Specific Wallet Amount (instead of adding)
-- =====================================================
-- This sets wallet to exact amount (use with caution)
UPDATE tbl_driver 
SET wallet = 1000
WHERE id = (SELECT id FROM (SELECT id FROM tbl_driver WHERE email = 'vanshjhamb9@gmail.com' OR primary_phoneNo = '8769626027' LIMIT 1) AS temp);

