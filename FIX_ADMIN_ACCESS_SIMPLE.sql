-- =====================================================
-- Fix Admin Access - Simple Version
-- =====================================================
-- Run these queries one by one in MySQL Workbench
-- =====================================================

USE ridego_db;

-- Step 1: Clear the validation script
UPDATE tbl_zippygo_validate SET data = '' WHERE id = 1;

-- Step 2: Reset admin password using primary key (id)
UPDATE tbl_admin 
SET password = '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC' 
WHERE id = 1;

-- Step 3: Verify admin exists and check email
SELECT id, name, email, role FROM tbl_admin WHERE id = 1;

-- =====================================================
-- Login Credentials:
-- Email: admin@ridego.com (or check the email from Step 3)
-- Password: 123
-- =====================================================






