const router = require('express').Router()
const db = require('../models')
const Recommendation = db.recommendationDB.recommendations
const User = db.userDB.users

module.exports = (io) => {
  router.post('/', async (req, res) => {
    try {
      const newRecommendation = await Recommendation.create(req.body)       // See 

      /* this informs all the clients.
       -doctor is added so that DA does not get high security messages on their socket. 
       So components that DA does not have access to they will not get the message
       Question: What is inside newRecommendation?
       */
      io.to(`room-${req.body.patientId}-doctor`).emit("ADD_RECOMMENDATION", newRecommendation)

      res.send(newRecommendation) /* Fix: Instead of sending the whole object only OK needs to be sent*/
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occurred while creating the Recommenation"
      })
    }
  })

  router.get('/', async (req, res) => {
    try {
      const { patientId } = req.query
      const queryResult = await Recommendation.findAll({
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
      await Recommendation.update({
        discontinue: true,
        discontinueAt: new Date(),
        discontinuedByUserId: req.body.discontinuedByUserId
      }, {
        where: {
          id: req.params.id
        }
      })

      // Add new value
      const newData = {
        recommendationID: req.body.recommendationID,
        patientId: req.body.patientId,
        createdByUserId: req.body.createdByUserId,
        description: req.body.description,
        createdAt: new Date()
      }
      await Recommendation.create(newData)

      io.to(`room-${req.body.patientId}-doctor`).emit("UPDATE_RECOMMENDATION", req.body)
      res.send("ok") /* Fix: Instead of sending the whole object only OK needs to be sent*/
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occured while update the Recommendation"
      })
    }
  })

  router.patch('/:id', async (req, res) => {
    try {
      const queryResult = await Recommendation.update({
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
        message: err.message || "Some error occured while patch the Recommendation"
      })
    }
  })

  router.get('/getHistory/:id', async (req, res) => {
    try {
      const histories = await Recommendation.findAll({
        where: {
          recommendationID: req.params.id
        }
      })
      /**
       * Expect result:
       *  {
       *    "content": "History 1",
       *    "info": "Added by {User} on {Date}" || "Updated by {User} on {Date}"
       *  }
       * 
       */

      const promises = histories.map(async history => {
        const { description, createdByUserId, discontinuedByUserId, createdAt, discontinueAt } = history
        if (discontinuedByUserId == null) { // The case which there is no update history
          try {
            const user = await User.findOne({
              attributes: ['name'],
              where: { id: createdByUserId }
            })

            const { name } = user
            const data = {
              content: description,
              info: `Added by ${name} on ${new Date(createdAt).toDateString()}`
            }
            console.log(data)
            return data
          } catch (err) {
            return err.message || "Some error occured while get user info"
          }
        } else { // The case which there is an update history
          try {
            const user = await User.findOne({
              attributes: ['name'],
              where: { id: discontinuedByUserId }
            })

            const { name } = user
            return {
              content: description,
              info: `Changed by ${name} on ${new Date(discontinueAt).toDateString()}`
            }
          } catch (err) {
            return err.message || "Some error occured while get user info"
          }
        }
      })

      const result = await Promise.all(promises)
      res.send(result)
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occured while get the recommendation history"
      })
    }
  })

  return router
}