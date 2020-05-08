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
  DB_RECOMMENDATION: "hb_recommendation",
  DB_REMINDER: "hb_reminder",
  DB_USER: "hb_user",
  DB_SETTING: "hb_setting"
};
