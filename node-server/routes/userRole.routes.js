const router = require('express').Router()
const db = require('../models')
const UserRole = db.userRoles

router.post('/', async (req, res) => {
  try {
    const newUserRole = await UserRole.create(req.body)
    res.send(newUserRole)
  } catch (err) {
    res.status(500).send({
      message: err.message || "Some error occurred while creating the UserRole"
    })
  }
})

router.get('/', async (req, res) => {
  try {
    const queryResult = await UserRole.findAll()
    res.send(queryResult)
  } catch (err) {
    res.status(500).send({
      message: err.message || "Some error occurred while fetching the UserRole"
    })
  }
})

router.get('/:id', async (req, res) => {
  try {
    const queryResult = await UserRole.findOne({ where: { id: req.params.id } })
    res.send(queryResult)
  } catch (err) {
    res.status(500).send({
      message: err.message || "Some error occured while fetching the UserRole"
    })
  }
})



module.exports = router