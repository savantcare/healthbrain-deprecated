const dbConfig = require("../../config/db.config.js");

const Sequelize = require("sequelize");
const reminderSequelize = new Sequelize(dbConfig.DB_REMINDER, dbConfig.USER, dbConfig.PASSWORD, {
  host: dbConfig.HOST,
  dialect: dbConfig.dialect,
  operatorsAliases: false,

  pool: {
    max: dbConfig.pool.max,
    min: dbConfig.pool.min,
    acquire: dbConfig.pool.acquire,
    idle: dbConfig.pool.idle
  }
});

const reminderDB = {}

reminderDB.Sequelize = Sequelize
reminderDB.sequelize = reminderSequelize

reminderDB.reminders = require('../reminder.model.js')(reminderSequelize, Sequelize)

reminderDB.sequelize.sync()

module.exports = reminderDB