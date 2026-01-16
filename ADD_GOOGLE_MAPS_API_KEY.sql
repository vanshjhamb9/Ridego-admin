-- =====================================================
-- Add Google Maps API Key to Database
-- =====================================================
-- Replace 'YOUR_API_KEY_HERE' with your actual Google Maps API key
-- =====================================================

USE ridego_db;

-- =====================================================
-- STEP 1: Add Your API Key
-- =====================================================
-- Replace 'YOUR_API_KEY_HERE' below with your actual API key

UPDATE tbl_general_settings 
SET google_map_key = 'YOUR_API_KEY_HERE'
WHERE id = 1;

-- =====================================================
-- STEP 2: Verify the Key Was Added
-- =====================================================

SELECT 
    id,
    title,
    CASE 
        WHEN google_map_key IS NULL OR google_map_key = '' THEN '❌ No API Key Set'
        WHEN google_map_key = 'YOUR_API_KEY_HERE' THEN '⚠️ Please Replace with Your Actual Key'
        ELSE CONCAT('✅ API Key Set (', LEFT(google_map_key, 10), '...)')
    END AS api_key_status,
    google_map_key
FROM tbl_general_settings 
WHERE id = 1;

-- =====================================================
-- EXAMPLE: If your key is "AIzaSyB1234567890abcdefghijklmnopqrstuvw"
-- =====================================================
-- UPDATE tbl_general_settings 
-- SET google_map_key = 'AIzaSyB1234567890abcdefghijklmnopqrstuvw'
-- WHERE id = 1;

-- =====================================================
-- NOTES
-- =====================================================
-- 1. After running this query, restart your server
-- 2. The API key will be used automatically for distance calculations
-- 3. If API fails, system falls back to geolib calculation
-- 4. Make sure Distance Matrix API is enabled in Google Cloud Console
