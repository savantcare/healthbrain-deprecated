const dbConfig = require("../../config/db.config.js");

const Sequelize = require("sequelize");
const recommendationSequelize = new Sequelize(dbConfig.DB_RECOMMENDATION, dbConfig.USER, dbConfig.PASSWORD, {
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

const recommendationDB = {}

recommendationDB.Sequelize = Sequelize
recommendationDB.sequelize = recommendationSequelize

recommendationDB.recommendations = require('../recommendation.model.js')(recommendationSequelize, Sequelize)

recommendationDB.sequelize.sync()

module.exports = recommendationDB