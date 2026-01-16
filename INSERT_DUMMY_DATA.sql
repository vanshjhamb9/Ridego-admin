-- =====================================================
-- Dummy Data Insert Script for Ridego Database
-- =====================================================
-- This script inserts sample data for testing purposes
-- Run this after importing the database schema
-- =====================================================

USE ridego_db;

-- =====================================================
-- 1. ADMIN USERS
-- =====================================================

-- Insert admin users (skip if already exists)
INSERT INTO `tbl_admin` (`id`, `name`, `email`, `country_code`, `phone`, `password`, `role`) VALUES
(1, 'Super Admin', 'admin@ridego.com', '+91', '9999999999', '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1'),
(2, 'Manager', 'manager@ridego.com', '+91', '8888888888', '$2b$10$famWghruCJxXSSqABs/ppuFeMRRT9d6CxyEQiNybRUc0rn2M0uHK2', '2'),
(3, 'Support Staff', 'support@ridego.com', '+91', '7777777777', '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '2')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- 2. SUBSCRIPTION PLANS
-- =====================================================

-- Insert subscription plans (skip if already exists)
INSERT INTO `tbl_subscription_plans` (`id`, `name`, `price`, `validity_days`, `is_active`) VALUES
(1, '5 Day Plan', 500.00, 5, 1),
(2, '10 Day Plan', 1000.00, 10, 1),
(3, '30 Day Plan', 2500.00, 30, 1),
(4, '7 Day Plan', 700.00, 7, 1),
(5, '15 Day Plan', 1500.00, 15, 1)
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- 3. VEHICLES
-- =====================================================

INSERT INTO `tbl_vehicle` (`id`, `name`, `image`, `description`, `min_km_distance`, `min_km_price`, `after_km_price`, `comission_rate`, `comission_type`, `extra_charge`, `passenger_capacity`, `bidding`, `whether_charge`, `status`, `minimum_fare`, `maximum_fare`, `home_visible_status`) VALUES
(1, 'Sedan', '/uploads/vehicle/sedan.png', 'Comfortable sedan for city rides', '2', '50', '10', '15', '%', '20', '4', '0', '0', '1', '', '', '1'),
(2, 'SUV', '/uploads/vehicle/suv.png', 'Spacious SUV for family trips', '2', '80', '15', '15', '%', '30', '6', '0', '0', '1', '', '', '1'),
(3, 'Hatchback', '/uploads/vehicle/hatchback.png', 'Economical hatchback', '2', '40', '8', '15', '%', '15', '4', '0', '0', '1', '', '', '1'),
(4, 'Premium Sedan', '/uploads/vehicle/premium.png', 'Premium sedan with luxury features', '2', '100', '20', '15', '%', '50', '4', '1', '1', '1', '500', '2000', '1'),
(5, 'Luxury', '/uploads/vehicle/luxury.png', 'Luxury vehicle with premium amenities', '2', '150', '30', '15', '%', '100', '4', '1', '1', '1', '1000', '5000', '1')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- 4. DRIVERS
-- =====================================================

INSERT INTO `tbl_driver` (
    `id`, `profile_image`, `first_name`, `last_name`, `email`, 
    `primary_ccode`, `primary_phoneNo`, `password`, 
    `status`, `approval_status`, `wallet`, 
    `latitude`, `longitude`, `fstatus`, `rid_status`,
    `vehicle`, `vehicle_number`, `car_color`, `passenger_capacity`,
    `outstation_status`, `rental_status`, `package_status`,
    `subscription_status`, `subscription_start_date`, `subscription_end_date`, `current_subscription_plan_id`
) VALUES
(1, '/uploads/driver/driver1.jpg', 'Rajesh', 'Kumar', 'rajesh@example.com', '+91', '9876543210', 
 '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '1', 5000.00,
 '28.6139', '77.2090', '1', '0',
 '1', 'DL01AB1234', 'Blue', '4',
 1, 1, 1,
 'active', '2025-01-15 00:00:00', '2025-01-20 23:59:59', 1),

(2, '/uploads/driver/driver2.jpg', 'Amit', 'Sharma', 'amit@example.com', '+91', '9876543211',
 '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '1', 3000.00,
 '28.7041', '77.1025', '1', '0',
 '2', 'DL02CD5678', 'Black', '6',
 1, 1, 1,
 'active', '2025-01-10 00:00:00', '2025-01-20 23:59:59', 2),

(3, '/uploads/driver/driver3.jpg', 'Priya', 'Singh', 'priya@example.com', '+91', '9876543212',
 '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '1', 2000.00,
 '28.5355', '77.3910', '0', '0',
 '3', 'DL03EF9012', 'White', '4',
 1, 1, 1,
 'expired', '2024-12-01 00:00:00', '2024-12-11 23:59:59', 2),

(4, '/uploads/driver/driver4.jpg', 'Vikram', 'Patel', 'vikram@example.com', '+91', '9876543213',
 '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '1', 10000.00,
 '28.4089', '77.0378', '1', '0',
 '4', 'DL04GH3456', 'Silver', '4',
 1, 1, 1,
 'none', NULL, NULL, NULL),

(5, '/uploads/driver/driver5.jpg', 'Sneha', 'Reddy', 'sneha@example.com', '+91', '9876543214',
 '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '1', 7500.00,
 '28.6139', '77.2090', '1', '0',
 '5', 'DL05IJ7890', 'Red', '4',
 1, 1, 1,
 'active', '2025-01-01 00:00:00', '2025-01-31 23:59:59', 3)
ON DUPLICATE KEY UPDATE `first_name` = VALUES(`first_name`);

-- =====================================================
-- 5. CUSTOMERS
-- =====================================================

INSERT INTO `tbl_customer` (`id`, `profile_image`, `name`, `email`, 
    `country_code`, `phone`, `password`, `status`, `wallet`, `date`) VALUES
(1, '/uploads/customer/customer1.jpg', 'Rahul Verma', 'rahul@example.com', '+91', '9123456789',
 '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '2000.00', '2025-01-15'),

(2, '/uploads/customer/customer2.jpg', 'Anjali Mehta', 'anjali@example.com', '+91', '9123456790',
 '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '1500.00', '2025-01-14'),

(3, '/uploads/customer/customer3.jpg', 'Karan Malhotra', 'karan@example.com', '+91', '9123456791',
 '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '3000.00', '2025-01-13'),

(4, '/uploads/customer/customer4.jpg', 'Meera Joshi', 'meera@example.com', '+91', '9123456792',
 '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '1000.00', '2025-01-12'),

(5, '/uploads/customer/customer5.jpg', 'Arjun Nair', 'arjun@example.com', '+91', '9123456793',
 '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '5000.00', '2025-01-11')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- 6. SUBSCRIPTION HISTORY
-- =====================================================

INSERT INTO `tbl_subscription_history` (
    `driver_id`, `subscription_plan_id`, `wallet_transaction_id`, 
    `start_date`, `end_date`, `price`, `validity_days`, `status`
) VALUES
(1, 1, NULL, '2025-01-15 00:00:00', '2025-01-20 23:59:59', 500.00, 5, 'active'),
(2, 2, NULL, '2025-01-10 00:00:00', '2025-01-20 23:59:59', 1000.00, 10, 'active'),
(3, 2, NULL, '2024-12-01 00:00:00', '2024-12-11 23:59:59', 1000.00, 10, 'expired'),
(5, 3, NULL, '2025-01-01 00:00:00', '2025-01-31 23:59:59', 2500.00, 30, 'active')
ON DUPLICATE KEY UPDATE `status` = VALUES(`status`);

-- =====================================================
-- 7. VEHICLE PREFERENCE
-- =====================================================

INSERT INTO `tbl_vehicle_preference` (`id`, `name`, `image`, `status`) VALUES
(1, 'AC', '/uploads/preference/ac.png', '1'),
(2, 'Music', '/uploads/preference/music.png', '1'),
(3, 'WiFi', '/uploads/preference/wifi.png', '1'),
(4, 'Charging Port', '/uploads/preference/charging.png', '1'),
(5, 'Child Seat', '/uploads/preference/childseat.png', '1')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- 8. ZONES
-- =====================================================

INSERT INTO `tbl_zone` (`id`, `name`, `status`, `lat_lon`) VALUES
(1, 'Central Delhi', '1', '28.6139,77.2090'),
(2, 'North Delhi', '1', '28.7041,77.1025'),
(3, 'South Delhi', '1', '28.5355,77.3910'),
(4, 'East Delhi', '1', '28.6139,77.2090'),
(5, 'West Delhi', '1', '28.4089,77.0378')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- 9. GENERAL SETTINGS
-- =====================================================
-- Note: This is a single-row settings table. Only insert if no record exists.

INSERT INTO `tbl_general_settings` (
    `id`, `title`, `site_currency`, `currency_placement`, `thousands_separator`, 
    `google_map_key`, `commission_rate`, `commisiion_type`, `weather_price`, `weather_type`, 
    `signup_credit`, `refer_credit`, `s_min_withdraw`, 
    `one_app_id`, `one_api_key`, `dformat`, `sms_type`,
    `outstation`, `rental`, `package`, `default_payment`, 
    `ride_radius`, `vehicle_radius`, `def_driver`,
    `driver_wait_time`, `driver_wait_price`, `dri_offer_increment`,
    `offer_time`, `offer_expire_time`,
    `out_no_min_free_wait`, `out_after_min_wait_price`, `out_tot_offer_increment`, 
    `out_offer_exprie_time_cus`, `out_offer_exprie_time_dri`,
    `ren_no_min_free_wait`, `ren_after_min_wait_price`, `ren_tot_offer_increment`, 
    `ren_offer_exprie_time_cus`, `ren_offer_exprie_time_dri`,
    `pack_no_min_free_wait`, `pack_after_min_wait_price`, `pack_tot_offer_increment`, 
    `pack_offer_exprie_time_cus`, `pack_offer_exprie_time_dri`
) VALUES (
    1, 'Ridego', '₹', '0', '1',
    NULL, '15', 'fix', '0', 'fix',
    '100', '50', '500',
    NULL, NULL, '0', '1',
    '1', '1', '1', '1',
    '10000', 50.0, '1',
    1.0, 10.0, 10.0,
    120.0, 140.0,
    1.0, 10.0, 10.0, 60.0, 350.0,
    1.0, 10.0, 10.0, 100.0, 60.0,
    2.0, 15.0, 10.0, 60.0, 80.0
)
ON DUPLICATE KEY UPDATE `title` = VALUES(`title`);

-- =====================================================
-- 10. COUPONS
-- =====================================================

INSERT INTO `tbl_coupon` (`id`, `title`, `sub_title`, `code`, `start_date`, `end_date`, `min_amount`, `discount_amount`) VALUES
(1, 'Welcome Offer', 'Get 10% off on your first ride', 'WELCOME100', '2025-01-01', '2025-12-31', '500', '10'),
(2, 'Flat Discount', 'Flat ₹50 off on rides above ₹200', 'FLAT50', '2025-01-01', '2025-12-31', '200', '50'),
(3, 'New User', '20% discount for new users', 'NEWUSER20', '2025-01-01', '2025-12-31', '1000', '20')
ON DUPLICATE KEY UPDATE `title` = VALUES(`title`);

-- =====================================================
-- 11. OUTSTATION CATEGORY
-- =====================================================

INSERT INTO `tbl_outstation_category` (`id`, `image`, `title`, `description`) VALUES
(1, '/uploads/outstation/oneway.png', 'One Way', 'One way outstation trips'),
(2, '/uploads/outstation/roundtrip.png', 'Round Trip', 'Round trip outstation journeys'),
(3, '/uploads/outstation/multicity.png', 'Multi City', 'Multi-city outstation packages')
ON DUPLICATE KEY UPDATE `title` = VALUES(`title`);

-- =====================================================
-- 12. PACKAGE CATEGORY
-- =====================================================

INSERT INTO `tbl_package_category` (`id`, `image`, `name`, `status`) VALUES
(1, '/uploads/package/hourly.png', 'Hourly Package', '1'),
(2, '/uploads/package/daily.png', 'Daily Package', '1'),
(3, '/uploads/package/weekly.png', 'Weekly Package', '1')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- 13. RENTAL
-- =====================================================

INSERT INTO `tbl_rental` (`id`, `image`, `name`, `per_hour_charge`, `per_hour_discount`, `num_of_hour`, `min_far_limit_km`, `after_min_charge`, `after_km_charge`, `comission_rate`, `comission_type`, `extra_charge`, `bidding`, `minimum_fare`, `maximum_fare`, `whether_charge`, `status`) VALUES
(1, '/uploads/rental/economy.png', 'Economy Rental', 500, 50, 1, 5, 10, 8, 15, '%', 20, 0, NULL, NULL, 0, '1'),
(2, '/uploads/rental/standard.png', 'Standard Rental', 800, 80, 1, 5, 15, 12, 15, '%', 30, 0, NULL, NULL, 0, '1'),
(3, '/uploads/rental/premium.png', 'Premium Rental', 1200, 120, 1, 5, 20, 18, 15, '%', 50, 1, 1000, 5000, 1, '1')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- 14. PAYMENT DETAILS
-- =====================================================

INSERT INTO `tbl_payment_detail` (`id`, `name`, `image`, `status`) VALUES
(1, 'Cash', '/uploads/payment_list/cash.png', '1'),
(2, 'Card', '/uploads/payment_list/card.png', '1'),
(3, 'UPI', '/uploads/payment_list/upi.png', '1'),
(4, 'Wallet', '/uploads/payment_list/wallet.png', '1')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- 15. DOCUMENT SETTINGS (if not already exists)
-- =====================================================

-- Check if already exists, if not insert
INSERT INTO `tbl_document_setting` (`id`, `name`, `require_image_side`, `input_require`, `status`, `req_field_name`) VALUES
(1, 'Aadhar Card', '3', '1', '1', 'Aadhar Card Number'),
(5, 'Driving Licence', '2', '0', '1', '')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- 16. VERIFICATION QUERIES (Run after inserting)
-- =====================================================

-- Check inserted data
SELECT 'Admins' AS table_name, COUNT(*) AS count FROM tbl_admin
UNION ALL
SELECT 'Drivers', COUNT(*) FROM tbl_driver
UNION ALL
SELECT 'Customers', COUNT(*) FROM tbl_customer
UNION ALL
SELECT 'Vehicles', COUNT(*) FROM tbl_vehicle
UNION ALL
SELECT 'Subscription Plans', COUNT(*) FROM tbl_subscription_plans
UNION ALL
SELECT 'Subscription History', COUNT(*) FROM tbl_subscription_history
UNION ALL
SELECT 'Zones', COUNT(*) FROM tbl_zone
UNION ALL
SELECT 'Coupons', COUNT(*) FROM tbl_coupon;

-- View drivers with subscriptions
SELECT 
    d.id,
    d.first_name,
    d.last_name,
    d.email,
    d.wallet,
    d.subscription_status,
    sp.name AS plan_name,
    d.subscription_end_date
FROM tbl_driver d
LEFT JOIN tbl_subscription_plans sp ON d.current_subscription_plan_id = sp.id
WHERE d.subscription_status IS NOT NULL;

-- =====================================================
-- END OF DUMMY DATA INSERT
-- =====================================================

