-- =====================================================
-- Check OneSignal Configuration in Database
-- =====================================================

USE ridego_db;

-- Check current OneSignal settings
SELECT 
    one_app_id,
    one_api_key,
    LENGTH(one_app_id) AS app_id_length,
    LENGTH(one_api_key) AS api_key_length,
    CASE 
        WHEN one_app_id IS NULL OR one_app_id = '' THEN 'EMPTY'
        WHEN one_app_id REGEXP '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' THEN 'VALID UUID'
        ELSE 'INVALID FORMAT'
    END AS app_id_status
FROM tbl_general_settings;

-- =====================================================
-- Fix OneSignal Configuration (if needed)
-- =====================================================

-- Option 1: Clear invalid OneSignal settings (notifications will be skipped)
-- UPDATE tbl_general_settings 
-- SET one_app_id = NULL, one_api_key = NULL;

-- Option 2: Set valid OneSignal credentials (replace with your actual values)
-- UPDATE tbl_general_settings 
-- SET one_app_id = 'your-onesignal-app-id-here',
--     one_api_key = 'your-onesignal-api-key-here';

-- =====================================================
-- OneSignal App ID Format
-- =====================================================
-- Should be a UUID format: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
-- Example: 12345678-1234-1234-1234-123456789abc
-- Get your App ID from: https://dashboard.onesignal.com/apps

