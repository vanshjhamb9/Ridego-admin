-- =====================================================
-- Disable OneSignal Notifications for Testing
-- =====================================================

USE ridego_db;

-- Clear OneSignal configuration (notifications will be skipped)
-- Safe update mode compatible - using id in WHERE clause
UPDATE tbl_general_settings 
SET one_app_id = NULL, 
    one_api_key = NULL
WHERE id = (SELECT id FROM (SELECT id FROM tbl_general_settings LIMIT 1) AS temp);

-- Verify the update
SELECT 
    one_app_id,
    one_api_key,
    CASE 
        WHEN one_app_id IS NULL AND one_api_key IS NULL THEN 'DISABLED'
        ELSE 'ENABLED'
    END AS notification_status
FROM tbl_general_settings;

-- =====================================================
-- Alternative: Set to empty strings (also disables)
-- =====================================================
-- UPDATE tbl_general_settings 
-- SET one_app_id = '', 
--     one_api_key = ''
-- WHERE id = (SELECT id FROM (SELECT id FROM tbl_general_settings LIMIT 1) AS temp);

