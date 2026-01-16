# Complete Admin Panel Guide - Ridego

## 📋 Table of Contents
1. [Getting Started](#getting-started)
2. [Dashboard Overview](#dashboard-overview)
3. [Main Menu Sections](#main-menu-sections)
4. [Feature-by-Feature Guide](#feature-by-feature-guide)
5. [Common Tasks](#common-tasks)
6. [Tips & Best Practices](#tips--best-practices)

---

## 🚀 Getting Started

### Accessing the Admin Panel
- **URL**: `http://localhost:8000`
- **Login Credentials**:
  - Email: `admin@ridego.com`
  - Password: `123`

### First Steps After Login
1. You'll land on the **Dashboard** (`/index`)
2. Review the statistics cards at the top
3. Explore the sidebar menu on the left
4. Check your profile settings

---

## 📊 Dashboard Overview

**URL**: `http://localhost:8000/index`

### What You'll See:
- **Total Rides**: Count of all rides (cart + completed)
- **Total Service Zones**: Number of active zones
- **Total Vehicles**: Number of vehicle types
- **Total Payment Methods**: Available payment options
- **Driver Statistics**: Total, Approved, Unapproved, Verified, Unverified
- **Customer Statistics**: Total, Approved, Unapproved
- **Ride Status Breakdown**: Accept, I'm Here, Enter OTP, Cancel, Start, End, Complete

### Dashboard Cards:
- **Total Ride**: Shows all ride requests
- **Service Zone**: Geographic service areas
- **Vehicle**: Vehicle types available
- **Payment**: Payment methods configured

---

## 🎯 Main Menu Sections

The sidebar menu contains these main sections:

### 1. 🏠 Dashboard
- **Path**: `/index`
- **Purpose**: Overview of all system statistics
- **What to do**: Monitor daily operations, check key metrics

### 2. 👥 Driver Management
- **Path**: `/driver/*`
- **Sections**:
  - **Add Driver** (`/driver/add`): Register new drivers
  - **Driver List** (`/driver/list`): View all drivers
  - **Vehicle Preference** (`/driver/preference`): Manage vehicle preferences
  - **Document Setting** (`/driver/setting`): Configure required documents
  - **Default Notification** (`/driver/default_message`): Set default messages

#### Key Features:
- **Add/Edit Drivers**: Register drivers with profile, vehicle, and bank details
- **Approve/Reject**: Control driver approval status
- **View Driver Details**: See profile, documents, wallet balance
- **Subscription Status**: (New) Check driver subscription in database

### 3. 👤 Customer Management
- **Path**: `/customer/*`
- **Sections**:
  - **Add Customer** (`/customer/add`): Register new customers
  - **Customer List** (`/customer/list`): View all customers
  - **Customer Profile** (`/customer/profile`): View customer details

#### Key Features:
- **Add/Edit Customers**: Register customers with contact info
- **View Customer Details**: Profile, ride history, wallet balance
- **Approve/Block**: Control customer account status

### 4. 🚗 Vehicle Management
- **Path**: `/vehicle/*`
- **Sections**:
  - **Add Vehicle** (`/vehicle/add`): Add new vehicle types
  - **Vehicle List** (`/vehicle/list`): View all vehicles
  - **Vehicle Preference** (`/vehicle/preference`): Manage preferences

#### Key Features:
- **Vehicle Types**: Sedan, SUV, Hatchback, Premium, Luxury
- **Pricing**: Set per km, per minute, commission rates
- **Capacity**: Configure passenger capacity
- **Bidding**: Enable/disable bidding for vehicles

### 5. 🗺️ Zone Management
- **Path**: `/zone/*`
- **Sections**:
  - **Zone List** (`/zone/list`): View all zones
  - **Add/Edit Zone** (`/zone/add`, `/zone/edit/:id`): Manage zones
  - **Zone Driver Location** (`/zone/driver_location`): View drivers on map

#### Key Features:
- **Geographic Areas**: Define service zones
- **Map Integration**: Set zone boundaries
- **Status Control**: Activate/deactivate zones

### 6. 🚕 Ride Management
- **Path**: `/ride/*`
- **Sections**:
  - **New List** (`/ride/new_list`): New ride requests
  - **Running List** (`/ride/running_list`): Active rides
  - **Complete List** (`/ride/complete_list`): Completed rides
  - **Cancelled List** (`/ride/cancelled_list`): Cancelled rides
  - **All List** (`/ride/all_list`): All rides
  - **Ride Detail** (`/ride/detail/:id`): View ride details
  - **Cancel Reason** (`/ride/cancel_reason`): Manage cancellation reasons
  - **Review Reason** (`/ride/review_reason`): Manage review reasons

#### Key Features:
- **Track Rides**: Monitor all ride statuses
- **View Details**: Pickup, drop, driver, customer, pricing
- **Manage Reasons**: Configure cancel/review reasons

### 7. 📦 Outstation Management
- **Path**: `/outstation/*`
- **Sections**:
  - **Category** (`/outstation/category`): Manage outstation categories
  - **Outstation List** (`/outstation/list`): View all outstation trips
  - **Add/Edit Outstation** (`/outstation/add`, `/outstation/edit/:id`)
  - **Setting** (`/outstation/setting`): Configure outstation settings

#### Key Features:
- **Trip Types**: One Way, Round Trip, Multi City
- **Pricing**: Set rates for outstation trips
- **Manage Bookings**: View and manage outstation bookings

### 8. 🏨 Rental Management
- **Path**: `/rental/*`
- **Sections**:
  - **Rental List** (`/rental/list`): View all rentals
  - **Add/Edit Rental** (`/rental/add`, `/rental/edit/:id`)
  - **Setting** (`/rental/setting`): Configure rental settings

#### Key Features:
- **Hourly/Daily Rates**: Set rental pricing
- **Vehicle Selection**: Assign vehicles to rentals
- **Manage Bookings**: View and manage rental bookings

### 9. 📋 Package Management
- **Path**: `/package/*`
- **Sections**:
  - **Category** (`/package/category`): Manage package categories
  - **Package List** (`/package/list`): View all packages
  - **Setting** (`/package/setting`): Configure package settings

#### Key Features:
- **Package Types**: Hourly, Daily, Weekly packages
- **Pricing**: Set package rates
- **Manage Bookings**: View and manage package bookings

### 10. 🎫 Coupon Management
- **Path**: `/coupon/*`
- **Sections**:
  - **Coupon List** (`/coupon/list`): View all coupons
  - **Add/Edit Coupon** (`/coupon/add`, `/coupon/edit/:id`)

#### Key Features:
- **Create Coupons**: Set discount codes
- **Validity**: Set start and end dates
- **Discount Types**: Percentage or flat amount
- **Minimum Amount**: Set minimum ride amount

### 11. 💳 Payment Management
- **Path**: `/settings/payment`
- **Sections**:
  - **Payment List** (`/settings/payment`): View payment methods
  - **Add/Edit Payment** (`/settings/add_payment`, `/settings/edit_payment/:id`)

#### Key Features:
- **Payment Methods**: Cash, Card, UPI, Wallet
- **Status Control**: Enable/disable payment methods
- **Icons**: Upload payment method icons

### 12. 💰 Payout Management
- **Path**: `/settings/payout`
- **Sections**:
  - **Payout List** (`/settings/payout`): View driver payouts
  - **Approve/Reject**: Process payout requests

#### Key Features:
- **Driver Payouts**: View withdrawal requests
- **Approve Payouts**: Process driver payments
- **Transaction History**: Track all payouts

### 13. 📊 Reports
- **Path**: `/report/*`
- **Sections**:
  - **Ride Payment Report** (`/report/ride_payment`): Financial reports
  - **Vehicle Daily Report** (`/report/vehicle_daily`): Vehicle usage stats

#### Key Features:
- **Financial Reports**: Revenue, commissions, payments
- **Usage Statistics**: Vehicle performance, driver activity
- **Date Range**: Filter reports by date

### 14. ⚙️ Settings
- **Path**: `/settings/*`
- **Sections**:
  - **General Settings** (`/settings/general`): App configuration
  - **Payment Settings** (`/settings/payment`): Payment methods
  - **Payout Settings** (`/settings/payout`): Payout configuration

#### General Settings Include:
- **App Name**: Application title
- **Currency**: Site currency and symbol
- **Commission**: Driver commission rates
- **Google Map Key**: Map integration
- **SMS Settings**: Twilio configuration
- **OneSignal**: Push notification settings
- **Module Control**: Enable/disable Outstation, Rental, Package

### 15. 📝 Content Management
- **Path**: `/settings/*`
- **Sections**:
  - **FAQ List** (`/settings/faq`): Manage FAQs
  - **Pages List** (`/settings/pages`): Manage static pages
  - **Send Notification** (`/settings/send_notification`): Send push notifications

### 16. 👥 Role & Permission
- **Path**: `/role/*`
- **Sections**:
  - **Role List** (`/role/list`): View all roles
  - **Add/Edit Role** (`/role/add`, `/role/edit/:id`)

#### Key Features:
- **Create Roles**: Define staff roles (Manager, Support, etc.)
- **Set Permissions**: Control access to each feature
- **Assign to Staff**: Link roles to admin accounts

### 17. 💬 Chat Management
- **Path**: `/chat/*`
- **Sections**:
  - **Chat List** (`/chat/list`): View all chat conversations

#### Key Features:
- **View Conversations**: Driver-Customer chats
- **Monitor Messages**: Track communication

---

## 🔧 Common Tasks

### Adding a New Driver
1. Go to **Driver** → **Add Driver**
2. Fill in:
   - Personal Info (Name, Email, Phone)
   - Vehicle Details (Type, Number, Color)
   - Bank Details (IBAN, Bank Name)
   - Documents (Upload required docs)
3. Set **Approval Status** to "Approved"
4. Click **Submit**

### Approving a Driver
1. Go to **Driver** → **Driver List**
2. Find the driver
3. Click **Edit**
4. Change **Status** to "Approved"
5. Save

### Creating a Coupon
1. Go to **Coupon** → **Coupon List**
2. Click **Add Coupon**
3. Fill in:
   - **Title**: Coupon name
   - **Code**: Unique coupon code
   - **Discount**: Amount or percentage
   - **Min Amount**: Minimum ride amount
   - **Validity**: Start and end dates
4. Click **Submit**

### Viewing Ride Details
1. Go to **Ride** → **All List** (or specific status)
2. Click on a ride
3. View:
   - Pickup/Drop locations
   - Driver and Customer info
   - Pricing breakdown
   - Ride status timeline

### Managing Zones
1. Go to **Zone** → **Zone List**
2. Click **Add Zone** or **Edit**
3. Set:
   - **Zone Name**
   - **Status** (Active/Inactive)
   - **Coordinates** (Lat/Long or polygon)
4. Save

### Configuring General Settings
1. Go to **Settings** → **General Settings**
2. Update:
   - **App Name & Title**
   - **Currency Settings**
   - **Commission Rates**
   - **Google Map API Key**
   - **SMS/Push Notification Settings**
3. Click **Update**

---

## 💡 Tips & Best Practices

### 1. Regular Monitoring
- Check **Dashboard** daily for key metrics
- Review **New Rides** frequently
- Monitor **Driver/Customer Lists** for new registrations

### 2. Driver Management
- Always verify documents before approval
- Check wallet balance before processing payouts
- Monitor driver subscription status (check database)

### 3. Financial Management
- Review **Reports** regularly
- Check **Payout Requests** daily
- Monitor **Payment Transactions**

### 4. Customer Support
- Use **Chat Management** to monitor conversations
- Check **Ride Cancellations** to identify issues
- Review **Customer Complaints** via reviews

### 5. System Maintenance
- Keep **General Settings** updated
- Regularly update **Zones** as service area expands
- Monitor **Vehicle Availability**

### 6. Security
- Use **Role & Permissions** to limit access
- Regularly change admin passwords
- Monitor **Admin Activity**

---

## 🔍 Quick Navigation Shortcuts

| Feature | URL Path |
|---------|----------|
| Dashboard | `/index` |
| Driver List | `/driver/list` |
| Customer List | `/customer/list` |
| Vehicle List | `/vehicle/list` |
| Zone List | `/zone/list` |
| All Rides | `/ride/all_list` |
| Coupon List | `/coupon/list` |
| Reports | `/report/ride_payment` |
| Settings | `/settings/general` |
| Profile | `/profile` |

---

## 📱 Subscription Management (New Feature)

**Note**: Subscription management is currently **API-only**. There's no admin UI yet.

### To View Subscription Data:
1. Use **MySQL Workbench** (see VIEW_UPDATES_GUIDE.md)
2. Test via **API endpoints** (see TESTING_GUIDE.md)

### Subscription Features Available:
- ✅ Subscription Plans (5, 7, 10, 15, 30 day plans)
- ✅ Driver Subscription Status
- ✅ Subscription History
- ✅ Automatic Expiration (Cron job)

---

## 🆘 Troubleshooting

### Can't See Data?
- Check if dummy data was inserted (run queries from CHECK_DATABASE_QUERIES.sql)
- Verify database connection in `.env` file

### Permission Denied?
- Check your admin role (Super Admin has full access)
- Verify role permissions in **Role & Permission** section

### Features Not Working?
- Check server logs for errors
- Verify database tables exist
- Check `.env` configuration

---

## 📚 Additional Resources

- **VIEW_UPDATES_GUIDE.md**: Where to see the updates we made
- **TESTING_GUIDE.md**: API endpoint testing
- **CHECK_DATABASE_QUERIES.sql**: Database verification queries
- **ADMIN_LOGIN_GUIDE.md**: Login troubleshooting

---

## 🎓 Next Steps

1. **Explore Dashboard**: Familiarize yourself with statistics
2. **Add Test Data**: Try adding a driver or customer
3. **Configure Settings**: Set up your app name, currency, etc.
4. **Test Features**: Create a coupon, manage a zone
5. **Review Reports**: Check financial and usage reports

---

**Happy Admin-ing! 🚀**






