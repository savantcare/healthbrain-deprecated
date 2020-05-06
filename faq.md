# Q1) How to see app behavior when DB server connection is lost?
healthbrain/node-server> npm run start-auth # this will start a local fake DB server

Use the web app and then ctrl+c the console to exit out of start-auth

Now refresh the web app.

The data will come from localstorage but you will toast message saying:

"Server connection error"

# Q2) How to see app behavior when DB server takes 10 seconds to reply to API?

healthbrain/node-server> emacs node-server/server.js

Comment out:
```
server.use(function(req, res, next){
  setTimeout(next, 10000);
});
```

## Scenario 1:

On the UI discontinue a rex. 

Inside database.json it will not say Discontinue:true UI will continue to show it as discontinued. 

After 10 seconds database.json will show Discontinue:true. 

In this case the app was able to give doctor 10 second faster response.

## Scenario 2:

The web page shows the current list of recommendations

Edit node-server/database.json and change the description of a recommendation.

Reload the page

The web page should show the edited recommendation.

Status: Fail

# Q3) Why is each component not a seperate npm package?

The goal is for recommendation-panel and recommendation-card to have the same vuex store. So when the state changes in recommendation-panel the view of recommendation-card is automatically updated.

The code till 4th May implemented recommendation-panel and recommendation-card as two different npm packages. Different npm packages cannot share the same vuex store.

Hence recommendation-panel and recommendation-card cannot be two seperate npm packages they have to be components of the same vue app.