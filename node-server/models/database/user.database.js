const dbConfig = require("../../config/db.config.js");

const Sequelize = require("sequelize");
const userSequelize = new Sequelize(dbConfig.DB_USER, dbConfig.USER, dbConfig.PASSWORD, {
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

const userDB = {}

userDB.Sequelize = Sequelize
userDB.sequelize = userSequelize

userDB.users = require('../user.model.js')(userSequelize, Sequelize)
userDB.userRoles = require('../userRole.model.js')(userSequelize, Sequelize)

userDB.sequelize.sync()

module.exports = userDB