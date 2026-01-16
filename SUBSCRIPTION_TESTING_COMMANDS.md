# Subscription Recharge & Driver App Testing Guide

## Server Configuration
- **Base URL**: `http://localhost:8000`
- **Driver API Base**: `http://localhost:8000/driver`
- **Customer API Base**: `http://localhost:8000/customer`

---

## 🧪 Test Data Available

### Drivers (from INSERT_DUMMY_DATA.sql)
| Driver ID | Name | Wallet | Subscription Status | Subscription End Date | Phone |
|-----------|------|--------|---------------------|----------------------|-------|
| 1 | Rajesh Kumar | ₹5000 | active | 2025-01-20 23:59:59 | +91 9876543210 |
| 2 | Amit Sharma | ₹3000 | active | 2025-01-20 23:59:59 | +91 9876543211 |
| 3 | Priya Singh | ₹2000 | expired | 2024-12-11 23:59:59 | +91 9876543212 |
| 4 | Vikram Patel | ₹10000 | none | NULL | +91 9876543213 |
| 5 | Sneha Reddy | ₹7500 | active | 2025-01-31 23:59:59 | +91 9876543214 |

### Subscription Plans
| Plan ID | Name | Price | Validity Days |
|---------|------|-------|---------------|
| 1 | 5 Day Plan | ₹500 | 5 |
| 2 | 10 Day Plan | ₹1000 | 10 |
| 3 | 30 Day Plan | ₹2500 | 30 |
| 4 | 7 Day Plan | ₹700 | 7 |
| 5 | 15 Day Plan | ₹1500 | 15 |

### Customers
| Customer ID | Name | Phone | Wallet |
|-------------|------|-------|--------|
| 1 | Rahul Verma | +91 9123456789 | ₹2000 |
| 2 | Anjali Mehta | +91 9123456790 | ₹1500 |
| 3 | Karan Malhotra | +91 9123456791 | ₹3000 |

---

## 📱 1. SUBSCRIPTION RECHARGE ENDPOINT

### Test Subscription Recharge (POST)

```bash
curl -X POST http://localhost:8000/driver/subscription_recharge \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 4, \"subscription_plan_id\": 2}"
```

**Request Body:**
```json
{
  "uid": 4,
  "subscription_plan_id": 2
}
```

**Parameters:**
- `uid` (required): Driver ID (use 4 for driver with no subscription, or 1 to test extension)
- `subscription_plan_id` (required): Subscription plan ID (1-5)

**Expected Response (New Subscription):**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Subscription activated successfully",
  "subscription_data": {
    "status": "active",
    "subscription_start_date": "2025-01-XX XX:XX:XX",
    "subscription_end_date": "2025-01-XX 23:59:59",
    "subscription_plan_id": 2,
    "subscription_plan_name": "10 Day Plan",
    "remaining_days": 10,
    "is_valid": true
  },
  "wallet_amount": 9000.00
}
```

**Expected Response (Extension - when driver already has active subscription):**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Your subscription has been extended by 10 days. Total validity: 20 days.",
  "subscription_data": {
    "status": "active",
    "subscription_start_date": "2025-01-XX XX:XX:XX",
    "subscription_end_date": "2025-01-XX 23:59:59",
    "subscription_plan_id": 2,
    "subscription_plan_name": "10 Day Plan",
    "remaining_days": 20,
    "is_valid": true
  },
  "extension_info": {
    "previous_end_date": "2025-01-20 23:59:59",
    "new_end_date": "2025-01-XX 23:59:59",
    "days_extended": 10,
    "total_validity_days": 20,
    "remaining_days_from_previous": 10
  },
  "wallet_amount": 4000.00
}
```

### Test Scenarios

#### Scenario 1: New Subscription (Driver ID 4 - No existing subscription)
```bash
curl -X POST http://localhost:8000/driver/subscription_recharge \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 4, \"subscription_plan_id\": 2}"
```
**Expected**: New 10-day subscription from today

#### Scenario 2: Extension (Driver ID 1 - Has active subscription until Jan 20)
```bash
curl -X POST http://localhost:8000/driver/subscription_recharge \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1, \"subscription_plan_id\": 4}"
```
**Expected**: Subscription extended by 7 days (remaining days + 7 days)

#### Scenario 3: Insufficient Wallet Balance
```bash
curl -X POST http://localhost:8000/driver/subscription_recharge \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 3, \"subscription_plan_id\": 3}"
```
**Expected**: Error - "Insufficient wallet balance" (Driver 3 has only ₹2000, plan 3 costs ₹2500)

---

## 📋 2. RELATED SUBSCRIPTION ENDPOINTS

### Get Subscription Plans
```bash
curl -X POST http://localhost:8000/driver/subscription_plans \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1}"
```

### Get Subscription Status
```bash
curl -X POST http://localhost:8000/driver/subscription_status \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1}"
```

---

## 🚗 3. COMPLETE RIDE FLOW TESTING

### Step 1: Driver Goes Online (Updates Location)
**Endpoint**: `POST /driver/update_latlon`

