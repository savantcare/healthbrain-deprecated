const router = require('express').Router()
const db = require('../models')
const Reminder = db.reminderDB.reminders
const uniqid = require('uniqid')

module.exports = (io) => {
  router.post('/', async (req, res) => {
    try {
      const newReminder = await Reminder.create(req.body)       // See 

      /* this informs all the clients.
       -doctor is added so that DA does not get high security messages on their socket. 
       So components that DA does not have access to they will not get the message
       Question: What is inside newReminder?
       */
      io.to(`room-${req.body.patientId}-doctor`).emit("ADD_RECOMMENDATION", newReminder)

      res.send(newReminder) /* Fix: Instead of sending the whole object only OK needs to be sent*/
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

  router.put('/:id', async (req, res) => {    // Replace existing row with new row
    try {
      // Update the existing object to discontinue.
      await Reminder.update({
        discontinue: true,
        discontinueAt: new Date()
      }, {
        where: {
          id: req.params.id
        }
      })

      // Add new value
      let newData = req.body
      newData["id"] = uniqid()
      await Reminder.create(newData)

      io.to(`room-${req.body.patientId}-doctor`).emit("UPDATE_RECOMMENDATION", req.body)
      res.send("ok") /* Fix: Instead of sending the whole object only OK needs to be sent*/
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occured while update the Reminder"
      })
    }
  })

  router.patch('/:id', async (req, res) => {
    try {
      const queryResult = await Reminder.update({
        discontinue: true,
        discontinueAt: new Date()
      }, {
        where: {
          id: req.params.id
        }
      })
      io.to(`room-${req.body.patientId}-doctor`).emit("DISCONTINUE_RECOMMENDATION", req.params.id)
      res.send(queryResult) /* Fix: Instead of sending the whole objefct only OK needs to be sent*/
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occured while patch the Reminderh"
      })
    }
  })

  return router
}