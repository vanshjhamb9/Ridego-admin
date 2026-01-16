-- =====================================================
-- Update Currency Symbol to Rupees (₹) in Admin Panel
-- =====================================================
-- This script updates the currency symbol from $ or INR to ₹
-- Run this in MySQL Workbench
-- =====================================================

USE ridego_db;

-- Update general settings currency symbol to ₹
UPDATE tbl_general_settings 
SET site_currency = '₹' 
WHERE id = 1;

-- Verify the update
SELECT id, title, site_currency, currency_placement, thousands_separator 
FROM tbl_general_settings 
WHERE id = 1;

-- Note: All views already use general.site_currency dynamically
-- This ensures the currency symbol is ₹ throughout the admin panel






