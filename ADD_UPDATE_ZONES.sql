-- =====================================================
-- Add/Update Zones to Cover Customer Locations
-- =====================================================
-- This script adds/updates zones to ensure locations are covered
-- Customer location: 28.6046684, 77.0544941 (Gurugram/New Delhi area)
-- =====================================================

USE ridego_db;

-- =====================================================
-- OPTION 1: Update Existing Zones with Larger Coverage
-- =====================================================
-- Update Central Delhi to cover Gurugram area (expand coverage)

UPDATE `tbl_zone` 
SET `lat_lon` = '28.6139,77.2090'  -- Central Delhi center (covers ~50km radius)
WHERE `id` = 1 
  AND `name` = 'Central Delhi';

UPDATE `tbl_zone` 
SET `lat_lon` = '28.6046,77.0545'  -- Add Gurugram center point
WHERE `id` = 2 
  AND `name` = 'North Delhi';

-- =====================================================
-- OPTION 2: Add New Zone for Gurugram/South Delhi Area
-- =====================================================
-- This adds a new zone that covers the customer's location

INSERT INTO `tbl_zone` (`name`, `status`, `lat_lon`) 
VALUES ('Gurugram', '1', '28.6046,77.0545')
ON DUPLICATE KEY UPDATE `lat_lon` = VALUES(`lat_lon`);

-- Or use this to add with a specific ID:
-- INSERT INTO `tbl_zone` (`id`, `name`, `status`, `lat_lon`) 
-- VALUES (6, 'Gurugram', '1', '28.6046,77.0545')
-- ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- OPTION 3: Update All Zones to Use Proper Center Points
-- =====================================================
-- Update zones with better center points for coverage

UPDATE `tbl_zone` 
SET `lat_lon` = '28.6139,77.2090'  -- Connaught Place area
WHERE `id` = 1;

UPDATE `tbl_zone` 
SET `lat_lon` = '28.7041,77.1025'  -- North Delhi
WHERE `id` = 2;

UPDATE `tbl_zone` 
SET `lat_lon` = '28.5355,77.3910'  -- South Delhi
WHERE `id` = 3;

UPDATE `tbl_zone` 
SET `lat_lon` = '28.6139,77.2090'  -- East Delhi
WHERE `id` = 4;

UPDATE `tbl_zone` 
SET `lat_lon` = '28.4089,77.0378'  -- West Delhi (closest to Gurugram)
WHERE `id` = 5;

-- =====================================================
-- OPTION 4: Add Polygon Zone (Multiple Points)
-- =====================================================
-- If you want to define exact boundaries (polygon format):
-- Format: "lat1,lon1:lat2,lon2:lat3,lon3:lat4,lon4"
-- This creates a rectangular area covering Gurugram

INSERT INTO `tbl_zone` (`name`, `status`, `lat_lon`) 
VALUES (
    'Gurugram Zone', 
    '1', 
    '28.5500,77.0000:28.6500,77.0000:28.6500,77.1500:28.5500,77.1500:28.5500,77.0000'
)
ON DUPLICATE KEY UPDATE `lat_lon` = VALUES(`lat_lon`);

-- =====================================================
-- RECOMMENDED: Quick Fix - Update West Delhi Zone
-- =====================================================
-- West Delhi zone is closest to Gurugram location
-- Update it to a center point that covers both areas

UPDATE `tbl_zone` 
SET `lat_lon` = '28.5000,77.0500'  -- Center between West Delhi and Gurugram
WHERE `id` = 5 
  AND `name` = 'West Delhi';

-- =====================================================
-- VERIFY ZONES
-- =====================================================
-- Check all zones to verify they're set correctly:

SELECT 
    id,
    name,
    status,
    lat_lon,
    CASE 
        WHEN lat_lon LIKE '%:%' THEN 'Polygon (Multiple Points)'
        ELSE 'Single Point (Radius-based)'
    END AS zone_type
FROM tbl_zone
WHERE status = '1'
ORDER BY id;

-- =====================================================
-- NOTES
-- =====================================================
-- 1. Single point zones use 50km radius for coverage
-- 2. Polygon zones use exact boundary checking
-- 3. Your location: 28.6046684, 77.0544941
-- 4. Nearest zone centers:
--    - West Delhi: 28.4089, 77.0378 (22km away)
--    - Central Delhi: 28.6139, 77.2090 (18km away)
--    - Recommended: Add Gurugram zone at 28.6046, 77.0545

-- =====================================================
-- QUICK FIX: Run This to Add Gurugram Zone
-- =====================================================

-- Add Gurugram zone that covers your location:
INSERT INTO `tbl_zone` (`name`, `status`, `lat_lon`) 
VALUES ('Gurugram', '1', '28.6046,77.0545')
ON DUPLICATE KEY UPDATE 
    `name` = 'Gurugram',
    `status` = '1',
    `lat_lon` = '28.6046,77.0545';
