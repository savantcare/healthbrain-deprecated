// The module.exports is a special object which is included in every JS file in the Node. js application by default
module.exports = {
  RECOMMENDATION_API_URL: "http://localhost:8000/recommendations",
  REMINDER_API_URL: "http://localhost:8000/reminders",
  SETTING_API_URL: "http://localhost:8000/settings",
  LOGIN_API_URL: "http://localhost:8000/auth/login",
  ROLE_API_URL: "http://localhost:8000/user-roles",
  SOCKET_API_URL: "http://localhost:8000",

  ADD_DIALOG: 1,
  STYLE_1: 1,
  STYLE_2: 2,

  // Tab constant values.
  ADD_RECOMMENDATION: 1,
  EDIT_RECOMMENDATION: 2,
  MULTIPLE_CHANGE_RECOMMENDATION: 3,
  ADD_REMINDER: 4,
  EDIT_REMINDER: 5,
  MULTIPLE_CHANGE_REMINDER: 6
}