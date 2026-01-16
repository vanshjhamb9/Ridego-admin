# MySQL Workbench Setup Guide

This guide will help you set up and connect MySQL Workbench to your local MySQL server for the Ridego Admin Panel.

## Prerequisites

1. **MySQL Server** - Must be installed and running on your local machine
   - Download from: https://dev.mysql.com/downloads/mysql/
   - Or use MySQL Installer for Windows: https://dev.mysql.com/downloads/installer/
2. **MySQL Workbench** - GUI tool for managing MySQL databases
   - Download from: https://dev.mysql.com/downloads/workbench/
   - Usually included with MySQL Server installation

## Step 1: Verify MySQL Server is Running

### Windows
1. Open **Services** (Win + R, type `services.msc`)
2. Look for **MySQL** or **MySQL80** service
3. Ensure it's **Running** (if not, right-click and select **Start**)

### Alternative: Check via Command Line
```bash
# Open Command Prompt or PowerShell
mysql --version
```

If MySQL is installed, you should see the version number.

## Step 2: Open MySQL Workbench

1. Launch **MySQL Workbench** from your Start menu or desktop
2. You should see the MySQL Workbench home screen

## Step 3: Create a New Connection

1. In MySQL Workbench, click the **+** button next to "MySQL Connections" (or click **Database** → **Manage Connections**)
2. A new connection setup window will appear

### Connection Parameters

Fill in the following details:

| Parameter | Value | Description |
|-----------|-------|-------------|
| **Connection Name** | `Local Ridego DB` | A friendly name for your connection |
| **Connection Method** | `Standard (TCP/IP)` | Default connection method |
| **Hostname** | `127.0.0.1` or `localhost` | Local MySQL server address |
| **Port** | `3306` | Default MySQL port |
| **Username** | `root` | Your MySQL root username (or your custom username) |
| **Password** | `[Your MySQL Password]` | Click "Store in Keychain" to save password |
| **Default Schema** | *(Leave empty)* | We'll select the database after connection |

### Screenshot Reference
```
┌─────────────────────────────────────┐
│ Connection Name: Local Ridego DB    │
│ Connection Method: Standard (TCP/IP)│
│ Hostname: 127.0.0.1                 │
│ Port: 3306                          │
│ Username: root                       │
│ Password: [Store in Keychain] ✓     │
│ Default Schema: (empty)             │
└─────────────────────────────────────┘
```

## Step 4: Test the Connection

1. Click the **Test Connection** button at the bottom
2. If successful, you'll see: **"Successfully made the MySQL connection"**
3. If it fails, see the **Troubleshooting** section below

## Step 5: Save and Connect

1. Click **OK** to save the connection
2. Double-click the connection name **"Local Ridego DB"** to connect
3. You may be prompted for your password again (if not stored)
4. Once connected, you'll see the MySQL Workbench interface with:
   - Left sidebar: Database schemas
   - Top: Query editor
   - Bottom: Output/Result panels

## Step 6: Create the Database

1. In the query editor (top panel), type:
   ```sql
   CREATE DATABASE IF NOT EXISTS ridego_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

2. Click the **Execute** button (⚡ lightning bolt icon) or press `Ctrl+Enter`

3. Refresh the schemas list:
   - Right-click in the **SCHEMAS** panel (left sidebar)
   - Select **Refresh All**

4. You should now see **`ridego_db`** in the schemas list

## Step 7: Set Default Schema

1. Right-click on **`ridego_db`** in the SCHEMAS panel
2. Select **Set as Default Schema**
3. The database name will appear in bold, indicating it's the default

## Step 8: Verify Connection from Application

Your application should now be able to connect. Update your `.env` file with:

```env
DB_HOST=localhost
DB_USER=root
DB_PASS=your_actual_mysql_password
DB_NAME=ridego_db
```

## Troubleshooting

### Issue 1: "Cannot Connect to MySQL Server"

**Possible Causes:**
- MySQL server is not running
- Wrong hostname or port
- Firewall blocking connection

**Solutions:**
1. Check if MySQL service is running (see Step 1)
2. Verify hostname is `127.0.0.1` or `localhost`
3. Verify port is `3306` (check MySQL configuration if different)
4. Temporarily disable Windows Firewall to test

### Issue 2: "Access Denied for User"

**Possible Causes:**
- Incorrect username or password
- User doesn't have permission to connect from localhost

**Solutions:**
1. Verify your MySQL root password
2. Reset MySQL root password if forgotten:
   ```bash
   # Stop MySQL service first
   # Then start MySQL with --skip-grant-tables option
   ```
3. Create a new MySQL user with proper permissions:
   ```sql
   CREATE USER 'ridego_user'@'localhost' IDENTIFIED BY 'your_password';
   GRANT ALL PRIVILEGES ON ridego_db.* TO 'ridego_user'@'localhost';
   FLUSH PRIVILEGES;
   ```

### Issue 3: "Unknown Database"

**Solution:**
- Create the database first (see Step 6)
- Or verify the database name in your `.env` file matches

### Issue 4: Port 3306 Already in Use

**Solution:**
1. Check what's using port 3306:
   ```bash
   netstat -ano | findstr :3306
   ```
2. Either stop the conflicting service or change MySQL port in MySQL configuration

### Issue 5: MySQL Workbench Won't Start

**Solutions:**
1. Reinstall MySQL Workbench
2. Check Windows Event Viewer for error details
3. Run as Administrator

## Additional Tips

### Viewing Connection Status
- In MySQL Workbench, check the bottom status bar for connection info
- Green indicator = Connected
- Red indicator = Disconnected

### Running SQL Scripts
1. Click **File** → **Open SQL Script**
2. Select your `.sql` file
3. Click **Execute** (⚡) to run

### Exporting/Importing Data
- **Export**: Right-click database → **Data Export**
- **Import**: Right-click database → **Data Import/Restore**

### Managing Users and Permissions
1. Click **Server** → **Users and Privileges**
2. Manage MySQL users and their access rights

## Next Steps

After setting up the connection:
1. Import your database schema (if you have SQL dump files)
2. Configure your `.env` file with the correct credentials
3. Start your Node.js application
4. Test the connection from your application

## Security Notes

- Never commit your `.env` file to version control
- Use strong passwords for MySQL root user
- Consider creating a dedicated database user (not root) for the application
- Regularly update MySQL Server and Workbench

## Useful MySQL Commands

```sql
-- Show all databases
SHOW DATABASES;

-- Use a specific database
USE ridego_db;

-- Show all tables in current database
SHOW TABLES;

-- Check current user
SELECT USER();

-- Check database connection
SELECT DATABASE();
```

## Support

If you continue to experience issues:
1. Check MySQL error logs (usually in MySQL data directory)
2. Review MySQL Workbench logs (Help → Show Log File)
3. Verify MySQL server configuration file (`my.ini` on Windows)







