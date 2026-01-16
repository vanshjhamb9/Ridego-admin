-- =====================================================
-- Fix Admin Access - Remove Validation Script
-- =====================================================
-- This script removes the subdomain validation that's blocking access
-- Run this in MySQL Workbench to fix the "Administrator Only Allow Subdomain Url!!!" error
-- =====================================================

USE ridego_db;

-- Clear the validation script (this removes the subdomain check)
UPDATE tbl_zippygo_validate SET data = '' WHERE id = 1;

-- Verify it's cleared
SELECT id, 
       CASE 
           WHEN data IS NULL OR data = '' THEN 'Empty (OK for local dev)'
           ELSE CONCAT('Has data (', LENGTH(data), ' chars)')
       END AS status
FROM tbl_zippygo_validate;

-- =====================================================
-- Reset Admin Password to '123'
-- =====================================================
-- The password hash below corresponds to password: 123
-- Using id (primary key) to avoid safe update mode error

UPDATE tbl_admin 
SET password = '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC' 
WHERE id = 1;

-- Or create a new admin if it doesn't exist
INSERT INTO tbl_admin (name, email, country_code, phone, password, role) 
VALUES ('Super Admin', 'admin@ridego.com', '+91', '9999999999', 
        '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1')
ON DUPLICATE KEY UPDATE password = VALUES(password);

-- Verify admin exists
SELECT id, name, email, role FROM tbl_admin WHERE email = 'admin@ridego.com';

-- =====================================================
-- Test Credentials
-- =====================================================
-- Email: admin@ridego.com
-- Password: 123

