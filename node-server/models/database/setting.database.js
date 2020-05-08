const dbConfig = require("../../config/db.config.js");

const Sequelize = require("sequelize");
const settingSequelize = new Sequelize(dbConfig.DB_SETTING, dbConfig.USER, dbConfig.PASSWORD, {
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

const settingDB = {}

settingDB.Sequelize = Sequelize
settingDB.sequelize = settingSequelize

settingDB.settings = require('../setting.model.js')(settingSequelize, Sequelize)

settingDB.sequelize.sync()

module.exports = settingDB