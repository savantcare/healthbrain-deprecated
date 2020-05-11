Config system is managed with https://github.com/lorenwest/node-config

This folder will always have default.json and you can create override values in [environment].json

It is important that production.json is never comitted since it contains sensitive passwords.

Q) How does the app decide which override file to use?
$ export NODE_ENV=production
$ node my-app.js