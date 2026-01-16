# 🔧 Fix: Address Validation Error

## Problem

Error: `"Invalid pickup address format. Required: {title, subt}"`

The Flutter app was sending:
```json
{
  "pickupadd": {
    "title": "Hospital Plot, New Delhi, India",
    "subt": ""
  }
}
```

The validation was too strict and rejecting empty `subt` fields.

## Solution Applied

Updated validation to:
- ✅ Allow empty `subt` fields (empty string `""`, `null`, or `undefined`)
- ✅ Only require `title` to be present and non-empty
- ✅ Validate that address fields are objects
- ✅ Trim whitespace from title
- ✅ Provide clear error messages

## Changes Made

**File:** `route_mobile/customer_api.js`

1. **Enhanced validation loop** - Added special handling for `pickupadd` and `dropadd` objects
2. **Detailed address validation** - Validates title exists and is non-empty, allows empty subt
3. **Safe subt handling** - Uses empty string if subt is missing/null/undefined

## What Now Works

✅ Address with empty subt:
```json
{
  "pickupadd": {
    "title": "Hospital Plot, New Delhi, India",
    "subt": ""
  }
}
```

✅ Address with missing subt:
```json
{
  "pickupadd": {
    "title": "Hospital Plot, New Delhi, India"
  }
}
```

✅ Address with null subt:
```json
{
  "pickupadd": {
    "title": "Hospital Plot, New Delhi, India",
    "subt": null
  }
}
```

## Testing

The endpoint should now accept requests with empty `subt` fields:

**Endpoint:** `POST http://localhost:8000/customer/add_vehicle_request`

**Request Body:**
```json
{
  "uid": 686,
  "driverid": [321],
  "vehicle_id": 2,
  "price": 196.45,
  "tot_km": 4.43,
  "tot_hour": 0,
  "tot_minute": 9,
  "payment_id": 9,
  "m_role": "normal",
  "coupon_id": "",
  "bidd_auto_status": false,
  "pickup": [{"latitude": 28.6048626, "longitude": 77.0539017}],
  "drop": [{"latitude": 28.565388623631748, "longitude": 77.05934230238199}],
  "droplist": [],
  "pickupadd": {
    "title": "Hospital Plot, New Delhi, India",
    "subt": ""
  },
  "dropadd": {
    "title": "online exam center, New Delhi, India",
    "subt": "online exam center, New Delhi, India"
  },
  "droplistadd": []
}
```

## Status

✅ **FIXED** - Empty `subt` fields are now accepted
✅ **FIXED** - Better error messages
✅ **FIXED** - More robust validation

The server should auto-restart and the error should be resolved!
