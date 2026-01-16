const { mySqlQury } = require('../middleware/db')
const axios = require('axios');


const skipDb = ['true', '1'].includes(String(process.env.SKIP_DB || '').toLowerCase());

const DataUpdate = async (table, setClause, whereClause, hostname, protocol) => {
    try {
        if (skipDb) return 1;
        const query = `UPDATE ${table} SET ${setClause} WHERE ${whereClause}`;
        const result = await mySqlQury(query);

        if (result.affectedRows === 0) {
            console.log(`[${protocol}://${hostname}] No rows updated for query: ${query}`);
            return -1;
        }

        return 1; // success
    } catch (error) {
        console.log(`[${protocol}://${hostname}] Error in DataUpdate:`, error);
        return -1;
    }
}

const DataDelete = async (table, whereClause, hostname, protocol) => {
    try {
        if (skipDb) return 1;
        const query = `DELETE FROM ${table} WHERE ${whereClause}`;
        const result = await mySqlQury(query);

        if (result.affectedRows === 0) {
            console.warn(`[${protocol}://${hostname}] No rows deleted for query: ${query}`);
            return -1;
        }

        return 1; // success
    } catch (error) {
        console.log(`[${protocol}://${hostname}] Error in DataDelete:`, error);
        return -1;
    }
}

const DataFind = async (query) => {
    try {
        if (skipDb) {
            // Provide safe defaults for common UI queries
            if (String(query).toLowerCase().includes('tbl_general_settings')) {
                return [{ title: 'Ridego', light_image: 'uploads/default-favicon.png' }];
            }
            return [];
        }
        const result = await mySqlQury(query);
        return result;
    } catch (error) {
        console.log("Error in DataFind:", error);
        return -1;
    }
}

const DataInsert = async (table, columns, values, hostname, protocol) => {
    try {
        if (skipDb) {
            return { insertId: 1 };
        }
        const query = `INSERT INTO ${table} (${columns}) VALUES (${values})`;
        const result = await mySqlQury(query);

        if (!result.insertId) {
            console.log(`[${protocol}://${hostname}] Insert failed for query: ${query}`);
            return -1;
        }

        return result; // Return inserted record ID
    } catch (error) {
        console.log(`[${protocol}://${hostname}] Error in DataInsert:`, error);
        return -1;
    }
}

module.exports = { DataFind, DataInsert, DataUpdate, DataDelete }