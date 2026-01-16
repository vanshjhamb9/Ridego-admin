/* jshint esversion: 6 */
/* jshint esversion: 8 */
/* jshint node: true */

const express = require("express");
const router = express.Router();
const auth = require("../middleware/auth");
const mysql = require("mysql2");
const { DataFind, DataInsert, DataUpdate, DataDelete } = require("../middleware/databse_query");

// =====================================================
// Subscription Plans Management
// =====================================================

router.get("/plans", auth, async (req, res) => {
    try {
        const plans = await DataFind(`SELECT * FROM tbl_subscription_plans ORDER BY price ASC`);
        
        res.render("subscription_plans", {
            auth: req.user, general: req.general, noti: req.notification, per: req.per, 
            lan: req.lan.ld, land: req.lan.lname, plans
        });
    } catch (error) {
        console.log(error);
        res.redirect("/index");
    }
});

router.get("/plans/add", auth, async (req, res) => {
    try {
        res.render("add_subscription_plan", {
            auth: req.user, general: req.general, noti: req.notification, per: req.per, 
            lan: req.lan.ld, land: req.lan.lname
        });
    } catch (error) {
        console.log(error);
    }
});

router.post("/plans/add", auth, async (req, res) => {
    try {
        const { name, price, validity_days, is_active } = req.body;
        const active = is_active == "on" ? 1 : 0;
        let esname = mysql.escape(name);

        if (await DataInsert(`tbl_subscription_plans`, 
            `name, price, validity_days, is_active`,
            `${esname}, '${price}', '${validity_days}', '${active}'`,
            req.hostname, req.protocol) == -1) {
            req.flash('errors', process.env.dataerror);
            return res.redirect("/valid_license");
        }

        req.flash('success', 'Subscription plan added successfully');
        res.redirect("/subscription/plans");
    } catch (error) {
        console.log(error);
    }
});

router.get("/plans/edit/:id", auth, async (req, res) => {
    try {
        const plan = await DataFind(`SELECT * FROM tbl_subscription_plans WHERE id = '${req.params.id}'`);
        
        if (plan == "" || plan == -1) {
            req.flash('errors', 'Subscription plan not found');
            return res.redirect("/subscription/plans");
        }

        res.render("edit_subscription_plan", {
            auth: req.user, general: req.general, noti: req.notification, per: req.per, 
            lan: req.lan.ld, land: req.lan.lname, plan: plan[0]
        });
    } catch (error) {
        console.log(error);
    }
});

router.post("/plans/edit/:id", auth, async (req, res) => {
    try {
        const { name, price, validity_days, is_active } = req.body;
        const active = is_active == "on" ? 1 : 0;
        let esname = mysql.escape(name);

        if (await DataUpdate(`tbl_subscription_plans`,
            `name = ${esname}, price = '${price}', validity_days = '${validity_days}', is_active = '${active}'`,
            `id = '${req.params.id}'`, req.hostname, req.protocol) == -1) {
            req.flash('errors', process.env.dataerror);
            return res.redirect("/valid_license");
        }

        req.flash('success', 'Subscription plan updated successfully');
        res.redirect("/subscription/plans");
    } catch (error) {
        console.log(error);
    }
});

router.get("/plans/delete/:id", auth, async (req, res) => {
    try {
        if (await DataDelete(`tbl_subscription_plans`, `id = '${req.params.id}'`, req.hostname, req.protocol) == -1) {
            req.flash('errors', process.env.dataerror);
            return res.redirect("/valid_license");
        }

        req.flash('success', 'Subscription plan deleted successfully');
        res.redirect("/subscription/plans");
    } catch (error) {
        console.log(error);
    }
});

// =====================================================
// Subscription History
// =====================================================

