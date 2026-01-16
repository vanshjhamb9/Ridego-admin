/* jshint esversion: 6 */
/* jshint esversion: 8 */
/* jshint node: true */

const schedule = require('node-schedule');
const { DataFind, DataUpdate } = require("../middleware/databse_query");
const sendOneNotification = require("../middleware/send");

/**
 * Cron job to check and expire subscriptions
 * Runs every hour
 */
const subscriptionExpirationJob = schedule.scheduleJob('0 * * * *', async function() {
    try {
        console.log('[Subscription Cron] Checking for expired subscriptions...');
        
        // =====================================================
        // STEP 1: Auto-activate subscriptions with valid end_date
        // =====================================================
        // If driver has subscription_end_date in future but status is not 'active', activate it
        const subscriptionsToActivate = await DataFind(`
            SELECT id, subscription_end_date 
            FROM tbl_driver 
            WHERE subscription_end_date IS NOT NULL
            AND subscription_end_date > NOW()
            AND (subscription_status IS NULL OR subscription_status = 'none' OR subscription_status = 'expired')
        `);

        if (subscriptionsToActivate != "" && subscriptionsToActivate != -1 && subscriptionsToActivate.length > 0) {
            console.log(`[Subscription Cron] Found ${subscriptionsToActivate.length} subscription(s) to auto-activate`);
            
            for (let i = 0; i < subscriptionsToActivate.length; i++) {
                const driverId = subscriptionsToActivate[i].id;
                
                const activateResult = await DataUpdate(
                    `tbl_driver`, 
                    `subscription_status = 'active'`, 
                    `id = '${driverId}'`,
                    'cron',
                    'internal'
                );

                if (activateResult == 1) {
                    console.log(`[Subscription Cron] Auto-activated subscription for driver ${driverId}`);
                }
            }
        }
        
        // =====================================================
        // STEP 2: Expire subscriptions that have passed end_date
        // =====================================================
        // Get all active subscriptions that have expired
        const expiredSubscriptions = await DataFind(`
            SELECT id, subscription_end_date 
            FROM tbl_driver 
            WHERE subscription_status = 'active' 
            AND subscription_end_date < NOW()
        `);

        if (expiredSubscriptions == "" || expiredSubscriptions == -1) {
            console.log('[Subscription Cron] No expired subscriptions found.');
        } else {
            console.log(`[Subscription Cron] Found ${expiredSubscriptions.length} expired subscription(s)`);

            // Update expired subscriptions
            for (let i = 0; i < expiredSubscriptions.length; i++) {
                const driverId = expiredSubscriptions[i].id;
                
                // Update subscription status to expired
                const updateResult = await DataUpdate(
                    `tbl_driver`, 
                    `subscription_status = 'expired'`, 
                    `id = '${driverId}' AND subscription_status = 'active'`,
                    'cron',
                    'internal'
                );

                if (updateResult == 1) {
                    console.log(`[Subscription Cron] Updated driver ${driverId} subscription to expired`);
                    
                    // Send notification to driver
                    try {
                        await sendOneNotification(
                            driverId,
                            "Subscription Expired",
                            "Your subscription has expired. Please recharge to continue accepting rides.",
                            "driver"
                        );
                    } catch (notifError) {
                        console.log(`[Subscription Cron] Notification error for driver ${driverId}:`, notifError);
                    }
                }
            }
        }

        // Check for subscriptions expiring in 2 days and send warning
        const twoDaysFromNow = new Date();
        twoDaysFromNow.setDate(twoDaysFromNow.getDate() + 2);
        const twoDaysStr = twoDaysFromNow.toISOString().slice(0, 19).replace('T', ' ');

        const expiringSoon = await DataFind(`
            SELECT id, subscription_end_date 
            FROM tbl_driver 
            WHERE subscription_status = 'active' 
            AND subscription_end_date >= NOW()
            AND subscription_end_date <= '${twoDaysStr}'
        `);

        if (expiringSoon != "" && expiringSoon != -1 && expiringSoon.length > 0) {
            console.log(`[Subscription Cron] Found ${expiringSoon.length} subscription(s) expiring soon`);
            
            for (let i = 0; i < expiringSoon.length; i++) {
                const driverId = expiringSoon[i].id;
                
                // Send notification (you might want to track if notification was already sent to avoid spam)
                try {
                    await sendOneNotification(
                        driverId,
                        "Subscription Expiring Soon",
                        "Your subscription expires in 2 days. Recharge now to continue driving!",
                        "driver"
                    );
                } catch (notifError) {
                    console.log(`[Subscription Cron] Notification error for driver ${driverId}:`, notifError);
                }
            }
        }

        console.log('[Subscription Cron] Job completed successfully');
    } catch (error) {
        console.error('[Subscription Cron] Error:', error);
    }
});

console.log('[Subscription Cron] Subscription expiration job scheduled to run every hour');

module.exports = { subscriptionExpirationJob };









