-- =====================================================
-- SQL Query to Add Test Customer for Customer App Testing
-- =====================================================
-- This script adds a customer that can login directly without OTP
-- =====================================================

USE ridego_db;

-- =====================================================
-- OPTION 1: Add Customer with Your Phone Number
-- =====================================================
-- Replace the values below with your actual details:
-- - Replace 'YOUR_PHONE_NUMBER' with your phone (e.g., '9876543210')
-- - Replace 'YOUR_NAME' with your name (e.g., 'Test User')
-- - Replace 'YOUR_EMAIL' with your email (e.g., 'test@example.com')
-- - Replace '+91' with your country code if different

INSERT INTO `tbl_customer` (
    `profile_image`, 
    `name`, 
    `email`, 
    `country_code`, 
    `phone`, 
    `password`, 
    `status`, 
    `wallet`, 
    `date`
) VALUES (
    '/uploads/customer/default.jpg',  -- Profile image path (can be empty string if no image)
    'Test User',                       -- Your name
    'test@example.com',               -- Your email
    '+91',                            -- Country code (e.g., '+91' for India, '+1' for US)
    '9876543210',                     -- YOUR PHONE NUMBER (10 digits, no spaces)
    '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',  -- Password hash for "password123"
    '1',                              -- Status: '1' = Active (can login), '0' = Inactive
    '5000.00',                        -- Wallet balance (in rupees/currency)
    CURDATE()                         -- Current date
)
ON DUPLICATE KEY UPDATE 
    `name` = VALUES(`name`),
    `status` = '1',
    `wallet` = VALUES(`wallet`);

-- =====================================================
-- OPTION 2: Quick Insert with Minimal Fields
-- =====================================================
-- If you just want to add quickly, use this (replace phone number):

INSERT INTO `tbl_customer` (
    `name`, 
    `country_code`, 
    `phone`, 
    `password`, 
    `status`, 
    `wallet`, 
    `date`
) VALUES (
    'Test Customer',
    '+91',
    '9876543210',  -- YOUR PHONE NUMBER HERE
    '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',  -- Password: "password123"
    '1',
    '5000.00',
    CURDATE()
)
ON DUPLICATE KEY UPDATE 
    `status` = '1';

-- =====================================================
-- PASSWORD INFORMATION
-- =====================================================
-- The password hash above corresponds to: "password123"
-- You can login with:
--   Country Code: +91 (or your country code)
--   Phone: 9876543210 (your phone number)
--   Password: password123

-- =====================================================
-- TO GENERATE YOUR OWN PASSWORD HASH
-- =====================================================
-- If you want a different password, you need to generate a bcrypt hash.
-- You can use Node.js to generate it:
--
-- Run this in Node.js console:
-- const bcrypt = require('bcrypt');
-- bcrypt.hash('your_password', 10).then(hash => console.log(hash));
--
-- Or use online bcrypt generator (search "bcrypt hash generator")

-- =====================================================
-- VERIFY CUSTOMER WAS ADDED
-- =====================================================
-- Run this query to check if customer was added successfully:

SELECT 
    id,
    name,
    email,
    country_code,
    phone,
    status,
    wallet,
    date
FROM tbl_customer 
WHERE phone = '9876543210';  -- Replace with your phone number

-- =====================================================
-- UPDATE EXISTING CUSTOMER (If Already Exists)
-- =====================================================
-- If customer already exists, use this to update:

UPDATE `tbl_customer` 
SET 
    `name` = 'Test User',
    `status` = '1',
    `wallet` = '5000.00',
    `password` = '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC'
WHERE `country_code` = '+91' 
  AND `phone` = '9876543210';  -- Replace with your phone number

-- =====================================================
-- DELETE TEST CUSTOMER (If Needed)
-- =====================================================
-- To remove the test customer:

-- DELETE FROM `tbl_customer` 
-- WHERE `country_code` = '+91' 
--   AND `phone` = '9876543210';  -- Replace with your phone number

-- =====================================================
-- LOGIN CREDENTIALS SUMMARY
-- =====================================================
-- After running the INSERT query above, you can login with:
--
-- Endpoint: POST http://localhost:8000/customer/login
-- Body:
-- {
--   "ccode": "+91",
--   "phone": "9876543210",
--   "password": "password123"
-- }
--
-- Replace:
--   - "ccode" with your country code
--   - "phone" with your phone number
--   - "password" is "password123" (or generate your own hash)

-- =====================================================
-- NOTES
-- =====================================================
-- 1. Customer location (latitude/longitude) is NOT stored in the database
--    - Location is sent with each request (home_mape, add_vehicle_request, etc.)
--    - You can send your location in API requests
--
-- 2. No OTP Required:
--    - The login endpoint only checks phone + password
--    - No OTP verification is needed if customer exists
--
-- 3. Status Must Be '1':
--    - status = '1' means active (can login)
--    - status = '0' means inactive (cannot login)
--
-- 4. Wallet Balance:
--    - Set initial wallet balance for testing
--    - Can be updated later via wallet APIs
