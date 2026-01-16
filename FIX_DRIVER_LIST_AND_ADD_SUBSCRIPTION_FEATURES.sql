-- =====================================================
-- Fix Driver List Query Issue
-- =====================================================
-- The driver list uses JOIN which requires vehicle to exist
-- This query checks if drivers have vehicles assigned
-- =====================================================

USE ridego_db;

-- Check drivers and their vehicle assignments
SELECT 
    d.id,
    d.first_name,
    d.last_name,
    d.email,
    d.vehicle,
    v.name AS vehicle_name,
    d.subscription_status,
    d.subscription_end_date
FROM tbl_driver d
LEFT JOIN tbl_vehicle v ON d.vehicle = v.id;

-- If vehicle is NULL or empty, update it to a valid vehicle ID
-- First, get a valid vehicle ID
SELECT id, name FROM tbl_vehicle LIMIT 1;

-- Then update drivers without vehicles (if needed)
-- UPDATE tbl_driver SET vehicle = 1 WHERE vehicle IS NULL OR vehicle = '';






