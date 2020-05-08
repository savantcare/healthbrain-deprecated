const router = require('express').Router()
const db = require('../models')
const Recommendation = db.recommendationDB.recommendations

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
      const queryResult = await Recommendation.update({
        description: req.body.description
      }, {
        where: {
          id: req.params.id
        }
      })
      io.to(`room-${req.body.patientId}-doctor`).emit("UPDATE_RECOMMENDATION", req.body)
      res.send(queryResult) /* Fix: Instead of sending the whole object only OK needs to be sent*/
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occured while update the Recommendation"
      })
    }
  })

  router.patch('/:id', async (req, res) => {
    try {
      const queryResult = await Recommendation.update({
        discontinue: true
      }, {
        where: {
          id: req.params.id
        }
      })
      io.to(`room-${req.body.patientId}-doctor`).emit("DISCONTINUE_RECOMMENDATION", req.params.id)
      res.send(queryResult) /* Fix: Instead of sending the whole objefct only OK needs to be sent*/
    } catch (err) {
      res.status(500).send({
        message: err.message || "Some error occured while patch the Recommendationh"
      })
    }
  })

  return router
}