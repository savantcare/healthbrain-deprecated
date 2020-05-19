## Q1) Why re-write the exisiting angular in vue?

The current angular app was developed to discover the psychiatrists needs. The system could not have been pre-architected to deliver the discovered features.

During the rewrite some new benefits are being delivered.

### A. User experience benefits

1. When page is reloaded and there is no connection to DB server or a slow connection to DB server the page should load from localstorage immediately.

2. When a page is already on the doctor browser and the doctor gives the commanbd "rec" then the recommendations show immediately from localcache and api is fired in the back. If the api returns new data the view is updated. (lazy-read)

3. When doctor adds a rec, the view gets updated. If server update fails then the view is reverted. (lazy-write)

4. When doctor is offline and open a patient file they see the page. #not-working

### B. Developer benefits

1. On server side interaction with the DB should happen through a ORM like [sequelize](https://sequelize.org/). 

    1A. So standard queries are already written.

    1B. DB migrations can happen. [https://github.com/savantcare/healthbrain/blob/master/node-server/models/recommendation.model.js]

2. Maintian state on the client. When recommendation card state changes the rec panel changes its view automatically.
In the current angular app the recommendation panel was listening on socket to update its view.

3. No HTML is generated on the server. All view is inside the .vue component. This view works on json returned by the server api

## Q2) Why was vue chosen over angular latest version?
Useful libraries
1. vuex
2. https://github.com/vue-generators/vue-form-generator
3. https://github.com/robinvdvleuten/vuex-persistedstate

Simpler to understand

More github stars. Take this as a voting from worldwide developers.

Simple concepts to do common UI patterns
    Doing multiple adds in same form https://www.youtube.com/watch?v=Efr7SUrBUQw


## Q3) Why was expressJS chosen over laravel?

Laravel: Used by 660 and Stars 59K

express nodejs: used by 6.6M and Stars 49K

Sequlize nodejs: Used by 190K and Stars 22K

## Q4) Why each component should be in its own repo?

When recommendation a new version is released Sanjay wants to do git pull only for recommendation repo on the prod server.

### Q4.1) Why not try branching concept?
Sometimes we need to invite external developers to work on a component and we do not want to give them access to the git repo containing other components

## Q4.2) Why is each component not a seperate npm package?

The goal is for recommendation-panel and recommendation-card to have the same vuex store. So when the state changes in recommendation-panel the view of recommendation-card is automatically updated.

[The code till 4th May](https://github.com/vikaskedia/healthbrain) implemented recommendation-panel and recommendation-card as two different npm packages. Different npm packages cannot share the same vuex store.

Hence recommendation-panel and recommendation-card cannot be two seperate npm packages they have to be components of the same vue app.

## Q5) How to reduce boilerplate code?

Divide all vue components into:

1. UI 

2. Layout componentns

3. Domain components: These will reuse a lot of the UI components.

Ref: https://vueschool.io/articles/vuejs-tutorials/structuring-vue-components/

## Q6) How to do theming for the app while each component maintains its own scoped local context style?

https://vuedose.tips/tips/theming-using-custom-properties-in-vuejs-components/

## Q7) How is the state of patient on a historical date generated?

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