router.get("/history", auth, async (req, res) => {
    try {
        const { driver_id, status_filter, date_from, date_to } = req.query;
        
        let whereClause = "WHERE 1=1";
        if (driver_id) {
            whereClause += ` AND sh.driver_id = '${driver_id}'`;
        }
        if (status_filter && status_filter !== 'all') {
            whereClause += ` AND sh.status = '${status_filter}'`;
        }
        if (date_from) {
            whereClause += ` AND sh.start_date >= '${date_from}'`;
        }
        if (date_to) {
            whereClause += ` AND sh.start_date <= '${date_to}'`;
        }

        const history = await DataFind(`SELECT 
            sh.*,
            d.first_name,
            d.last_name,
            d.email,
            sp.name AS plan_name,
            sp.price AS plan_price
            FROM tbl_subscription_history sh
            LEFT JOIN tbl_driver d ON sh.driver_id = d.id
            LEFT JOIN tbl_subscription_plans sp ON sh.subscription_plan_id = sp.id
            ${whereClause}
            ORDER BY sh.id DESC`);

        const drivers = await DataFind(`SELECT id, first_name, last_name, email FROM tbl_driver ORDER BY id DESC`);

        res.render("subscription_history", {
            auth: req.user, general: req.general, noti: req.notification, per: req.per, 
            lan: req.lan.ld, land: req.lan.lname, history, drivers,
            driver_id: driver_id || '', status_filter: status_filter || 'all',
            date_from: date_from || '', date_to: date_to || ''
        });
    } catch (error) {
        console.log(error);
    }
});

// =====================================================
// Subscription Statistics/Dashboard
// =====================================================

router.get("/dashboard", auth, async (req, res) => {
    try {
        // Total subscriptions
        const totalSubscriptions = await DataFind(`SELECT COUNT(*) AS total FROM tbl_subscription_history`);
        
        // Active subscriptions
        const activeSubscriptions = await DataFind(`SELECT COUNT(*) AS total FROM tbl_driver 
            WHERE subscription_status = 'active' AND subscription_end_date >= NOW()`);
        
        // Expired subscriptions
        const expiredSubscriptions = await DataFind(`SELECT COUNT(*) AS total FROM tbl_driver 
            WHERE subscription_status = 'expired' OR (subscription_status = 'active' AND subscription_end_date < NOW())`);
        
        // Total revenue from subscriptions
        const totalRevenue = await DataFind(`SELECT COALESCE(SUM(price), 0) AS total FROM tbl_subscription_history 
            WHERE status = 'active'`);
        
        // Revenue by plan
        const revenueByPlan = await DataFind(`SELECT 
            sp.name AS plan_name,
            COUNT(sh.id) AS count,
            COALESCE(SUM(sh.price), 0) AS revenue
            FROM tbl_subscription_plans sp
            LEFT JOIN tbl_subscription_history sh ON sp.id = sh.subscription_plan_id
            GROUP BY sp.id, sp.name
            ORDER BY revenue DESC`);
        
        // Expiring soon (next 7 days)
        const expiringSoon = await DataFind(`SELECT 
            d.id,
            d.first_name,
            d.last_name,
            d.email,
            d.subscription_end_date,
            DATEDIFF(d.subscription_end_date, NOW()) AS remaining_days,
            sp.name AS plan_name
            FROM tbl_driver d
            LEFT JOIN tbl_subscription_plans sp ON d.current_subscription_plan_id = sp.id
            WHERE d.subscription_status = 'active' 
            AND d.subscription_end_date BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY)
            ORDER BY d.subscription_end_date ASC`);

        res.render("subscription_dashboard", {
            auth: req.user, general: req.general, noti: req.notification, per: req.per, 
            lan: req.lan.ld, land: req.lan.lname,
            totalSubscriptions: totalSubscriptions[0]?.total || 0,
            activeSubscriptions: activeSubscriptions[0]?.total || 0,
            expiredSubscriptions: expiredSubscriptions[0]?.total || 0,
            totalRevenue: totalRevenue[0]?.total || 0,
            revenueByPlan,
            expiringSoon
        });
    } catch (error) {
        console.log(error);
    }
});

module.exports = router;






