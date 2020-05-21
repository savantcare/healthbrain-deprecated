// The module.exports is a special object which is included in every JS file in the Node. js application by default
module.exports = {
  // API urls
  RECOMMENDATION_API_URL: "http://localhost:8000/recommendations",
  REMINDER_API_URL: "http://localhost:8000/reminders",
  SETTING_API_URL: "http://localhost:8000/settings",
  LOGIN_API_URL: "http://localhost:8000/auth/login",
  ROLE_API_URL: "http://localhost:8000/user-roles",
  SOCKET_API_URL: "http://localhost:8000",
  USER_API_URL: "http://localhost:8000/users",
  COMPONENT_API_URL: "http://localhost:8000/components",

  LEFT_SIDE_COMPONENTS: [
    { key: "recommendation", value: () => import('./components/domain/RecommendationPanel/Implementation.vue') },
    { key: "reminder", value: () => import('./components/domain/ReminderPanel/Implementation.vue') },
    { key: "other", value: () => import('./components/LeftSideOtherPanel.vue') }
  ],

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