```bash
curl -X POST http://localhost:8000/driver/update_latlon \
  -H "Content-Type: application/json" \
  -d "{\"id\": 1, \"lat\": \"28.6139\", \"lon\": \"77.2090\", \"live_status\": \"on\"}"
```

**Parameters:**
- `id`: Driver ID
- `lat`: Latitude (Delhi coordinates: 28.6139)
- `lon`: Longitude (Delhi coordinates: 77.2090)
- `live_status`: "on" to go online, "off" to go offline

**Note**: This endpoint checks subscription status. If expired, driver cannot go online.

**Expected Response:**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Update Successful"
}
```

**If Subscription Expired:**
```json
{
  "ResponseCode": 200,
  "Result": false,
  "message": "Your subscription has expired. Please recharge to continue."
}
```

---

### Step 2: Driver Checks for Ride Requests
**Endpoint**: `POST /driver/check_vehicle_request`

```bash
curl -X POST http://localhost:8000/driver/check_vehicle_request \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1}"
```

**Expected Response:**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Data Load Successful",
  "general": {...},
  "request_data": [...]
}
```

**📍 This is where drivers see incoming ride requests!** The `request_data` array contains all pending ride requests assigned to this driver.

---

### Step 3: Customer Creates Ride Request
**Endpoint**: `POST /customer/add_vehicle_request`

```bash
curl -X POST http://localhost:8000/customer/add_vehicle_request \
  -H "Content-Type: application/json" \
  -d "{
    \"uid\": 1,
    \"driverid\": [1],
    \"vehicle_id\": 1,
    \"price\": 200,
    \"tot_km\": 5.5,
    \"tot_hour\": 0,
    \"tot_minute\": 20,
    \"payment_id\": 1,
    \"m_role\": \"normal\",
    \"coupon_id\": \"\",
    \"bidd_auto_status\": \"false\",
    \"pickup\": [{\"latitude\": 28.6139, \"longitude\": 77.2090}],
    \"drop\": [{\"latitude\": 28.7041, \"longitude\": 77.1025}],
    \"droplist\": [],
    \"pickupadd\": {\"title\": \"Connaught Place\", \"subt\": \"New Delhi\"},
    \"dropadd\": {\"title\": \"India Gate\", \"subt\": \"New Delhi\"},
    \"droplistadd\": []
  }"
```

**Parameters:**
- `uid`: Customer ID (1-5)
- `driverid`: Array of driver IDs to send request to `[1]`
- `vehicle_id`: Vehicle type ID (1-5)
- `price`: Estimated price
- `tot_km`: Total distance in km
- `pickup`: Array with pickup coordinates
- `drop`: Array with drop coordinates
- `pickupadd`: Pickup address object
- `dropadd`: Drop address object

**Expected Response:**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "We've sent 1 captain requests; they'll confirm shortly.",
  "id": 123
}
```

---

### Step 4: Driver Accepts Ride Request
**Endpoint**: `POST /driver/accept_vehicle_ride`

```bash
curl -X POST http://localhost:8000/driver/accept_vehicle_ride \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1, \"request_id\": 123, \"lat\": \"28.6139\", \"lon\": \"77.2090\"}"
```

**Parameters:**
- `uid`: Driver ID
- `request_id`: Request ID from Step 3 response
- `lat`: Driver current latitude
- `lon`: Driver current longitude

**Expected Response:**
```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "Ride accepted successfully",
  ...
}
```

---

### Step 5: Driver Arrives at Pickup (Optional)
**Endpoint**: `POST /driver/vehicle_dri_here`

```bash
curl -X POST http://localhost:8000/driver/vehicle_dri_here \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1, \"request_id\": 123}"
```

---

### Step 6: Start Ride
**Endpoint**: `POST /driver/vehicle_ride_start`

```bash
curl -X POST http://localhost:8000/driver/vehicle_ride_start \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1, \"request_id\": 123, \"otp\": \"1234\"}"
```

**Note**: OTP is usually generated and sent to customer. For testing, check the database for the OTP or use test OTP if configured.

---

### Step 7: End Ride
**Endpoint**: `POST /driver/vehicle_ride_end`

```bash
curl -X POST http://localhost:8000/driver/vehicle_ride_end \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1, \"request_id\": 123, \"final_price\": 250}"
```

**Parameters:**
- `uid`: Driver ID
- `request_id`: Request ID
- `final_price`: Final ride amount

---

### Step 8: Customer Completes Payment
**Endpoint**: `POST /customer/vehicle_ride_complete`

```bash
curl -X POST http://localhost:8000/customer/vehicle_ride_complete \
  -H "Content-Type: application/json" \
  -d "{
    \"uid\": 1,
    \"request_id\": 123,
    \"payment_id\": 1,
    \"payment_img\": \"\"
  }"
```

---

### Step 9: Add Review (Optional)
**Endpoint**: `POST /driver/add_review`

```bash
curl -X POST http://localhost:8000/driver/add_review \
  -H "Content-Type: application/json" \
  -d "{
    \"uid\": 1,
    \"customer_id\": 1,
    \"request_id\": 123,
    \"rating\": 5,
    \"review\": \"Great ride!\"
  }"
