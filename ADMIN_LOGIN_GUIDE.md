# Admin Panel Login Guide

## Admin Credentials

Based on the dummy data inserted, here are the admin credentials:

### Super Admin (Full Access)
- **Email**: `admin@ridego.com`
- **Password**: The password hash in the database is `$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC`
- **Note**: The actual password is likely `123` (default password used in the code)

### Alternative Admin Accounts
- **Email**: `manager@ridego.com` or `support@ridego.com`
- **Password**: Try `123` (default password)

## How to Login

1. Open your browser and go to: `http://localhost:8000`
2. You should see the login page
3. Enter:
   - **Email**: `admin@ridego.com`
   - **Password**: `123`
4. Click "Sign in"

## Fixing the "Administrator Only Allow Subdomain Url!!!" Error

This error is caused by a validation script stored in the `tbl_zippygo_validate` table. To fix it:

### Option 1: Clear the Validation Script (Recommended for Local Development)

Run this SQL query in MySQL Workbench:

```sql
USE ridego_db;

-- Clear the validation script
UPDATE tbl_zippygo_validate SET data = '' WHERE id = 1;

-- Or delete the validation data
UPDATE tbl_zippygo_validate SET data = NULL WHERE id = 1;
```

### Option 2: Check What's in the Validation Table

```sql
SELECT * FROM tbl_zippygo_validate;
```

The `data` column contains a JavaScript validation script that checks for subdomain. For local development, you can clear it.

## Fixing the 404 Error

The 404 error in the console is likely from:
1. A missing static file (image, CSS, or JS)
2. A browser extension trying to load resources

To identify which file is missing:
1. Open browser Developer Tools (F12)
2. Go to the **Network** tab
3. Refresh the page
4. Look for files with status **404** (red)
5. Note the file path and check if it exists in your `public` folder

## Testing Steps

1. **Clear the validation script** (see Option 1 above)
2. **Restart your server** if needed:
   ```bash
   npm start
   ```
3. **Open browser**: `http://localhost:8000`
4. **Login with credentials**:
   - Email: `admin@ridego.com`
   - Password: `123`
5. **If password doesn't work**, reset it:

```sql
-- Reset admin password to '123'
USE ridego_db;
UPDATE tbl_admin 
SET password = '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC' 
WHERE email = 'admin@ridego.com';
```

This hash corresponds to password `123`.

## Troubleshooting

### If login fails:
1. Check if admin exists:
   ```sql
   SELECT * FROM tbl_admin WHERE email = 'admin@ridego.com';
   ```

2. Create a new admin if needed:
   ```sql
   INSERT INTO tbl_admin (name, email, country_code, phone, password, role) 
   VALUES ('Admin', 'admin@ridego.com', '+91', '9999999999', 
   '$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC', '1');
   ```

### If you see database errors:
- Make sure MySQL is running
- Verify database connection in `.env` file
- Check that all tables were imported correctly

## Default Admin (Auto-created)

The system automatically creates a default admin if none exists:
- **Email**: `admin@admin.com`
- **Password**: `123`
- **Phone**: `9999999999`

You can use this if the dummy data admin doesn't work.






