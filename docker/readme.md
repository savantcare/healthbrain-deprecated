Q) How to start the dev environment?

Step1: Start mysqld

docker-compose -f maria-10.4-docker-compose.yml up -d
Ref: https://hackernoon.com/mariadb-phpmyadmin-docker-running-local-database-ok9q36ji

Step2: Start vue-client
cd /gt/sc-prog-repos/healthbrain/vue-client
npm install
npm run serve

Step2: Start node-server
cd /gt/sc-prog-repos/healthbrain/node-server
npm install
npm run start


