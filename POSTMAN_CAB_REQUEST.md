# 📮 Postman Request - Send Cab Request to Driver

## Endpoint Configuration

**Method:** `POST`  
**URL:** `http://localhost:8000/customer/add_vehicle_request`  
**Headers:**
```
Content-Type: application/json
```

---

## Request Body (JSON)

### Option 1: Connaught Place to India Gate (Popular Route)
```json
{
  "uid": 1,
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
  "pickup": [
    {
      "latitude": 28.6304,
      "longitude": 77.2177
    }
  ],
  "drop": [
    {
      "latitude": 28.6129,
      "longitude": 77.2295
    }
  ],
  "droplist": [],
  "pickupadd": {
    "title": "Connaught Place",
    "subt": "New Delhi, Delhi 110001"
  },
  "dropadd": {
    "title": "India Gate",
    "subt": "Rajpath, New Delhi, Delhi 110003"
  },
  "droplistadd": []
}
```

---

### Option 2: IGI Airport to Connaught Place (Airport Transfer)
```json
{
  "uid": 1,
  "driverid": [1],
  "vehicle_id": 1,
  "price": 450,
  "tot_km": 18.5,
  "tot_hour": 0,
  "tot_minute": 45,
  "payment_id": 1,
  "m_role": "normal",
  "coupon_id": "",
  "bidd_auto_status": "false",
  "pickup": [
    {
      "latitude": 28.5562,
      "longitude": 77.1000
    }
  ],
  "drop": [
    {
      "latitude": 28.6304,
      "longitude": 77.2177
    }
  ],
  "droplist": [],
  "pickupadd": {
    "title": "Indira Gandhi International Airport",
    "subt": "New Delhi, Delhi 110037"
  },
  "dropadd": {
    "title": "Connaught Place",
    "subt": "New Delhi, Delhi 110001"
  },
  "droplistadd": []
}
```

---

### Option 3: Red Fort to India Gate (Tourist Route)
```json
{
  "uid": 1,
  "driverid": [1],
  "vehicle_id": 1,
  "price": 180,
  "tot_km": 4.8,
  "tot_hour": 0,
  "tot_minute": 18,
  "payment_id": 1,
  "m_role": "normal",
  "coupon_id": "",
  "bidd_auto_status": "false",
  "pickup": [
    {
      "latitude": 28.6562,
      "longitude": 77.2410
    }
  ],
  "drop": [
    {
      "latitude": 28.6129,
      "longitude": 77.2295
    }
  ],
  "droplist": [],
  "pickupadd": {
    "title": "Red Fort",
    "subt": "Netaji Subhash Marg, Lal Qila, Old Delhi, Delhi 110006"
  },
  "dropadd": {
    "title": "India Gate",
    "subt": "Rajpath, New Delhi, Delhi 110003"
  },
  "droplistadd": []
}
```

---

### Option 4: Multiple Destinations (with droplist)
```json
{
  "uid": 1,
  "driverid": [1],
  "vehicle_id": 1,
  "price": 500,
  "tot_km": 12.5,
  "tot_hour": 1,
  "tot_minute": 30,
  "payment_id": 1,
  "m_role": "normal",
  "coupon_id": "",
  "bidd_auto_status": "false",
  "pickup": [
    {
      "latitude": 28.6304,
      "longitude": 77.2177
    }
  ],
  "drop": [
    {
      "latitude": 28.6129,
      "longitude": 77.2295
    }
  ],
  "droplist": [
    {
      "latitude": 28.5355,
      "longitude": 77.3910
    },
    {
      "latitude": 28.7041,
      "longitude": 77.1025
    }
  ],
  "pickupadd": {
    "title": "Connaught Place",
    "subt": "New Delhi, Delhi 110001"
  },
  "dropadd": {
    "title": "India Gate",
    "subt": "Rajpath, New Delhi, Delhi 110003"
  },
  "droplistadd": [
    {
      "title": "South Delhi",
      "subt": "New Delhi"
    },
    {
      "title": "North Delhi",
      "subt": "New Delhi"
    }
  ]
}
```

---

## Real Delhi Coordinates Reference

| Location | Latitude | Longitude | Address |
|----------|----------|-----------|---------|
| **Connaught Place** | 28.6304 | 77.2177 | New Delhi, Delhi 110001 |
| **India Gate** | 28.6129 | 77.2295 | Rajpath, New Delhi, Delhi 110003 |
| **Red Fort** | 28.6562 | 77.2410 | Old Delhi, Delhi 110006 |
| **IGI Airport** | 28.5562 | 77.1000 | New Delhi, Delhi 110037 |
| **Akshardham Temple** | 28.6127 | 77.2772 | Noida Mor, New Delhi, Delhi 110092 |
| **Lotus Temple** | 28.5535 | 77.2588 | Kalkaji, New Delhi, Delhi 110019 |
| **Qutub Minar** | 28.5245 | 77.1855 | Mehrauli, New Delhi, Delhi 110030 |
| **DLF Cyber Hub** | 28.4946 | 77.0914 | Sector 25, Gurugram, Haryana 122002 |

