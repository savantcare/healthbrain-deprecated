# JSONServer + JWT Auth


## Install

### On Mac
Download and install [docker desktop for mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac) dmg. This is needed for running mysql server

```bash
$ npm install

$ docker run -p "80:80" -p "3306:3306" -v ${PWD}/app:/app mattrayner/lamp:latest-1804 

# Ref: https://github.com/mattrayner/docker-lamp#using-the-image
# Confirm mysql is running http://localhost/phpmyadmin/ login: admin password: comnes from docker logs

# edit node_server/config.php to enter admin password

$ npm run start-auth
```

Might need to run
```
npm audit fix
```

## How to login/register?

### From browser

http://localhost:port/login


### From command line

You can login/register by sending a POST request to

```
POST http://localhost:8000/auth/login
POST http://localhost:8000/auth/register
```
with the following data 

```
{
  "email": "alexey@email.com",
  "password":"123"
}
```

You should receive an access token with the following format 

```
{
   "access_token": "<ACCESS_TOKEN>"
}
```


You should send this authorization with any request to the protected endpoints

```
Authorization: Bearer <ACCESS_TOKEN>
```
