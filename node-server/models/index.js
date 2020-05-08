const recommendationDB = require("./database/recommendation.database.js")
const reminderDB = require("./database/reminder.database.js")
const userDB = require("./database/user.database.js")
const settingDB = require("./database/setting.database.js")

module.exports = {
  recommendationDB: recommendationDB,
  reminderDB: reminderDB,
  userDB: userDB,
  settingDB: settingDB
}
