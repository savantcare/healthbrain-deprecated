Q) How to start the dev environment?

Step1: Start mysqld

healthbrain/docker> docker-compose -f maria-10.4-docker-compose.yml up -d

To access phpmyadmin:
http://[ip-address]:81/

First time the root password is qwerty


The admin password is given in: 
healthbrain/node-server/config/development.json

To enter the docker container:
root@server1:/gt/sc-prog-repos/healthbrain/docker# docker exec -ti docker_mariadb_1 bash
root@c02b4fc1097e:/# 

Ref: https://hackernoon.com/mariadb-phpmyadmin-docker-running-local-database-ok9q36ji

Step2: Start vue-client
cd /gt/sc-prog-repos/healthbrain/vue-client
npm install
npm run serve

Step3: Start node-server
cd /gt/sc-prog-repos/healthbrain/node-server
npm install
npm run start


Then in your browser go to: http://localhost:8080/


# How to deploy to Heroky?
cd vue-client
npm run build
git add .
git commit -m "....."
git push to the Repository
Heroku updates the staging server automatically when the master branch is updated

