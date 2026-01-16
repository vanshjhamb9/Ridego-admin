-- =====================================================
-- Create tbl_wallet_transactions table for subscription-only wallet
-- =====================================================

USE ridego_db;

CREATE TABLE IF NOT EXISTS tbl_wallet_transactions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  driver_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  transaction_type ENUM('wallet_topup','subscription_purchase') NOT NULL,
  reference_id VARCHAR(100) DEFAULT NULL COMMENT 'Payment gateway transaction/order ID',
  subscription_plan_id INT NULL COMMENT 'Only for subscription_purchase type',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_driver_id (driver_id),
  INDEX idx_transaction_type (transaction_type),
  INDEX idx_created_at (created_at),
  FOREIGN KEY (driver_id) REFERENCES tbl_driver(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Verify table was created
SHOW TABLES LIKE 'tbl_wallet_transactions';
DESCRIBE tbl_wallet_transactions;


