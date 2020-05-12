const router = require('express').Router()
const db = require('../models')
const Component = db.componentDB.components

router.post('/', async (req, res) => {
  try {
    const newComponent = await Component.create(req.body)
    res.send(newComponent)
  } catch (err) {
    res.status(500).send({
      message: err.message || "Some error occurred while creating the Component"
    })
  }
})

router.get('/getByType/:id', async (req, res) => {
  try {
    const queryResult = await Component.findAll({
      where: { type: req.params.id }
    })
    res.send(queryResult)
  } catch (err) {
    res.status(500).send({
      message: err.message || "Some error occurred while fetching the Component"
    })
  }
})



module.exports = router