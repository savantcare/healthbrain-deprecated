# HealthBrain

## Introduction
There are two parts in current architecture
1. vue-client
2. node-server

Please read the README.md file in the each project folder.

# What is needed to write a new component

For the model component RecommendationCard the following files needed to be created:

1. vue-client/src/components/RecommendationCard.vue file    -> This has the presentation layer (html), styling layer (css), JS to change the state
2. vue-client/store/modules/recommendation.js               -> State of this component
3. node-server/models/recommendation.model.js               -> Sequalize model of this component
4. node-server/routes/recommendation.route.js               -> Routes of this component

**Todo** How to keep these files in a seperate repo. How to run them independently.
Possible solution:
1. https://github.com/teambit/bit