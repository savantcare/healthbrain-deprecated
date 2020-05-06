const router = require('express').Router()
const db = require('../models')
const Reminder = db.reminders

module.exports = (io) => {
  router.post('/', async (req, res) => {
    try {
      const newReminder = await Reminder.create(req.body)
      io.to(`room-${req.body.patientId}-doctor`).emit("ADD_REMINDER", newReminder)
      io.to(`room-${req.body.patientId}-receptionist`).emit("ADD_REMINDER", newReminder)
      res.send(newReminder)
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occurred while creating the Recommenation"
      })
    }
  })

  router.get('/', async (req, res) => {
    try {
      const { patientId } = req.query
      const queryResult = await Reminder.findAll({
        where: {
          patientId: patientId
        }
      })
      res.send(queryResult)
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occurred while fetching the Recommenation"
      })
    }
  })

  router.put('/:id', async (req, res) => {
    try {
      const queryResult = await Reminder.update({
        description: req.body.description
      }, {
        where: {
          id: req.params.id
        }
      })
      io.to(`room-${req.body.patientId}-doctor`).emit("UPDATE_REMINDER", req.body)
      io.to(`room-${req.body.patientId}-receptionist`).emit("UPDATE_REMINDER", req.body)
      res.send(queryResult)
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occured while update the Reminder"
      })
    }
  })

  router.patch('/:id', async (req, res) => {
    try {
      const queryResult = await Reminder.update({
        discontinue: true
      }, {
        where: {
          id: req.params.id
        }
      })
      io.to(`room-${req.body.patientId}-doctor`).emit("DISCONTINUE_REMINDER", req.params.id)
      io.to(`room-${req.body.patientId}-receptionist`).emit("DISCONTINUE_REMINDER", req.params.id)
      res.send(queryResult)
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occured while patch the Reminderh"
      })
    }
  })

  return router
}