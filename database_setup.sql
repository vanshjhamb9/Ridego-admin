-- =====================================================
-- Ridego Admin Panel - Database Setup Script
-- =====================================================
-- This script creates the database and sets up basic structure
-- Run this script in MySQL Workbench after connecting to your local MySQL server
-- =====================================================

-- Step 1: Create the database (if it doesn't exist)
-- This will create a database with UTF8MB4 character set for proper Unicode support
CREATE DATABASE IF NOT EXISTS ridego_db 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- Step 2: Use the database
USE ridego_db;

-- =====================================================
-- Note: The following are example table structures
-- You should import your actual database schema/dump file here
-- =====================================================

-- Example: Create a basic validation table (referenced in app.js)
-- This table is used by the application for validation checks
CREATE TABLE IF NOT EXISTS tbl_zippygo_validate (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert a default validation record (if needed)
INSERT INTO tbl_zippygo_validate (data) 

VALUES ('') 
ON DUPLICATE KEY UPDATE data = data;

-- =====================================================
-- Database Verification Queries
-- =====================================================

-- Verify database was created
SELECT 'Database created successfully' AS Status, 
       DATABASE() AS CurrentDatabase,
       @@character_set_database AS CharacterSet,
       @@collation_database AS Collation;

-- Show all tables in the database
SHOW TABLES;

-- =====================================================
-- Common Setup Queries (Run as needed)
-- =====================================================

-- Check MySQL version
SELECT VERSION() AS MySQLVersion;

-- Check current user and host
SELECT USER() AS CurrentUser, 
       CURRENT_USER() AS CurrentUserHost;

-- Show database size
SELECT 
    table_schema AS 'Database',
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'Size (MB)'
FROM information_schema.tables
WHERE table_schema = 'ridego_db'
GROUP BY table_schema;

-- =====================================================
-- User Management (Optional - Create dedicated user)
-- =====================================================

-- Uncomment and modify the following to create a dedicated database user
-- This is more secure than using root user

/*
CREATE USER IF NOT EXISTS 'ridego_user'@'localhost' IDENTIFIED BY 'your_secure_password';

-- Grant all privileges on ridego_db database
GRANT ALL PRIVILEGES ON ridego_db.* TO 'ridego_user'@'localhost';

-- Grant privileges on all databases (if needed for migrations)
-- GRANT ALL PRIVILEGES ON *.* TO 'ridego_user'@'localhost';

-- Apply the changes
FLUSH PRIVILEGES;

-- Verify user was created
SELECT User, Host FROM mysql.user WHERE User = 'ridego_user';
*/

-- =====================================================
-- Import Instructions
-- =====================================================

-- If you have a database dump file (.sql), import it using:
-- 1. MySQL Workbench: Server → Data Import → Import from Self-Contained File
-- 2. Command Line: mysql -u root -p ridego_db < your_dump_file.sql
-- 3. Or copy-paste the SQL dump content into MySQL Workbench query editor

-- =====================================================
-- Connection Test Query
-- =====================================================

-- Test the connection and database access
SELECT 
    'Connection successful!' AS Status,
    NOW() AS CurrentTime,
    DATABASE() AS DatabaseName,
    CONNECTION_ID() AS ConnectionID;







