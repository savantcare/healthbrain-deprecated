Q1) How to see app behavior when DB server connection is lost?
healthbrain/node-server> npm run start-auth # this will start a local fake DB server
Use the web app and then ctrl+c the console to exit out of start-auth
Now refresh the web app.
The data will come from localstorage but you will toast message saying:
"Server connection error"

Q2) How to see app behavior when DB server takes 10 seconds to reply to API?
healthbrain/node-server> edit node-server/server.js
Comment out:
server.use(function(req, res, next){
  setTimeout(next, 10000);
});

Scenario 1:
On the UI discontinue a rex. Inside database.json is will not say Discontinue:true UI will continue to show it as discontinued. After 10 seconds database.json will show Discontinue:true. In this case the app was able to give doctor 10 second faster response.

Scenario 2:
The web page shows the current list of recommendations
Edit node-server/database.json and change the description of a recommendation.
Reload the page
The web page should show the edited recommendation.
Status: Fail