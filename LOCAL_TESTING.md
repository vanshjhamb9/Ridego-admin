# Local Testing Guide - Ridego Admin Panel

Complete step-by-step guide for testing the Ridego Admin Panel locally with MySQL Workbench.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation Steps](#installation-steps)
3. [Database Setup](#database-setup)
4. [Configuration](#configuration)
5. [Running the Application](#running-the-application)
6. [Testing the Application](#testing-the-application)
7. [Troubleshooting](#troubleshooting)

## Prerequisites

Before you begin, ensure you have the following installed:

### Required Software

1. **Node.js** (v14 or higher recommended)
   - Download from: https://nodejs.org/
   - Verify installation: `node --version`
   - Verify npm: `npm --version`

2. **MySQL Server** (v5.7 or higher, or v8.0+)
   - Download from: https://dev.mysql.com/downloads/mysql/
   - Verify installation: `mysql --version`

3. **MySQL Workbench**
   - Download from: https://dev.mysql.com/downloads/workbench/
   - Usually included with MySQL Server installation

### Optional but Recommended

- **Postman** or **Insomnia** - For API testing
- **Git** - For version control
- **VS Code** or your preferred code editor

## Installation Steps

### Step 1: Clone/Download the Project

If you haven't already, navigate to your project directory:

```bash
cd "C:\Ridego\Admin panel"
```

### Step 2: Install Dependencies

The project already has `node_modules` installed, but if you need to reinstall:

```bash
npm install
```

This will install all dependencies listed in `package.json`, including:
- express
- mysql2
- dotenv
- bcrypt
- and others

### Step 3: Verify Installation

Check that all dependencies are installed:

```bash
npm list --depth=0
```

## Database Setup

### Step 1: Start MySQL Server

**Windows:**
1. Open **Services** (Win + R → `services.msc`)
2. Find **MySQL** or **MySQL80** service
3. Right-click → **Start** (if not running)

**Alternative:**
```bash
# If MySQL is installed as a service, it should start automatically
# Check status:
sc query MySQL80
```

### Step 2: Connect with MySQL Workbench

1. Open **MySQL Workbench**
2. Create a new connection (see [MYSQL_SETUP_GUIDE.md](MYSQL_SETUP_GUIDE.md) for detailed instructions)
   - Hostname: `127.0.0.1` or `localhost`
   - Port: `3306`
   - Username: `root`
   - Password: Your MySQL root password
3. Test and save the connection
4. Connect to the server

### Step 3: Create the Database

**Option A: Using MySQL Workbench**

1. Open the query editor in MySQL Workbench
2. Open the file `database_setup.sql` from this project
3. Execute the script (⚡ Execute button or `Ctrl+Enter`)
4. Verify the database was created:
   ```sql
   SHOW DATABASES;
   ```
   You should see `ridego_db` in the list

**Option B: Using Command Line**

```bash
mysql -u root -p
```

Then in MySQL prompt:
```sql
CREATE DATABASE IF NOT EXISTS ridego_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ridego_db;
EXIT;
```

### Step 4: Import Database Schema (If Available)

If you have a database dump file (`.sql`):

**Using MySQL Workbench:**
1. Click **Server** → **Data Import**
2. Select **Import from Self-Contained File**
3. Choose your `.sql` dump file
4. Select `ridego_db` as the target schema
5. Click **Start Import**

**Using Command Line:**
```bash
mysql -u root -p ridego_db < your_database_dump.sql
```

## Configuration

### Step 1: Create Environment File

1. Copy `.env.example` to `.env`:
   ```bash
   copy .env.example .env
   ```
   Or manually create a `.env` file in the project root.

2. Open `.env` in a text editor and update the values:

```env
# Server Configuration
port=8000

# MySQL Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASS=your_actual_mysql_password
DB_NAME=ridego_db

# Optional: Skip database validation
SKIP_DB=false
```

**Important:** Replace `your_actual_mysql_password` with your actual MySQL root password.

### Step 2: Verify Configuration

Check that your `.env` file is in the project root and has correct values. The application will read these values automatically via `dotenv`.

## Running the Application

### Step 1: Start the Server

The project uses `nodemon` for automatic restart on file changes. Start the server:

```bash
npm start
```

Or if you prefer to run directly:

```bash
node app.js
```

### Step 2: Verify Server is Running

You should see output similar to:

```
DB config: { host: 'localhost', user: 'root', database: 'ridego_db' }
Server running on port 8000
```

### Step 3: Check for Errors

- **Database Connection Error**: Check your `.env` file credentials
- **Port Already in Use**: Change the port in `.env` or stop the conflicting service
- **Module Not Found**: Run `npm install` again

## Testing the Application

### Step 1: Test Web Interface

1. Open your web browser
2. Navigate to: `http://localhost:8000`
3. You should see the admin panel login page or dashboard

### Step 2: Test API Endpoints

The application exposes several API endpoints. Test them using:

**Using cURL:**

```bash
# Test driver signup detail endpoint
curl -X GET http://localhost:8000/driver/signup_detail

# Test with POST (example)
curl -X POST http://localhost:8000/driver/login \
  -H "Content-Type: application/json" \
  -d "{\"ccode\":\"+1\",\"phone\":\"1234567890\",\"password\":\"password123\"}"
```

**Using Postman:**

1. Create a new request
2. Set method (GET/POST)
3. Enter URL: `http://localhost:8000/driver/signup_detail`
4. For POST requests, add JSON body in the Body tab
5. Click **Send**

### Step 3: Test Database Connection

The application automatically tests the database connection on startup. Check the console output for:

```
DB config: { host: 'localhost', user: 'root', database: 'ridego_db' }
```

If you see database errors, verify:
- MySQL server is running
- Database `ridego_db` exists
- Credentials in `.env` are correct
- User has proper permissions

### Step 4: Test Specific Features

Refer to [TESTING_GUIDE.md](TESTING_GUIDE.md) for detailed API endpoint testing instructions, including:
- Driver subscription endpoints
- Login endpoints
- Ride management endpoints
- And more

## Troubleshooting

### Problem: "Cannot connect to MySQL server"

**Solutions:**
1. Verify MySQL server is running (Services → MySQL)
2. Check `.env` file has correct `DB_HOST` (should be `localhost` or `127.0.0.1`)
3. Verify MySQL port (default is 3306)
4. Test connection in MySQL Workbench first

### Problem: "Access denied for user"

**Solutions:**
1. Verify MySQL username and password in `.env`
2. Test credentials in MySQL Workbench
3. Reset MySQL password if needed
4. Ensure user has permissions on `ridego_db` database

### Problem: "Unknown database 'ridego_db'"

**Solutions:**
1. Create the database (see Database Setup section)
2. Verify database name in `.env` matches actual database name
3. Check database exists: `SHOW DATABASES;` in MySQL Workbench

### Problem: "Port 8000 already in use"

**Solutions:**
1. Find what's using port 8000:
   ```bash
   netstat -ano | findstr :8000
   ```
2. Stop the conflicting service or change port in `.env`:
   ```env
   port=8001
   ```
3. Restart the application

### Problem: "Module not found" errors

**Solutions:**
1. Delete `node_modules` folder
2. Delete `package-lock.json`
3. Run `npm install` again
4. Verify Node.js version: `node --version` (should be v14+)

### Problem: Application starts but endpoints return errors

**Solutions:**
1. Check application console for error messages
2. Verify database tables exist (if using existing schema)
3. Check database connection in MySQL Workbench
4. Review `middleware/db.js` for connection pool settings
5. Enable `SKIP_DB=true` in `.env` temporarily to test without database

### Problem: "ECONNREFUSED" error

**Solutions:**
1. MySQL server is not running - start it
2. Wrong host/port in `.env`
3. Firewall blocking connection (unlikely for localhost)

## Development Tips

### Hot Reload

The application uses `nodemon`, which automatically restarts when you modify files. No need to manually restart.

### Database Changes

After making database changes in MySQL Workbench:
1. Refresh your application
2. Check console for any new errors
3. Verify changes in MySQL Workbench query editor

### Environment Variables

- Never commit `.env` to version control
- Use `.env.example` as a template
- Different environments (dev, staging, prod) should have separate `.env` files

### Debugging

1. **Check Console Output**: The application logs database config and errors
2. **MySQL Workbench**: Use query editor to test SQL queries directly
3. **Postman/Insomnia**: Test API endpoints independently
4. **Browser DevTools**: Check Network tab for API responses

## Next Steps

After successful local setup:

1. **Import Production Data** (if needed): Use MySQL Workbench to import database dumps
2. **Configure Additional Services**: Set up email, SMS, payment gateways (if needed)
3. **Test All Features**: Go through the testing checklist in [TESTING_GUIDE.md](TESTING_GUIDE.md)
4. **Set Up Development Workflow**: Configure Git, create feature branches, etc.

## Quick Reference

### Start Application
```bash
npm start
```

### Stop Application
Press `Ctrl+C` in the terminal

### Check MySQL Status
```bash
# Windows
sc query MySQL80

# Or check Services panel
```

### Test Database Connection
```sql
-- In MySQL Workbench
USE ridego_db;
SELECT DATABASE();
```

### View Application Logs
Check the terminal/console where you ran `npm start`

## Support

If you encounter issues not covered here:

1. Check [MYSQL_SETUP_GUIDE.md](MYSQL_SETUP_GUIDE.md) for database-specific issues
2. Review [TESTING_GUIDE.md](TESTING_GUIDE.md) for API testing
3. Check application console for detailed error messages
4. Verify all prerequisites are installed and configured correctly







