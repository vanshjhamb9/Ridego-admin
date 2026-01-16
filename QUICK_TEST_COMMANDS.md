# 🚀 Quick Test Commands - Subscription & Ride Flow

## Base URL
```
http://localhost:8000/driver
```

---

## 📱 SUBSCRIPTION RECHARGE (Main Request)

### Test Subscription Extension (Driver 1 - Has Active Subscription)
```bash
curl -X POST http://localhost:8000/driver/subscription_recharge -H "Content-Type: application/json" -d "{\"uid\": 1, \"subscription_plan_id\": 2}"
```

### Test New Subscription (Driver 4 - No Subscription)
```bash
curl -X POST http://localhost:8000/driver/subscription_recharge -H "Content-Type: application/json" -d "{\"uid\": 4, \"subscription_plan_id\": 2}"
```

**Body Parameters:**
- `uid`: Driver ID (1-5)
- `subscription_plan_id`: Plan ID (1=5day ₹500, 2=10day ₹1000, 3=30day ₹2500, 4=7day ₹700, 5=15day ₹1500)

---

## 🚗 COMPLETE RIDE FLOW TESTING

### Step 1: Driver Goes Online
```bash
curl -X POST http://localhost:8000/driver/update_latlon -H "Content-Type: application/json" -d "{\"id\": 1, \"lat\": \"28.6139\", \"lon\": \"77.2090\", \"live_status\": \"on\"}"
```

### Step 2: Driver Checks for Ride Requests
**📍 THIS IS WHERE DRIVER SEES INCOMING REQUESTS**
```bash
curl -X POST http://localhost:8000/driver/check_vehicle_request -H "Content-Type: application/json" -d "{\"uid\": 1}"
```

### Step 3: Customer Creates Ride Request
```bash
curl -X POST http://localhost:8000/customer/add_vehicle_request -H "Content-Type: application/json" -d "{\"uid\": 1, \"driverid\": [1], \"vehicle_id\": 1, \"price\": 200, \"tot_km\": 5.5, \"tot_hour\": 0, \"tot_minute\": 20, \"payment_id\": 1, \"m_role\": \"normal\", \"coupon_id\": \"\", \"bidd_auto_status\": \"false\", \"pickup\": [{\"latitude\": 28.6139, \"longitude\": 77.2090}], \"drop\": [{\"latitude\": 28.7041, \"longitude\": 77.1025}], \"droplist\": [], \"pickupadd\": {\"title\": \"Connaught Place\", \"subt\": \"New Delhi\"}, \"dropadd\": {\"title\": \"India Gate\", \"subt\": \"New Delhi\"}, \"droplistadd\": []}"
```

### Step 4: Driver Accepts Ride
```bash
curl -X POST http://localhost:8000/driver/accept_vehicle_ride -H "Content-Type: application/json" -d "{\"uid\": 1, \"request_id\": 123, \"lat\": \"28.6139\", \"lon\": \"77.2090\"}"
```
*Replace `123` with actual request_id from Step 3 response*

### Step 5: Driver Arrives
```bash
curl -X POST http://localhost:8000/driver/vehicle_dri_here -H "Content-Type: application/json" -d "{\"uid\": 1, \"request_id\": 123}"
```

### Step 6: Start Ride
```bash
curl -X POST http://localhost:8000/driver/vehicle_ride_start -H "Content-Type: application/json" -d "{\"uid\": 1, \"request_id\": 123, \"otp\": \"1234\"}"
```

### Step 7: End Ride
```bash
curl -X POST http://localhost:8000/driver/vehicle_ride_end -H "Content-Type: application/json" -d "{\"uid\": 1, \"request_id\": 123, \"final_price\": 250}"
```

### Step 8: Complete Payment
```bash
curl -X POST http://localhost:8000/customer/vehicle_ride_complete -H "Content-Type: application/json" -d "{\"uid\": 1, \"request_id\": 123, \"payment_id\": 1, \"payment_img\": \"\"}"
```

---

## 📊 TEST DATA SUMMARY

**Drivers:**
- Driver 1: Wallet ₹5000, Subscription Active (until Jan 20) ✅
- Driver 4: Wallet ₹10000, No Subscription ✅

**Plans:**
- Plan 1: 5 days, ₹500
- Plan 2: 10 days, ₹1000 ⭐ (Good for testing)
- Plan 3: 30 days, ₹2500
- Plan 4: 7 days, ₹700
- Plan 5: 15 days, ₹1500

---

## 🔗 WHERE DRIVER SEES REQUESTS

**Endpoint:** `POST /driver/check_vehicle_request`
- Returns `request_data` array with all pending ride requests
- Driver polls this endpoint to see new requests
- Requests appear when customer calls `/customer/add_vehicle_request`

---

## 📝 POSTMAN/INSOMNIA Format

**Method:** POST  
**URL:** `http://localhost:8000/driver/subscription_recharge`  
**Headers:** `Content-Type: application/json`  
**Body (JSON):**
```json
{
  "uid": 1,
  "subscription_plan_id": 2
}
```
