# Currency Update Guide - Replace $ with ₹

## ✅ Changes Made

### 1. **Database Update**
- Updated `INSERT_DUMMY_DATA.sql` to use `₹` instead of `INR`
- Created `UPDATE_CURRENCY_TO_RUPEES.sql` script for existing databases

### 2. **Views Already Using Dynamic Currency**
All views use `general.site_currency` which pulls from the database:
- ✅ `views/driver_cash_adjustment.ejs` - Uses `general.site_currency || '₹'`
- ✅ `views/subscription_plans.ejs` - Uses `general.site_currency || '₹'`
- ✅ `views/subscription_history.ejs` - Uses `general.site_currency || '₹'`
- ✅ `views/subscription_dashboard.ejs` - Uses `general.site_currency || '₹'`
- ✅ All other views use `general.site_currency` dynamically

### 3. **JavaScript Currency Function**
The currency is applied dynamically via JavaScript in `views/partials/function.ejs`:
```javascript
function currency() {
    let sym = $('#rate_sym').val()  // Gets from general.site_currency
    let pls = $('#rate_pla').val()
    // Applies currency symbol to all .invosymbol elements
}
```

## 📋 How to Apply

### For New Installations:
1. The `INSERT_DUMMY_DATA.sql` already has `₹` as the currency
2. Just import the SQL file as usual

### For Existing Databases:
1. Run the SQL script: `UPDATE_CURRENCY_TO_RUPEES.sql`
2. Or manually run:
   ```sql
   UPDATE tbl_general_settings 
   SET site_currency = '₹' 
   WHERE id = 1;
   ```

### Via Admin Panel:
1. Go to: `Settings` → `General Settings`
2. Find "Currency" field
3. Change from `INR` or `$` to `₹`
4. Save

## 🔍 Verification

After updating, check:
1. **Driver List** - All amounts should show ₹
2. **Cash Management** - Wallet balances should show ₹
3. **Subscription Plans** - Prices should show ₹
4. **Reports** - All financial data should show ₹
5. **Any page with amounts** - Should display ₹

## 📝 Notes

- The currency symbol is stored in `tbl_general_settings.site_currency`
- All views read from `general.site_currency` dynamically
- JavaScript function `currency()` applies the symbol to all `.invosymbol` elements
- Currency placement (left/right) is controlled by `currency_placement` setting
- Thousands separator is controlled by `thousands_separator` setting

## ✅ Result

After updating, **all dollar signs ($) will be replaced with rupees (₹)** throughout the admin panel!






