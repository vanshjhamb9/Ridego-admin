-- =====================================================
-- Fix Customer Password - Reset to "password123"
-- =====================================================
-- Use this if you're getting "Password Not match" error
-- =====================================================

USE ridego_db;

-- =====================================================
-- OPTION 1: Update Password for Your Phone Number
-- =====================================================
-- Replace '9876543210' with your actual phone number
-- Replace '+91' with your country code if different

UPDATE `tbl_customer` 
SET `password` = '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',
    `status` = '1'
WHERE `country_code` = '+91' 
  AND `phone` = '9876543210';  -- ⬅️ REPLACE WITH YOUR PHONE NUMBER

-- =====================================================
-- OPTION 2: Update Password for Customer ID
-- =====================================================
-- If you know the customer ID from login response

UPDATE `tbl_customer` 
SET `password` = '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',
    `status` = '1'
WHERE `id` = 6;  -- ⬅️ REPLACE WITH YOUR CUSTOMER ID

-- =====================================================
-- OPTION 3: Check Current Password Hash
-- =====================================================
-- Run this to see what password hash is currently stored

SELECT 
    id,
    name,
    country_code,
    phone,
    password,  -- This shows the current hash
    status,
    wallet
FROM `tbl_customer` 
WHERE `country_code` = '+91' 
  AND `phone` = '9876543210';  -- ⬅️ REPLACE WITH YOUR PHONE NUMBER

-- =====================================================
-- OPTION 4: Reset ALL Test Customers
-- =====================================================
-- This updates all customers with phone numbers starting with test pattern
-- Use with caution!

-- UPDATE `tbl_customer` 
-- SET `password` = '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',
--     `status` = '1'
-- WHERE `phone` LIKE '9876%' OR `phone` LIKE '9123%';

-- =====================================================
-- VERIFY PASSWORD WAS UPDATED
-- =====================================================
-- Run this after updating to verify:

SELECT 
    id,
    name,
    phone,
    status,
    CASE 
        WHEN password = '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC' 
        THEN 'Password is set to "password123" ✓' 
        ELSE 'Password is different ✗' 
    END AS password_status
FROM `tbl_customer` 
WHERE `country_code` = '+91' 
  AND `phone` = '9876543210';  -- ⬅️ REPLACE WITH YOUR PHONE NUMBER

-- =====================================================
-- PASSWORD INFORMATION
-- =====================================================
-- Hash: $2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC
-- Password: password123
-- 
-- Login with:
--   ccode: +91
--   phone: 9876543210 (your number)
--   password: password123

-- =====================================================
-- TROUBLESHOOTING
-- =====================================================
-- 1. Make sure phone number has NO SPACES: '9876543210' ✓ not '9876 543210' ✗
-- 2. Make sure country code matches: '+91' (with + sign)
-- 3. Make sure status is '1': Run UPDATE to set status = '1'
-- 4. Check if customer exists: Run SELECT query above first
