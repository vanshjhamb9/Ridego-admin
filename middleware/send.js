const axios = require('axios');
const { DataFind } = require("./databse_query");

const sendOneNotification = async (text, type, id, data) => {
    try {
        const general_setting = await DataFind(`SELECT * FROM tbl_general_settings`)
        
        // Validate OneSignal configuration exists
        if (!general_setting || general_setting == "" || general_setting == -1) {
            console.log('OneSignal: General settings not found');
            return;
        }
        
        const app_id = general_setting[0].one_app_id ? String(general_setting[0].one_app_id).trim() : null;
        const api_key = general_setting[0].one_api_key ? String(general_setting[0].one_api_key).trim() : null;
        
        // Validate app_id and api_key are present and valid (not empty after trimming)
        if (!app_id || app_id === '' || app_id === 'null' || app_id === 'undefined' || 
            !api_key || api_key === '' || api_key === 'null' || api_key === 'undefined') {
            console.log('OneSignal: app_id or api_key is missing/invalid. Skipping notification.');
            return;
        }
        
        // OneSignal app_id should be a valid UUID format (basic check)
        const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
        if (!uuidRegex.test(app_id)) {
            console.log(`OneSignal: app_id format is invalid (should be UUID format). Current value: "${app_id}". Skipping notification.`);
            return;
        }

        let message

    if (data === undefined) {
        message = {
            app_id: app_id,
            contents: { "en": text },
            headings: { "en": general_setting[0].title },
            included_segments: ["Subscribed Users"],
            filters: [
                { "field": "tag", "key": "subscription_user_Type", "relation": "=", "value": type },
                { "operator": "AND" },
                { "field": "tag", "key": "Login_ID", "relation": "=", "value": id }
            ]
        };

    } else {
        message = {
            app_id: app_id,
            contents: { "en": data.description }, // en-GB
            headings: { "en": data.title },
            included_segments: ["Subscribed Users"],
            filters: [
                { "field": "tag", "key": "subscription_user_Type", "relation": "=", "value": type },
                { "operator": "AND" },
                { "field": "tag", "key": "Login_ID", "relation": "=", "value": id }
            ],
            big_picture: data.imageUrl // Only Live Url Work
        };
    }


    axios.post('https://onesignal.com/api/v1/notifications', message, {
        headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'Authorization': `Basic ${api_key}`
        }
    })
        .then(response => {
            console.log('Notification send successfully');
        })
        .catch(error => {
            if (error && error.response && error.response.data) {
                console.log('OneSignal error:', error.response.data);
            } else if (error && error.request) {
                // request was made but no response received
                console.log('No response received from OneSignal:', error.message || error);
            } else {
                // something happened while setting up the request
                console.log('Error sending notification:', error && (error.message || error));
            }
            // optional stack for debugging
            if (error && error.stack) console.debug(error.stack);
        });
    } catch (error) {
        console.log('Error in sendOneNotification:', error.message || error);
    }
}




module.exports = sendOneNotification;
