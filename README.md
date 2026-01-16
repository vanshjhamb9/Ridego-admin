# Ridego Admin Panel

Admin panel for the Ridego ride-sharing application. Built with Node.js, Express, and MySQL.

## Features

- Driver and customer management
- Ride management and tracking
- Zone and vehicle management
- Subscription management
- Payment processing
- Real-time chat functionality
- Comprehensive reporting
- Role-based access control

## Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v14 or higher recommended)
  - Download from: https://nodejs.org/
  - Verify: `node --version`
- **MySQL Server** (v5.7+ or v8.0+)
  - Download from: https://dev.mysql.com/downloads/mysql/
  - Verify: `mysql --version`
- **MySQL Workbench** (recommended)
  - Download from: https://dev.mysql.com/downloads/workbench/
- **npm** (comes with Node.js)
  - Verify: `npm --version`

## Local Development Setup

### Quick Start

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Set Up Environment Variables**
   - Copy `.env.example` to `.env`
   - Update MySQL credentials in `.env`:
     ```env
     DB_HOST=localhost
     DB_USER=root
     DB_PASS=your_mysql_password
     DB_NAME=ridego_db
     port=8000
     ```

3. **Set Up Database**
   - Start MySQL server
   - Open MySQL Workbench and connect to your local MySQL server
   - Run `database_setup.sql` to create the database
   - Import your database schema if available

4. **Start the Application**
   ```bash
   npm start
   ```

5. **Access the Application**
   - Web Interface: http://localhost:8000
   - API Base URL: http://localhost:8000

### Detailed Setup Guides

For comprehensive setup instructions, refer to:

- **[LOCAL_TESTING.md](LOCAL_TESTING.md)** - Complete step-by-step local testing guide
- **[MYSQL_SETUP_GUIDE.md](MYSQL_SETUP_GUIDE.md)** - Detailed MySQL Workbench connection guide
- **[TESTING_GUIDE.md](TESTING_GUIDE.md)** - API endpoint testing guide

## Project Structure

```
Admin panel/
├── app.js                 # Main application entry point
├── package.json           # Dependencies and scripts
├── .env                   # Environment variables (create from .env.example)
├── middleware/            # Middleware functions
│   ├── db.js             # Database connection configuration
│   ├── databse_query.js  # Database query helpers
│   └── auth.js           # Authentication middleware
├── route_mobile/          # Mobile API routes
│   ├── driver_api.js     # Driver-related endpoints
│   ├── customer_api.js   # Customer-related endpoints
│   └── ...
├── router/                # Web admin routes
├── public/                # Static files (CSS, JS, images)
├── views/                 # EJS templates
└── cron/                  # Scheduled tasks
```

## Configuration

### Environment Variables

Create a `.env` file in the project root with the following variables:

```env
# Server Configuration
port=8000

# MySQL Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASS=your_mysql_password
DB_NAME=ridego_db

# Optional: Skip database validation
SKIP_DB=false
```

**Important:** Never commit the `.env` file to version control. Use `.env.example` as a template.

### Database Configuration

The database connection is configured in `middleware/db.js` and uses environment variables:
- Connection pooling is enabled (limit: 1000)
- Character set: `utf8mb4` for full Unicode support
- Default port: 3306

## Running the Application

### Development Mode (with auto-reload)

```bash
npm start
```

This uses `nodemon` to automatically restart the server when files change.

### Production Mode

```bash
node app.js
```

## API Endpoints

### Mobile APIs

- **Driver APIs**: `/driver/*`
  - Signup details: `GET /driver/signup_detail`
  - Login: `POST /driver/login`
  - Subscription: `POST /driver/subscription_plans`
  - And more...

- **Customer APIs**: `/customer/*`
- **Chat APIs**: `/chat/*`
- **Payment APIs**: `/payment/*`

### Web Admin APIs

- Login: `/`
- Dashboard: Various routes under `/router/*`

See [TESTING_GUIDE.md](TESTING_GUIDE.md) for detailed API documentation and testing examples.

## Testing

### Manual Testing

1. **Web Interface**: Navigate to http://localhost:8000
2. **API Testing**: Use Postman, Insomnia, or cURL
3. **Database**: Use MySQL Workbench to verify data

### API Testing Examples

```bash
# Test driver signup detail
curl -X GET http://localhost:8000/driver/signup_detail

# Test driver login
curl -X POST http://localhost:8000/driver/login \
  -H "Content-Type: application/json" \
  -d '{"ccode":"+1","phone":"1234567890","password":"password123"}'
```

See [TESTING_GUIDE.md](TESTING_GUIDE.md) for comprehensive testing instructions.

## Troubleshooting

### Common Issues

**Database Connection Error**
- Verify MySQL server is running
- Check `.env` file credentials
- Test connection in MySQL Workbench first

**Port Already in Use**
- Change port in `.env` file
- Or stop the conflicting service

**Module Not Found**
- Run `npm install` to reinstall dependencies
- Verify Node.js version (v14+)

For more troubleshooting help, see [LOCAL_TESTING.md](LOCAL_TESTING.md#troubleshooting).

## Dependencies

Key dependencies:
- `express` - Web framework
- `mysql2` - MySQL database driver
- `dotenv` - Environment variable management
- `bcrypt` - Password hashing
- `jsonwebtoken` - JWT authentication
- `socket.io` - Real-time communication
- `multer` - File upload handling
- `nodemon` - Development auto-reload

See `package.json` for complete list.

## Documentation

- **[LOCAL_TESTING.md](LOCAL_TESTING.md)** - Local development and testing guide
- **[MYSQL_SETUP_GUIDE.md](MYSQL_SETUP_GUIDE.md)** - MySQL Workbench setup
- **[TESTING_GUIDE.md](TESTING_GUIDE.md)** - API testing guide
- **[database_setup.sql](database_setup.sql)** - Database initialization script

## Support

For issues or questions:
1. Check the troubleshooting sections in the guides
2. Review application console logs
3. Verify database connection in MySQL Workbench
4. Check that all prerequisites are installed correctly

## License

[Add your license information here]
"# Ridego-admin" 
