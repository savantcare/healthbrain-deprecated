# HealthBrain Vue-Client

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).


# What is the UI patten for changing data?

Goal: Allow doctor to keep eye contact with patient.

Every box has 
   1. A multi change in the header. 
   2. Change for each individual row.

For multi change there are 2 possibilities:
   1. There is a single field. 
        In this case the history is shown at the bottom
   2. There are multiple fields.
        In this case the history is shown as a drawer

For Change of individual row:
   1. History is shown. 
