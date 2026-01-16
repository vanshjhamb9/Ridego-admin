-- =====================================================
-- Fix All Issues: Currency, Subscription Status, Wallet Data
-- =====================================================
-- Run this script to fix:
-- 1. Currency symbol ($ to ₹)
-- 2. Subscription dates (make them current/future)
-- 3. Add wallet transactions for drivers
-- =====================================================

USE ridego_db;

-- 1. Update Currency Symbol to ₹
UPDATE tbl_general_settings 
SET site_currency = '₹' 
WHERE id = 1;

-- 2. Fix Subscription Dates - Make them current/future dates
-- Update active subscriptions to have future end dates
UPDATE tbl_driver 
SET subscription_start_date = DATE_SUB(NOW(), INTERVAL 2 DAY),
    subscription_end_date = DATE_ADD(NOW(), INTERVAL 3 DAY),
    subscription_status = 'active'
WHERE id = 1 AND subscription_status = 'active';

UPDATE tbl_driver 
SET subscription_start_date = DATE_SUB(NOW(), INTERVAL 5 DAY),
    subscription_end_date = DATE_ADD(NOW(), INTERVAL 5 DAY),
    subscription_status = 'active'
WHERE id = 2 AND subscription_status = 'active';

UPDATE tbl_driver 
SET subscription_start_date = DATE_SUB(NOW(), INTERVAL 10 DAY),
    subscription_end_date = DATE_SUB(NOW(), INTERVAL 1 DAY),
    subscription_status = 'expired'
WHERE id = 3 AND subscription_status = 'expired';

UPDATE tbl_driver 
SET subscription_start_date = DATE_SUB(NOW(), INTERVAL 1 DAY),
    subscription_end_date = DATE_ADD(NOW(), INTERVAL 29 DAY),
    subscription_status = 'active'
WHERE id = 5 AND subscription_status = 'active';

-- 3. Update Subscription History dates to match
UPDATE tbl_subscription_history sh
JOIN tbl_driver d ON sh.driver_id = d.id
SET sh.start_date = d.subscription_start_date,
    sh.end_date = d.subscription_end_date,
    sh.status = CASE 
        WHEN d.subscription_end_date >= NOW() THEN 'active'
        ELSE 'expired'
    END
WHERE sh.driver_id IN (1, 2, 3, 5);

-- 4. Add Wallet Transactions for Drivers
-- Driver 1 (Rajesh) - Subscription Recharge
INSERT INTO tbl_transaction_driver (d_id, payment_id, amount, date, status, type)
SELECT 1, 0, sp.price, NOW(), '1', 'subscription_recharge'
FROM tbl_subscription_plans sp
WHERE sp.id = (SELECT current_subscription_plan_id FROM tbl_driver WHERE id = 1)
ON DUPLICATE KEY UPDATE amount = VALUES(amount);

-- Driver 2 (Amit) - Subscription Recharge
INSERT INTO tbl_transaction_driver (d_id, payment_id, amount, date, status, type)
SELECT 2, 0, sp.price, NOW(), '1', 'subscription_recharge'
FROM tbl_subscription_plans sp
WHERE sp.id = (SELECT current_subscription_plan_id FROM tbl_driver WHERE id = 2)
ON DUPLICATE KEY UPDATE amount = VALUES(amount);

-- Driver 5 (Sneha) - Subscription Recharge
INSERT INTO tbl_transaction_driver (d_id, payment_id, amount, date, status, type)
SELECT 5, 0, sp.price, NOW(), '1', 'subscription_recharge'
FROM tbl_subscription_plans sp
WHERE sp.id = (SELECT current_subscription_plan_id FROM tbl_driver WHERE id = 5)
ON DUPLICATE KEY UPDATE amount = VALUES(amount);

-- Add some ride earnings transactions (simulated)
-- Driver 1 - Ride Earnings
INSERT INTO tbl_transaction_driver (d_id, payment_id, amount, date, status, type)
VALUES 
(1, 0, 500.00, DATE_SUB(NOW(), INTERVAL 5 DAY), '1', ''),
(1, 0, 750.00, DATE_SUB(NOW(), INTERVAL 3 DAY), '1', ''),
(1, 0, 300.00, DATE_SUB(NOW(), INTERVAL 1 DAY), '1', '')
ON DUPLICATE KEY UPDATE amount = VALUES(amount);

-- Driver 2 - Ride Earnings
INSERT INTO tbl_transaction_driver (d_id, payment_id, amount, date, status, type)
VALUES 
(2, 0, 400.00, DATE_SUB(NOW(), INTERVAL 4 DAY), '1', ''),
(2, 0, 600.00, DATE_SUB(NOW(), INTERVAL 2 DAY), '1', '')
ON DUPLICATE KEY UPDATE amount = VALUES(amount);

-- Driver 5 (Sneha) - Ride Earnings (to match her wallet balance of 7500)
INSERT INTO tbl_transaction_driver (d_id, payment_id, amount, date, status, type)
VALUES 
(5, 0, 2000.00, DATE_SUB(NOW(), INTERVAL 10 DAY), '1', ''),
(5, 0, 1500.00, DATE_SUB(NOW(), INTERVAL 7 DAY), '1', ''),
(5, 0, 2500.00, DATE_SUB(NOW(), INTERVAL 5 DAY), '1', ''),
(5, 0, 1500.00, DATE_SUB(NOW(), INTERVAL 2 DAY), '1', '')
ON DUPLICATE KEY UPDATE amount = VALUES(amount);

-- 5. Update driver wallets to match transactions
UPDATE tbl_driver d
SET d.wallet = (
    SELECT COALESCE(SUM(CASE WHEN status = '1' THEN amount ELSE 0 END), 0) 
    FROM tbl_transaction_driver 
    WHERE d_id = d.id
)
WHERE d.id IN (1, 2, 3, 4, 5);

-- 6. Verify Updates
SELECT 'Currency Updated:' AS Info;
SELECT site_currency FROM tbl_general_settings WHERE id = 1;

SELECT 'Driver Subscriptions:' AS Info;
SELECT id, first_name, subscription_status, subscription_start_date, subscription_end_date,
    DATEDIFF(subscription_end_date, NOW()) AS remaining_days
FROM tbl_driver 
WHERE id IN (1, 2, 3, 5);

SELECT 'Wallet Transactions Count:' AS Info;
SELECT d_id, COUNT(*) AS transaction_count, SUM(amount) AS total_amount
FROM tbl_transaction_driver
WHERE d_id IN (1, 2, 3, 4, 5)
GROUP BY d_id;

SELECT 'Driver Wallets:' AS Info;
SELECT id, first_name, wallet, payout_wallet
FROM tbl_driver
WHERE id IN (1, 2, 3, 4, 5);






