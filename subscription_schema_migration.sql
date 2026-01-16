-- =====================================================
-- Subscription Schema Migration Script
-- =====================================================
-- This script adds subscription functionality to the Ridego database
-- Run this script if you need to add subscription support to an existing database
-- =====================================================

USE ridego_db;

-- =====================================================
-- Step 1: Add subscription columns to tbl_driver table
-- =====================================================

-- Add subscription columns to tbl_driver
-- Note: If columns already exist, you'll get an error. Comment out the ALTER TABLE statement if needed.

ALTER TABLE `tbl_driver` 
ADD COLUMN `subscription_status` varchar(20) DEFAULT 'none' AFTER `package_status`,
ADD COLUMN `subscription_start_date` datetime DEFAULT NULL AFTER `subscription_status`,
ADD COLUMN `subscription_end_date` datetime DEFAULT NULL AFTER `subscription_start_date`,
ADD COLUMN `current_subscription_plan_id` int(11) DEFAULT NULL AFTER `subscription_end_date`;

-- =====================================================
-- Step 2: Create tbl_subscription_plans table
-- =====================================================

DROP TABLE IF EXISTS `tbl_subscription_plans`;
CREATE TABLE `tbl_subscription_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `validity_days` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =====================================================
-- Step 3: Create tbl_subscription_history table
-- =====================================================

DROP TABLE IF EXISTS `tbl_subscription_history`;
CREATE TABLE `tbl_subscription_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `wallet_transaction_id` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `validity_days` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `driver_id` (`driver_id`),
  KEY `subscription_plan_id` (`subscription_plan_id`),
  CONSTRAINT `fk_subscription_history_driver` FOREIGN KEY (`driver_id`) REFERENCES `tbl_driver` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_subscription_history_plan` FOREIGN KEY (`subscription_plan_id`) REFERENCES `tbl_subscription_plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =====================================================
-- Step 4: Insert default subscription plans
-- =====================================================

INSERT INTO `tbl_subscription_plans` (`name`, `price`, `validity_days`, `is_active`) VALUES
('5 Day Plan', 500.00, 5, 1),
('10 Day Plan', 1000.00, 10, 1),
('30 Day Plan', 2500.00, 30, 1)
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- =====================================================
-- Verification Queries
-- =====================================================

-- Verify subscription columns were added to tbl_driver
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    COLUMN_DEFAULT, 
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'ridego_db' 
  AND TABLE_NAME = 'tbl_driver' 
  AND COLUMN_NAME LIKE 'subscription%';

-- Verify subscription tables were created
SHOW TABLES LIKE 'tbl_subscription%';

-- Verify subscription plans were inserted
SELECT * FROM `tbl_subscription_plans`;

-- =====================================================
-- Migration Complete
-- =====================================================

