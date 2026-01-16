-- =====================================================
-- SQL Queries to View All Tables in ridego_db
-- =====================================================

-- Method 1: Show all tables in the current database
SHOW TABLES;

-- Method 2: Show all tables with more details
SHOW TABLES FROM ridego_db;

-- Method 3: Get table count
SELECT COUNT(*) AS total_tables 
FROM information_schema.tables 
WHERE table_schema = 'ridego_db';

-- Method 4: List all tables with their row counts
SELECT 
    TABLE_NAME AS 'Table Name',
    TABLE_ROWS AS 'Row Count',
    ROUND(((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024), 2) AS 'Size (MB)',
    TABLE_TYPE AS 'Type'
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'ridego_db'
ORDER BY TABLE_NAME;

-- Method 5: Show all tables with creation time
SELECT 
    TABLE_NAME AS 'Table Name',
    CREATE_TIME AS 'Created',
    UPDATE_TIME AS 'Last Updated',
    TABLE_ROWS AS 'Rows',
    ROUND(((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024), 2) AS 'Size (MB)'
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'ridego_db'
ORDER BY CREATE_TIME DESC;

-- Method 6: Show table structure for a specific table (example: tbl_driver)
-- Replace 'tbl_driver' with any table name
DESCRIBE tbl_driver;

-- Method 7: Show CREATE TABLE statement for a specific table
-- Replace 'tbl_driver' with any table name
SHOW CREATE TABLE tbl_driver;

-- Method 8: List all tables starting with 'tbl_'
SELECT TABLE_NAME 
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'ridego_db'
AND TABLE_NAME LIKE 'tbl_%'
ORDER BY TABLE_NAME;

-- Method 9: Get detailed information about all tables
SELECT 
    t.TABLE_NAME AS 'Table Name',
    t.TABLE_ROWS AS 'Row Count',
    t.DATA_LENGTH AS 'Data Size (bytes)',
    t.INDEX_LENGTH AS 'Index Size (bytes)',
    t.DATA_FREE AS 'Free Space (bytes)',
    t.ENGINE AS 'Storage Engine',
    t.TABLE_COLLATION AS 'Collation'
FROM information_schema.TABLES t
WHERE t.TABLE_SCHEMA = 'ridego_db'
ORDER BY t.TABLE_NAME;

-- Method 10: Show all tables and their column count
SELECT 
    TABLE_NAME AS 'Table Name',
    COUNT(COLUMN_NAME) AS 'Column Count'
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'ridego_db'
GROUP BY TABLE_NAME
ORDER BY TABLE_NAME;




