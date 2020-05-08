# HealthBrain

## Why write exisiting angular in vue?

### A. User experience benefits

1. When page is reloaded and there is no correction to DB server or a slow connection to DB server the page should load from localstorage immediately.

2. When a page is already on the doctor browser and the doctor gives the commanbd "rec" then the recommendations show immediately from localcache and api is fired in the back. If the api returns new data the view is updated. (lazy-read)

3. When doctor adds a rec, the view gets updated. If server update fails then the view is reverted. (lazy-write)

4. When doctor is offline and open a patient file they see the page. #not-working

### B. Developer benefits

1. On server side interaction with the DB should happen through a ORM like sequlize. 

    1A. So standard queries are already written.

    1B. DB migrations can happen. [file:///node-server/models/recommendation.model.js]

2. Maintian state on the client. When recommendation card state changes the rec panel changes its view automatically.
In the current angular app the recommendation panel was listening on socket to update its view.

3. No HTML is generated on the server. All view is inside the .vue component. This view works on json returned by the server api

## What is the migration plan?
We get rec and rem component to work completely in the new architecture. Once they are cerifited then 10 developers are given the responsibility of delivered 5 components each week.

Within 2 weeks /p2 will get released once the architecture is finalized

## What is the ideal component on which other components are based?
Recommendation.

## How to run the app locally
There are two parts in current architecture
1. vue-client
2. node-server

Please read the README.md file in the each project folder.

# What is needed to write a new component

For the model component RecommendationCard the following files needed to be created:

## Client side
1. vue-client/src/components/RecommendationCard.vue file    -> This has the presentation layer (html), styling layer (css), JS to change the state. This file is compiled into seperate html js and css by vue-cli
2. vue-client/store/modules/recommendation.js               -> Vue state of this component. Mutation functions to state. Socket functions to change state.

## Server side
1. node-server/models/database/recommendation.database.js   -> Sequalize connection details
2. node-server/models/recommendation.model.js               -> Sequalize sql structure of this component
3. node-server/routes/recommendation.route.js               -> Routes of this component and emit socket messages

**Todo** 

How to keep these files in a seperate repo. How to run them independently.
Possible solution:
1. https://github.com/teambit/bit


## What are the tags used in code?
Todo
Question
Fix