```

---

## 🔍 4. WHERE DRIVERS SEE RIDE REQUESTS

### In Driver App:
1. **Driver goes online** via `/driver/update_latlon` with `live_status: "on"`
2. **Driver checks for requests** via `/driver/check_vehicle_request`
   - This endpoint returns all pending ride requests in `request_data` array
   - Requests appear in real-time when customer creates them via `/customer/add_vehicle_request`
   - Driver receives push notification when request is created

### Real-time Updates:
- The app uses WebSockets/Socket.IO for real-time updates
- When customer creates request, driver gets notification
- Driver can poll `/driver/check_vehicle_request` to see new requests

---

## 📝 5. POSTMAN COLLECTION (Alternative to cURL)

### Import to Postman:

**Collection JSON Structure:**
```json
{
  "info": {
    "name": "Ridego Driver API Testing",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Subscription Recharge",
      "request": {
        "method": "POST",
        "header": [{"key": "Content-Type", "value": "application/json"}],
        "body": {
          "mode": "raw",
          "raw": "{\"uid\": 4, \"subscription_plan_id\": 2}"
        },
        "url": {
          "raw": "http://localhost:8000/driver/subscription_recharge",
          "protocol": "http",
          "host": ["localhost"],
          "port": "8000",
          "path": ["driver", "subscription_recharge"]
        }
      }
    }
  ]
}
```

---

## 🧪 6. TESTING CHECKLIST

### Subscription Testing:
- [ ] Purchase new subscription (driver with no subscription)
- [ ] Extend active subscription (driver with active subscription)
- [ ] Test with insufficient wallet balance
- [ ] Verify subscription_end_date is calculated correctly
- [ ] Verify wallet balance is deducted
- [ ] Verify wallet_transaction is created
- [ ] Verify subscription_history is created
- [ ] Test expired subscription renewal (should start fresh)
- [ ] Test extension with different plan validities

### Ride Flow Testing:
- [ ] Driver goes online (verify subscription check)
- [ ] Customer creates ride request
- [ ] Driver sees request in check_vehicle_request
- [ ] Driver accepts request
- [ ] Driver starts ride
- [ ] Driver ends ride
- [ ] Customer completes payment
- [ ] Verify ride completion in database

---

## 🔧 7. USEFUL TESTING COMMANDS

### Check Driver Subscription Status (SQL)
```sql
SELECT 
    d.id,
    d.first_name,
    d.wallet,
    d.subscription_status,
    d.subscription_start_date,
    d.subscription_end_date,
    sp.name AS plan_name
FROM tbl_driver d
LEFT JOIN tbl_subscription_plans sp ON d.current_subscription_plan_id = sp.id
WHERE d.id = 1;
```

### Check Wallet Transactions
```sql
SELECT * FROM tbl_wallet_transactions 
WHERE driver_id = 1 
ORDER BY created_at DESC 
LIMIT 10;
```

### Check Subscription History
```sql
SELECT * FROM tbl_subscription_history 
WHERE driver_id = 1 
ORDER BY start_date DESC;
```

### Check Active Ride Requests
```sql
SELECT * FROM tbl_request_vehicle 
WHERE status = '0' 
ORDER BY id DESC;
```

---

## 🚀 Quick Test Sequence

**1. Test Subscription Extension:**
```bash
# Driver 1 has active subscription until Jan 20
curl -X POST http://localhost:8000/driver/subscription_recharge \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1, \"subscription_plan_id\": 4}"
```

**2. Driver Goes Online:**
```bash
curl -X POST http://localhost:8000/driver/update_latlon \
  -H "Content-Type: application/json" \
  -d "{\"id\": 1, \"lat\": \"28.6139\", \"lon\": \"77.2090\", \"live_status\": \"on\"}"
```

**3. Check for Requests:**
```bash
curl -X POST http://localhost:8000/driver/check_vehicle_request \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1}"
```

**4. Customer Creates Request:**
```bash
curl -X POST http://localhost:8000/customer/add_vehicle_request \
  -H "Content-Type: application/json" \
  -d "{\"uid\": 1, \"driverid\": [1], \"vehicle_id\": 1, \"price\": 200, \"tot_km\": 5.5, \"tot_hour\": 0, \"tot_minute\": 20, \"payment_id\": 1, \"m_role\": \"normal\", \"coupon_id\": \"\", \"bidd_auto_status\": \"false\", \"pickup\": [{\"latitude\": 28.6139, \"longitude\": 77.2090}], \"drop\": [{\"latitude\": 28.7041, \"longitude\": 77.1025}], \"droplist\": [], \"pickupadd\": {\"title\": \"Connaught Place\", \"subt\": \"New Delhi\"}, \"dropadd\": {\"title\": \"India Gate\", \"subt\": \"New Delhi\"}, \"droplistadd\": []}"
```

---

## 📞 Support

For issues or questions:
- Check server logs at: `console.log` outputs
- Verify database connections
- Check `.env` file configuration
- Review `TESTING_GUIDE.md` for more details
