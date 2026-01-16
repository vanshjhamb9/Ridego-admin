# Subscription API Testing Guide

## Prerequisites
1. Ensure your server is running on localhost (default port 8000)
2. Make sure you have test driver accounts in the database
3. Ensure subscription plans are created in `tbl_subscription_plans` table

## Test Endpoints

### Base URL
```
http://localhost:8000/driver
```

### 1. Get Subscription Plans
**Endpoint:** `POST /driver/subscription_plans`

**Request:**
```json
{
  "uid": 123
}
```

**Expected Response:**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Subscription plans retrieved successfully",
  "plans": [
    {
      "id": 1,
      "name": "5 Day Plan",
      "price": 500.00,
      "validity_days": 5,
      "is_active": 1
    }
  ]
}
```

**Test using cURL:**
```bash
curl -X POST http://localhost:8000/driver/subscription_plans \
  -H "Content-Type: application/json" \
  -d '{"uid": 123}'
```

---

### 2. Get Subscription Status
**Endpoint:** `POST /driver/subscription_status`

**Request:**
```json
{
  "uid": 123
}
```

**Expected Response (No Subscription):**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Subscription status retrieved successfully",
  "subscription_data": {
    "status": "none",
    "subscription_start_date": null,
    "subscription_end_date": null,
    "subscription_plan_id": null,
    "subscription_plan_name": null,
    "remaining_days": 0,
    "is_valid": false
  }
}
```

**Test using cURL:**
```bash
curl -X POST http://localhost:8000/driver/subscription_status \
  -H "Content-Type: application/json" \
  -d '{"uid": 123}'
```

---

### 3. Subscription Recharge
**Endpoint:** `POST /driver/subscription_recharge`

**Request:**
```json
{
  "uid": 123,
  "subscription_plan_id": 1
}
```

**Expected Response (Success):**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Subscription activated successfully"
}
```

**Expected Response (Insufficient Wallet):**
```json
{
  "ResponseCode": 200,
  "Result": false,
  "message": "Insufficient wallet balance. Please recharge your wallet first."
}
```

**Test using cURL:**
```bash
curl -X POST http://localhost:8000/driver/subscription_recharge \
  -H "Content-Type: application/json" \
  -d '{"uid": 123, "subscription_plan_id": 1}'
```

---

### 4. Driver Login (Updated)
**Endpoint:** `POST /driver/login`

**Request:**
```json
{
  "ccode": "+1",
  "phone": "1234567890",
  "password": "password123"
}
```

**Expected Response:**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Login Sccessful",
  "general": {...},
  "status": "0",
  "driver_data": {
    ...existing fields...,
    "subscription_status": "active",
    "subscription_start_date": "2024-01-01 00:00:00",
    "subscription_end_date": "2024-01-06 23:59:59",
    "subscription_plan_id": 1,
    "subscription_plan_name": "5 Day Plan"
  }
}
```

---

### 5. Accept Ride Request (Updated)
**Endpoint:** `POST /driver/accept_vehicle_ride`

**Request:**
```json
{
  "uid": 123,
  "request_id": 456,
  "lat": "40.7128",
  "lon": "-74.0060"
}
```

**Expected Response (Subscription Expired):**
```json
{
  "ResponseCode": 200,
  "Result": false,
  "message": "Your subscription has expired. Please recharge to continue."
}
```

---

### 6. Update Location/Go Online (Updated)
**Endpoint:** `POST /driver/update_latlon`

**Request:**
```json
{
  "id": 123,
  "lat": "40.7128",
  "lon": "-74.0060",
  "live_status": "on"
}
```

**Expected Response (Subscription Expired):**
```json
{
  "ResponseCode": 200,
  "Result": false,
  "message": "Your subscription has expired. Please recharge to continue."
}
```

---

## Testing Checklist

### Setup
- [ ] Create test subscription plans in database
- [ ] Create test driver with sufficient wallet balance
- [ ] Verify database tables exist:
  - `tbl_subscription_plans`
  - `tbl_driver` (with subscription columns)
  - `tbl_transaction_driver`
  - `tbl_subscription_history`

### Test Flow
1. [ ] **Get Subscription Plans** - Verify plans are returned
2. [ ] **Get Subscription Status** - Should return "none" for new driver
3. [ ] **Subscription Recharge** - Activate subscription (ensure driver has enough wallet)
4. [ ] **Get Subscription Status** - Should return "active" with remaining days
5. [ ] **Driver Login** - Verify subscription data is included
6. [ ] **Go Online** - Should succeed with active subscription
7. [ ] **Accept Ride** - Should succeed with active subscription
8. [ ] **Test Expired Subscription** - Manually expire a subscription and verify it's blocked

### Error Cases
- [ ] Test with insufficient wallet balance
- [ ] Test with invalid subscription_plan_id
- [ ] Test accepting ride with expired subscription
- [ ] Test going online with expired subscription

---

## Database Setup

### Required Columns in `tbl_driver`:
```sql
ALTER TABLE tbl_driver 
ADD COLUMN subscription_status VARCHAR(20) DEFAULT 'none',
ADD COLUMN subscription_start_date DATETIME NULL,
ADD COLUMN subscription_end_date DATETIME NULL,
ADD COLUMN current_subscription_plan_id INT NULL;
```

### Create Subscription Plans:
```sql
INSERT INTO tbl_subscription_plans (name, price, validity_days, is_active) VALUES
('5 Day Plan', 500.00, 5, 1),
('10 Day Plan', 1000.00, 10, 1),
('30 Day Plan', 2500.00, 30, 1);
```

### Create Subscription History Table:
```sql
CREATE TABLE IF NOT EXISTS tbl_subscription_history (
  id INT AUTO_INCREMENT PRIMARY KEY,
  driver_id INT NOT NULL,
  subscription_plan_id INT NOT NULL,
  wallet_transaction_id INT NULL,
  start_date DATETIME NOT NULL,
  end_date DATETIME NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  validity_days INT NOT NULL,
  status VARCHAR(20) DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (driver_id) REFERENCES tbl_driver(id),
  FOREIGN KEY (subscription_plan_id) REFERENCES tbl_subscription_plans(id)
);
```

---

## Troubleshooting

1. **"Driver not found" error:**
   - Verify the driver ID exists in `tbl_driver` table

2. **"Subscription plan not found" error:**
   - Check `tbl_subscription_plans` table has active plans
   - Verify `is_active = 1` for the plan

3. **"Insufficient wallet balance" error:**
   - Update driver wallet: `UPDATE tbl_driver SET wallet = 1000 WHERE id = 123;`

4. **Cron job not running:**
   - Check server logs for cron job initialization
   - Verify `node-schedule` is installed

5. **Date format errors:**
   - Ensure database datetime columns accept the format being used
   - Check `AllFunction.TodatDate()` returns correct format

---

## Postman Collection

You can import these endpoints into Postman for easier testing:

1. Create a new collection "Subscription API"
2. Add all endpoints with proper request bodies
3. Set base URL variable: `{{base_url}} = http://localhost:8000/driver`









