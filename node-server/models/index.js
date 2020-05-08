const dbConfig = require("../config/db.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
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

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.settings = require("./setting.model.js")(sequelize, Sequelize)
db.userRoles = require('./userRole.model')(sequelize, Sequelize)

db.sequelize.sync()

const recommendationDB = require("./database/recommendation.database.js")
const reminderDB = require("./database/reminder.database.js")
const userDB = require("./database/user.database.js")


module.exports = {
  recommendationDB: recommendationDB,
  reminderDB: reminderDB,
  other: db,
  userDB: userDB
}
