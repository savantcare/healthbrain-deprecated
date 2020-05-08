module.exports = {
  HOST: "localhost",
  USER: "root",
  PASSWORD: "",
  DB: "health_brain",
  dialect: "mysql",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  },
  DB_RECOMMENDATION: "sc_recommendation",
  DB_REMINDER: "sc_reminder",
  DB_USER: "sc_user",
  DB_SETTING: "sc_setting"
};
