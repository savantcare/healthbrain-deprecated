const express = require('express')
const router = express.Router()

module.exports = (io) => {
  const authRoutes = require('./auth.routes')
  const recommendationRoutes = require('./recommendation.route')(io)
  const reminderRoutes = require('./reminder.route')(io)
  const settingRoutes = require('./setting.route')
  const userRoleRoutes = require('./userRole.routes')

  router.use('/auth', authRoutes)
  router.use('/recommendations', recommendationRoutes)
  router.use('/reminders', reminderRoutes)
  router.use('/settings', settingRoutes)
  router.use('/user-roles', userRoleRoutes)

  return router
}