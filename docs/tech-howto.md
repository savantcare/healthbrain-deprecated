### Q1) How to start the documentation system?

vue-client> npm run styleguide

And then go to:

http://localhost:6060

### Q2) How to create a fresh DB with structure and master data?

```static
healthbrain/db> docker stop healthbrain_mysqld_1
healthbrain/db> rm -rf var-lib-mysql
healthbrain/db> unzip may-22-2020.zip -d var-lib-mysql
healthbrain/db> chmod -R 777 var-lib-mysql
/healthbrain> docker-compose -f docker-compose-dev.yml up -d mysqld 
```

### Q3) How to create a new structure and master data?

```static
var-lib-mysql> zip may-22-2020.zip * -r
```

### Q4) How to run same component inside  patient file component and also individually?

#### Step 1
A new componet called AddRecommendationTab is created inside: 

/Users/vk-tech/gt/sc-prog-repos/healthbrain/vue-client/src/components/element.io-tab/AddRecommendation.vue

#### Step 2
Now there is a route defined in vue-client/src/router/index.js: 
  {
    path: '/recommendation',
    name: 'recommendation',
    component: () => import('@/views/Recommendation.vue')
  },

Now when ever someone comes to http://ip-address/recommendation the router sends the user to /views/Recommendation.vue

#### Step 3

Inside views/recommendation.vue the component created in step 1 is used. By the following codes:

1. Component is imported: 
import AddRecommendationTab from "@/components/element.io-tab/AddRecommendation";

2. Component is displayed:
```
     <el-tab-pane>
        <span slot="label" style="font-size:22px">Add recommendation</span>
        <AddRecommendationTab />
      </el-tab-pane>
```
The above structure is maintained because:

Components are supposed to be kept in components folder.

Views are supposed to use components but not define components.
