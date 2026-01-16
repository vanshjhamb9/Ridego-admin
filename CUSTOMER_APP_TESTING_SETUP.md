# 📱 Customer App Testing Setup Guide

## Quick SQL Query to Add Test Customer

### Copy-Paste Ready Query (Just Replace Phone Number)

```sql
USE ridego_db;

INSERT INTO `tbl_customer` (
    `name`, 
    `country_code`, 
    `phone`, 
    `password`, 
    `status`, 
    `wallet`, 
    `date`
) VALUES (
    'Test Customer',
    '+91',
    '9876543210',  -- ⬅️ REPLACE THIS WITH YOUR PHONE NUMBER
    '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',  -- Password: "password123"
    '1',
    '5000.00',
    CURDATE()
)
ON DUPLICATE KEY UPDATE 
    `status` = '1';
```

---

## Login Credentials

After running the SQL query above, use these credentials to login:

**Endpoint:** `POST http://localhost:8000/customer/login`

**Request Body:**
```json
{
  "ccode": "+91",
  "phone": "9876543210",  // Your phone number
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
  "customer_data": {
    "id": 6,
    "name": "Test Customer",
    "phone": "9876543210",
    "wallet": "5000.00",
    ...
  }
}
```

---

## Postman Request

**Method:** `POST`  
**URL:** `http://localhost:8000/customer/login`  
**Headers:** `Content-Type: application/json`

**Body:**
```json
{
  "ccode": "+91",
  "phone": "9876543210",
  "password": "password123"
}
```

---

## cURL Command

```bash
curl -X POST http://localhost:8000/customer/login \
  -H "Content-Type: application/json" \
  -d '{
    "ccode": "+91",
    "phone": "9876543210",
    "password": "password123"
  }'
```

---

## Custom Password

If you want to use a different password:

### Option 1: Use Node.js
```javascript
const bcrypt = require('bcrypt');
bcrypt.hash('your_password', 10).then(hash => console.log(hash));
```

### Option 2: Use Online Tool
Search for "bcrypt hash generator" online and use the hash it generates.

### Then Update in SQL:
```sql
UPDATE `tbl_customer` 
SET `password` = 'YOUR_NEW_HASH_HERE'
WHERE `country_code` = '+91' 
  AND `phone` = '9876543210';
```

---

## Customer Location

**Important:** Customer location is NOT stored in the database. You send location with each API request:

### Example: Get Nearby Drivers
**Endpoint:** `POST http://localhost:8000/customer/home_mape`

**Request Body:**
```json
{
  "mid": "",
  "lat": "28.6304",   // Your latitude
  "lon": "77.2177"    // Your longitude
}
```

### Example: Create Ride Request
**Endpoint:** `POST http://localhost:8000/customer/add_vehicle_request`

**Request Body:**
```json
{
  "uid": 6,  // Your customer ID from login response
  "driverid": [1],
  "vehicle_id": 1,
  "price": 250,
  "tot_km": 6.2,
  "tot_hour": 0,
  "tot_minute": 25,
  "payment_id": 1,
  "m_role": "normal",
  "coupon_id": "",
  "bidd_auto_status": "false",
  "pickup": [{"latitude": 28.6304, "longitude": 77.2177}],  // Your pickup location
  "drop": [{"latitude": 28.6129, "longitude": 77.2295}],    // Your drop location
  "droplist": [],
  "pickupadd": {"title": "Connaught Place", "subt": "New Delhi"},
  "dropadd": {"title": "India Gate", "subt": "New Delhi"},
  "droplistadd": []
}
```

---

## Verify Customer Was Added

Run this SQL query to check:

```sql
SELECT 
    id,
    name,
    email,
    country_code,
    phone,
    status,
    wallet,
    date
FROM tbl_customer 
WHERE phone = '9876543210';  -- Your phone number
```

---

## Common Issues

### Issue: "PhoneNo Not Exists!"
**Solution:** 
- Make sure you ran the INSERT query successfully
- Check that phone number matches exactly (no spaces, correct country code)

### Issue: "Account Deactivated"
**Solution:** 
- Run: `UPDATE tbl_customer SET status = '1' WHERE phone = 'YOUR_PHONE';`

### Issue: "Password Not match"
**Solution:** 
- Default password is: `password123`
- Or update password hash in database

---

## Complete Testing Flow

1. **Add Customer to Database:**
   ```sql
   INSERT INTO `tbl_customer` (`name`, `country_code`, `phone`, `password`, `status`, `wallet`, `date`)
   VALUES ('Test Customer', '+91', '9876543210', '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1', '5000.00', CURDATE());
   ```

2. **Login:**
   ```bash
   POST http://localhost:8000/customer/login
   Body: {"ccode": "+91", "phone": "9876543210", "password": "password123"}
   ```

3. **Get Nearby Drivers:**
   ```bash
   POST http://localhost:8000/customer/home_mape
   Body: {"mid": "", "lat": "28.6304", "lon": "77.2177"}
   ```

4. **Create Ride Request:**
   ```bash
   POST http://localhost:8000/customer/add_vehicle_request
   Body: { ... (see POSTMAN_CAB_REQUEST.md) }
   ```

---

## Quick Reference

| Field | Value | Notes |
|-------|-------|-------|
| **Country Code** | `+91` | Change if needed |
| **Phone** | `9876543210` | Your phone number |
| **Password** | `password123` | Default password |
| **Status** | `1` | Must be 1 to login |
| **Wallet** | `5000.00` | Initial balance |

---

## Files Created

- `ADD_CUSTOMER_FOR_TESTING.sql` - Complete SQL script with options
- `CUSTOMER_APP_TESTING_SETUP.md` - This quick reference guide
