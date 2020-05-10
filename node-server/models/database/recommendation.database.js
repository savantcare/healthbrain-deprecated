const config = require('config');

const Sequelize = require("sequelize");
const recommendationSequelize = new Sequelize(config.DB_RECOMMENDATION, config.USER, config.PASSWORD, {
  host: config.HOST,
  dialect: config.dialect,
  operatorsAliases: false,

  pool: {
    max: config.pool.max,
    min: config.pool.min,
    acquire: config.pool.acquire,
    idle: config.pool.idle
  }
});

const recommendationDB = {}

recommendationDB.Sequelize = Sequelize
recommendationDB.sequelize = recommendationSequelize

recommendationDB.recommendations = require('../recommendation.model.js')(recommendationSequelize, Sequelize)

recommendationDB.sequelize.sync()

module.exports = recommendationDB