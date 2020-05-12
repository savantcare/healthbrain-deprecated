# HealthBrain

![patient file](./docs/patient-file.png)


* [Why write a new patient file app?](#why-write-a-new-patient-file-app)
* [Why re-write the exisiting angular in vue?](#why-re-write-the-exisiting-angular-in-vue)
* Why is each component not a seperate npm package?
* [What is the migration plan?](#what-is-the-migration-plan)
* [What is the ideal component on which other components are based?](#what-is-the-ideal-component-on-which-other-components-are-based?)
* [What is needed to write a new component?](#what-is-needed-to-write-a-new-component)
* [What are the tags used in code?](#what-are-the-tags-used-in-code)
* What is the code review process?
* [How to run the app locally?](#how-to-run-the-app-locally)
* How to see app behavior when DB connection is lost?
* How to see app behavior when DB takes 10 seconds for API response?
* How is the state of patient on a historical date generated?

## Why write a new patient file app?

* Be atleast as good as paper
* [Go out of the way of patient doctor relationship](https://khn.org/news/death-by-a-thousand-clicks/)

## Why re-write the exisiting angular in vue?

The current angular app was developed to discover the psychiatrists needs. The system was not pre-architected to deliver the discovered features.

### A. User experience benefits

1. When page is reloaded and there is no connection to DB server or a slow connection to DB server the page should load from localstorage immediately.

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

## Why is each component not a seperate npm package?

The goal is for recommendation-panel and recommendation-card to have the same vuex store. So when the state changes in recommendation-panel the view of recommendation-card is automatically updated.

[The code till 4th May](https://github.com/vikaskedia/healthbrain) implemented recommendation-panel and recommendation-card as two different npm packages. Different npm packages cannot share the same vuex store.

Hence recommendation-panel and recommendation-card cannot be two seperate npm packages they have to be components of the same vue app.

## What is the migration plan?
We get rec and rem component to work completely in the new architecture. Once they are cerifited then 10 developers are given the responsibility of delivered 5 components each week.

Within 2 weeks /p2 will get released once the architecture is finalized

## What is the ideal component on which other components are based?
Recommendation.

## What is needed to write a new component

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

 * Todo:
 * Question:
 * Fix:

To find files with Fix tag: 

healthbrain> grep -ir -n --exclude-dir={node_modules,.git} ' Fix:' ./

## What is the code review process?
https://www.youtube.com/watch?v=8fx-EaOUK2E

## How to run the app locally

```bash
git clone https://github.com/savantcare/healthbrain.git

/healthbrain> docker-compose -f docker-compose-dev.yml up -d
```

Give enough time for npm install to work:

```bash
/healthbrain> docker logs healthbrain_vue_1 -f
/healthbrain> docker logs healthbrain_node_1 -f
```

Once the install finishes then:
```
In 3 incognito tabs open
http://localhost:81/phpmyadmin/      admin              : WUy3OsU5BYMM
http://localhost:8080/login          user1@gmail.com    : 123
http://localhost:8080/login          user1@gmail.com    : 123
```

## How to see app behavior when DB server connection is lost?
The mysql server is run from docker (See node-server/README.md)

Use the web app and then 

$ docker stop [container-name-of-mysqld]

Now refresh the web app.

The data will come from localstorage but you will toast message saying:

"Filed to get "component name" data"

This works using try catch examples
1. [For recommendations](file:///gt/sc-prog-repos/healthbrain/vue-client/src/store/modules/recommendation.js#221)
1. [For reminder](file:///gt/sc-prog-repos/healthbrain/vue-client/src/store/modules/reminder.js#221)

To put the system back:
$ docker start [container-name-of-mysqld]


## How to see app behavior when DB server takes 10 seconds for API response?

### Scenario 1:

Refresh the browser page. The UI wsill show data immediately from local storage using [vuex-persistance.](https://github.com/robinvdvleuten/vuex-persistedstate)

After 10 seconds when API returns a value UI will update.

In this case we saved the doctor 10 seconds.

### Scenario 2:

On the UI discontinue a rex. 

Inside database.json it will not say Discontinue:true UI will continue to show it as discontinued. 

After 10 seconds database.json will show Discontinue:true. 

In this case the app was able to give doctor 10 second faster response.

### Scenario 3:

The web page shows the current list of recommendations

Edit node-server/database.json and change the description of a recommendation.

Reload the page

The web page should show the edited recommendation.

Status: Fail

## How is the state of patient on a historical date generated?

### Architecture 1

Suppose doctor wants the state of the paitent on 15th Jan 2020:

The query is:
select * from recommendationsTable where patientID=1 and createdBy < "15th Jan 2020" and ( discontinuedDate > "15th Jan 2020" or discontinuedDate == NULL)
This returns JSON A


Suppose doctor wants the state of the paitent on 10th Mar 2020:
The query is:
select * from recommendationsTable where patientID=1 and createdBy < "10th Mar 2020" and ( discontinuedDate > "10th Mar 2020" or discontinuedDate == NULL)
This returns JSON B

Suppose the doctor wants to know the state of the patient on 9th March 2020:
This requires the same API as above.

Dis-Advantages of architecture 1:
1. Too many sql queries. But the data center is big and there are read only copies of MYSQL running from RAM ready to serve these queries. It is better to offload the complexity to the hardware instead of software. Wisdom says it is better to have expensive hardware and simple software.

### Architecture 2

The first query is:
select * from recommendationsTable where patientID=1;
This returns JSON C

Now all queries about the state of recommendation are made on the client side.

Advantages of architecture 2:
1. Less number of queries to server.

Dis-Advantages of architecture 2:
1. How to run sql query over a JSON on the browser client side.


