const http = require('http');
const express = require('express');
const socketIO = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIO(server);

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
  res.setHeader('Access-Control-Allow-Credentials', true);

  next();
})

const port = process.env.PORT || 3000;

app.use(express.static(__dirname));

io.on('connection', (socket) => {
  console.log('New user connected');

  socket.on('message', (message) => {
    console.log(message);
  });

  socket.on('disconnect', () => {
    console.log('User disconnected')
  });
});

server.listen(port, () => {
  console.log(`Server is up and running on port ${port}`);
});