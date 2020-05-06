const fs = require('fs')
const bodyParser = require('body-parser')
const jsonServer = require('json-server')
const jwt = require('jsonwebtoken')

const http = require('http')
const app = require('express')()
const cors = require("cors");


var corsOptions = {
  origin: "http://localhost:8080"
};

app.use(cors(corsOptions));
// app.use(function (req, res, next) {
//   res.setHeader("Access-Control-Allow-Origin", "http://localhost:8080");

//   res.setHeader(
//     "Access-Control-Allow-Methods",
//     "GET, POST, OPTIONS, PUT, PATCH, DELETE"
//   );
//   res.setHeader(
//     "Access-Control-Allow-Headers",
//     "X-Requested-With,content-type,cache-control"
//   );

//   // Set to true if you need the website to include cookies in the requests sent
//   // to the API (e.g. in case you use sessions)
//   res.setHeader("Access-Control-Allow-Credentials", true);

//   // Pass to next layer of mddleware
//   next();
// });

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

const db = require("./models");

db.sequelize.sync();

// require("./socket")(server)

const io = require('socket.io')(server)
io.on("connection", socket => {
  console.log(`Socket connected: ${socket.id}`)

  // socket.on("EVENT_UPDATE_RECOMMENDATIONS", data => {
  //   const { list, roomId } = data
  //   console.log(roomId)
  //   io.to(`${roomId}-doctor`).emit("ON_UPDATE_RECOMMENDATIONS", list)
  // })

  // socket.on("EVENT_UPDATE_REMINDERS", data => {
  //   io.emit("ON_UPDATE_REMINDERS_FOR_PATIENT_ID_$X", data)
  // })

  socket.on("CREATE_ROOM", roomId => {
    console.log(`join to room ${roomId}`)
    socket.join(roomId)
  })
})

const router = require('./routes')(io)
app.use(router)