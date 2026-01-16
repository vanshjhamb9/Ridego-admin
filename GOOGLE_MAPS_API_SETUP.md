# 🗺️ Google Maps API Key Integration Guide

## Quick Setup

### Step 1: Add Your API Key to Database

Run this SQL query in MySQL Workbench or your database client:

```sql
USE ridego_db;

UPDATE tbl_general_settings 
SET google_map_key = 'YOUR_API_KEY_HERE'
WHERE id = 1;
```

**Replace `YOUR_API_KEY_HERE` with your actual Google Maps API key.**

---

## Step 2: Verify the Key Was Added

Run this query to check:

```sql
SELECT id, title, google_map_key 
FROM tbl_general_settings 
WHERE id = 1;
```

You should see your API key in the `google_map_key` column.

---

## Step 3: Restart Server

The server should automatically pick up the new API key. If not, restart it:

```bash
# Stop the server (Ctrl+C)
# Then restart:
npm start
```

---

## Getting a Google Maps API Key (If You Don't Have One)

### 1. Go to Google Cloud Console
- Visit: https://console.cloud.google.com/

### 2. Create or Select a Project
- Click on the project dropdown at the top
- Click "New Project" or select an existing one

### 3. Enable Distance Matrix API
- Go to "APIs & Services" > "Library"
- Search for "Distance Matrix API"
- Click on it and click "Enable"

### 4. Create API Key
- Go to "APIs & Services" > "Credentials"
- Click "Create Credentials" > "API Key"
- Copy the generated API key

### 5. (Recommended) Restrict the API Key
- Click on the API key you just created
- Under "API restrictions", select "Restrict key"
- Choose "Distance Matrix API" only
- Click "Save"

### 6. (Optional) Set Billing
- Google Maps API requires billing to be enabled
- Go to "Billing" and add a payment method
- Free tier: $200 credit per month (covers ~40,000 requests)

---

## API Key Format

Your API key should look like:
```
AIzaSyB1234567890abcdefghijklmnopqrstuvw
```

It's a long string of letters, numbers, and sometimes hyphens.

---

## Testing the Integration

After adding the key, test it:

**Endpoint:** `POST http://localhost:8000/customer/module_calculate`

**Request:**
```json
{
  "uid": 686,
  "mid": 1,
  "mrole": 1,
  "pickup_lat_lon": "28.6047137,77.0542787",
  "drop_lat_lon": "28.61443541450488,77.08698648959398",
  "drop_lat_lon_list": []
}
```

**Expected:** You should get accurate distance and time calculations (not fallback).

**Check Server Logs:** You should NOT see "REQUEST_DENIED" errors anymore.

---

## Troubleshooting

### Issue: Still Getting REQUEST_DENIED

**Solutions:**
1. Verify the key is correct (no extra spaces)
2. Check if Distance Matrix API is enabled
3. Check if billing is enabled
4. Verify the key restrictions allow Distance Matrix API

### Issue: API Key Not Working

**Check:**
```sql
-- Verify key is in database
SELECT google_map_key FROM tbl_general_settings WHERE id = 1;

-- If NULL or empty, update it:
UPDATE tbl_general_settings 
SET google_map_key = 'YOUR_KEY'
WHERE id = 1;
```

### Issue: Quota Exceeded

- Check your Google Cloud Console billing
- You may have exceeded the free tier ($200/month)
- Consider using fallback for some requests

---

## Security Best Practices

1. **Restrict API Key:**
   - Only allow Distance Matrix API
   - Add IP restrictions if possible
   - Don't commit API key to Git

2. **Monitor Usage:**
   - Set up billing alerts in Google Cloud Console
   - Monitor API usage regularly

3. **Backup Plan:**
   - The system automatically falls back to geolib if API fails
   - No downtime if API key expires

---

## Current Status

✅ **Code is ready** - The integration is already implemented
✅ **Just needs API key** - Add it to database and it will work
✅ **Fallback available** - Works even if API fails

---

## Quick Copy-Paste SQL

```sql
USE ridego_db;

-- Replace YOUR_API_KEY_HERE with your actual key
UPDATE tbl_general_settings 
SET google_map_key = 'YOUR_API_KEY_HERE'
WHERE id = 1;

-- Verify
SELECT google_map_key FROM tbl_general_settings WHERE id = 1;
```

---

## Need Help?

If you encounter issues:
1. Check server logs for specific error messages
2. Verify API key format (should be a long string)
3. Ensure Distance Matrix API is enabled in Google Cloud Console
4. Check billing is enabled

The system will automatically use the API key once it's in the database!
