const bodyParser = require('body-parser')
const jwt = require('jsonwebtoken')

const http = require('http')
const app = require('express')()
const cors = require("cors");


var corsOptions = {
  origin: "http://localhost:8080"
};

app.use(cors(corsOptions));

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())


const SECRET_KEY = '123456789'

// Verify the token 
function verifyToken(token) {
  return jwt.verify(token, SECRET_KEY, (err, decode) => decode !== undefined ? decode : err)
}

app.use(/^(?!\/auth).*$/, (req, res, next) => {
  if (req.headers.authorization === undefined || req.headers.authorization.split(' ')[0] !== 'Bearer') {
    const status = 401
    const message = 'Error in authorization format'
    res.status(status).json({ status, message })
    return
  }
  try {
    let verifyTokenResult;
    verifyTokenResult = verifyToken(req.headers.authorization.split(' ')[1]);

    if (verifyTokenResult instanceof Error) {
      const status = 401
      const message = 'Access token not provided'
      res.status(status).json({ status, message })
      return
    }
    next()
  } catch (err) {
    const status = 401
    const message = 'Error access_token is revoked'
    res.status(status).json({ status, message })
  }
})



const server = http.createServer(app)
server.listen(8000, () => {
  console.log("Node.js server is running")
})

require("./models");

// db.sequelize.sync();

// require("./socket")(server)

const io = require('socket.io')(server)
io.on("connection", socket => {
  console.log(`Socket connected: ${socket.id}`)

  socket.on("CREATE_ROOM", roomId => {
    console.log(`join to room ${roomId}`)
    socket.join(roomId)
  })
})

const router = require('./routes')(io)
app.use(router)