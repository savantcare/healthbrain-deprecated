# Why docker file: Different servers and dev machines have different node ver. This guarantees same node version every time

# Alpine does not have apt. This is based on debian 9
FROM node:14


COPY ./ /gt/sc-prog-repos/healthbrain/vue-client

WORKDIR /gt/sc-prog-repos/healthbrain/vue-client

RUN npm install 

# The command to execute once this image finishes loading is given in docker-compose.yml