---

## Parameters Explanation

| Parameter | Type | Required | Description | Example |
|-----------|------|----------|-------------|---------|
| `uid` | number | ✅ Yes | Customer ID | `1` |
| `driverid` | array | ✅ Yes | Array of Driver IDs to send request | `[1]` or `[1, 2]` |
| `vehicle_id` | number | ✅ Yes | Vehicle Type ID (1=Sedan, 2=SUV, etc.) | `1` |
| `price` | number | ✅ Yes | Estimated ride price | `250` |
| `tot_km` | number | ✅ Yes | Total distance in kilometers | `6.2` |
| `tot_hour` | number | ✅ Yes | Estimated hours (0 for normal rides) | `0` |
| `tot_minute` | number | ✅ Yes | Estimated minutes | `25` |
| `payment_id` | number | ✅ Yes | Payment method (1=Cash, 2=Card, etc.) | `1` |
| `m_role` | string | ✅ Yes | Ride type: "normal", "outstation", "rental", "package" | `"normal"` |
| `coupon_id` | string | ✅ Yes | Coupon code (empty string if none) | `""` or `"WELCOME100"` |
| `bidd_auto_status` | string | ✅ Yes | Auto bidding: "true" or "false" | `"false"` |
| `pickup` | array | ✅ Yes | Array with pickup coordinates | See examples |
| `drop` | array | ✅ Yes | Array with drop coordinates | See examples |
| `droplist` | array | ✅ Yes | Additional stops (empty array if none) | `[]` |
| `pickupadd` | object | ✅ Yes | Pickup address with title and subt | See examples |
| `dropadd` | object | ✅ Yes | Drop address with title and subt | See examples |
| `droplistadd` | array | ✅ Yes | Additional stop addresses (empty if none) | `[]` |

---

## Postman Collection (JSON Format)

You can import this directly into Postman:

```json
{
  "info": {
    "name": "Ridego - Send Cab Request",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Send Cab Request - Connaught Place to India Gate",
      "request": {
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n  \"uid\": 1,\n  \"driverid\": [1],\n  \"vehicle_id\": 1,\n  \"price\": 250,\n  \"tot_km\": 6.2,\n  \"tot_hour\": 0,\n  \"tot_minute\": 25,\n  \"payment_id\": 1,\n  \"m_role\": \"normal\",\n  \"coupon_id\": \"\",\n  \"bidd_auto_status\": \"false\",\n  \"pickup\": [\n    {\n      \"latitude\": 28.6304,\n      \"longitude\": 77.2177\n    }\n  ],\n  \"drop\": [\n    {\n      \"latitude\": 28.6129,\n      \"longitude\": 77.2295\n    }\n  ],\n  \"droplist\": [],\n  \"pickupadd\": {\n    \"title\": \"Connaught Place\",\n    \"subt\": \"New Delhi, Delhi 110001\"\n  },\n  \"dropadd\": {\n    \"title\": \"India Gate\",\n    \"subt\": \"Rajpath, New Delhi, Delhi 110003\"\n  },\n  \"droplistadd\": []\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "http://localhost:8000/customer/add_vehicle_request",
          "protocol": "http",
          "host": ["localhost"],
          "port": "8000",
          "path": ["customer", "add_vehicle_request"]
        }
      },
      "response": []
    }
  ]
}
```

---

## Expected Response (Success)

```json
{
  "ResponseCode": 200,
  "Result": true,
  "message": "We've sent 1 captain requests; they'll confirm shortly.",
  "id": 123
}
```

The `id` field contains the request_id that you'll need for subsequent operations (accept, start, end ride).

---

## Testing Steps

1. **Import into Postman:** Copy any of the JSON request bodies above
2. **Set URL:** `http://localhost:8000/customer/add_vehicle_request`
3. **Set Method:** `POST`
4. **Set Headers:** `Content-Type: application/json`
5. **Set Body:** Paste the JSON (choose raw, JSON format)
6. **Send Request:** Click Send

**Driver will see this request when they call:**
```bash
POST http://localhost:8000/driver/check_vehicle_request
Body: {"uid": 1}
```

---

## Quick Copy-Paste for Postman

**Method:** `POST`  
**URL:** `http://localhost:8000/customer/add_vehicle_request`  
**Body (raw JSON):**
```json
{
  "uid": 1,
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
  "pickup": [{"latitude": 28.6304, "longitude": 77.2177}],
  "drop": [{"latitude": 28.6129, "longitude": 77.2295}],
  "droplist": [],
  "pickupadd": {"title": "Connaught Place", "subt": "New Delhi, Delhi 110001"},
  "dropadd": {"title": "India Gate", "subt": "Rajpath, New Delhi, Delhi 110003"},
  "droplistadd": []
}
```
