const fs = require('fs')
const bodyParser = require('body-parser')
const jsonServer = require('json-server')
const jwt = require('jsonwebtoken')

const server = jsonServer.create()
const router = jsonServer.router('./database.json')
const userdb = JSON.parse(fs.readFileSync('./users.json', 'UTF-8'))

server.use(bodyParser.urlencoded({ extended: true }))
server.use(bodyParser.json())

//server.use(function(req, res, next){
//  setTimeout(next, 10000);
//});

server.use(jsonServer.defaults());


const SECRET_KEY = '123456789'

const expiresIn = '1h'

// Create a token from a payload 
function createToken(payload) {
  return jwt.sign(payload, SECRET_KEY, { expiresIn })
}

// Verify the token 
function verifyToken(token) {
  return jwt.verify(token, SECRET_KEY, (err, decode) => decode !== undefined ? decode : err)
}

// Check if the user exists in database
function isAuthenticated({ email, password }) {
  return userdb.users.findIndex(user => user.email === email && user.password === password) !== -1
}

// Register New User
server.post('/auth/register', (req, res) => {
  console.log("register endpoint called; request body:");
  console.log(req.body);
  const { email, password } = req.body;

  if (isAuthenticated({ email, password }) === true) {
    const status = 401;
    const message = 'Email and Password already exist';
    res.status(status).json({ status, message });
    return
  }

  fs.readFile("./users.json", (err, data) => {
    if (err) {
      const status = 401
      const message = err
      res.status(status).json({ status, message })
      return
    };

    // Get current users data
    var data = JSON.parse(data.toString());

    // Get the id of last user
    var last_item_id = data.users[data.users.length - 1].id;

    //Add new user
    data.users.push({ id: last_item_id + 1, email: email, password: password }); //add some data
    var writeData = fs.writeFile("./users.json", JSON.stringify(data), (err, result) => {  // WRITE
      if (err) {
        const status = 401
        const message = err
        res.status(status).json({ status, message })
        return
      }
    });
  });

  // Create token for new user
  const access_token = createToken({ email })
  console.log("Access Token:" + access_token);
  res.status(200).json({ access_token })
})

// Login to one of the users from ./users.json
server.post('/auth/login', (req, res) => {
  console.log("login endpoint called; request body:");
  console.log(req.body);
  const { email, password } = req.body;
  if (isAuthenticated({ email, password }) === false) {
    const status = 401
    const message = 'Incorrect email or password'
    res.status(status).json({ status, message })
    return
  }
  const userIdx = userdb.users.findIndex(user => user.email === email && user.password === password)
  const user = userdb.users[userIdx]

  const access_token = createToken({ email })
  console.log("Access Token:" + access_token);
  res.status(200).json({ access_token: access_token, role: user.role })
})

server.use(/^(?!\/auth).*$/, (req, res, next) => {
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

server.use(router)

server.listen(8000, () => {
  console.log('Run Auth API Server')
})

const io = require('socket.io')()
io.on("connection", socket => {
  console.log(`Socket connected: ${socket.id}`)
  // io.emit("test_emit", { param1: "value1", param2: "value2" })

  socket.on("EVENT_UPDATE_RECOMMENDATIONS", data => {
    const { list, roomId } = data
    console.log(roomId)
    /*
      Q) Why is the room name "roomId-doctor"?
      Conside the following example:
      The userRole doctor is allowed access to 80 vue components. The userRole "Doctor admin assitant (DA)" is allowed access to 20 vue components.
      roomName = patient ID - user role.
      When DA logs in they only listen to ${roomId}-da and when doctor logs in they only listen to ${roomId}-doctor
      There is a different socker.on() for each panel
      Now inside each socket.on() block I can decide one of 3 scenarios:
      1. Publish only on ${roomId}-da
      2. Publish only on ${roomId}-doctor
      3. Publish both on ${roomId}-da and ${roomId}-doctor
    */
    io.to(`${roomId}-doctor`).emit("ON_UPDATE_RECOMMENDATIONS", list)
  })

  socket.on("EVENT_UPDATE_REMINDERS", data => {
    io.emit("ON_UPDATE_REMINDERS_FOR_PATIENT_ID_$X", data)
  })

  socket.on("CREATE_ROOM", roomId => {
    console.log(`join to room ${roomId}`)
    socket.join(roomId)
  })
})
io.listen(3000)
