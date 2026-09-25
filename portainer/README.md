<<<<<<< HEAD
BASE VERSIONS USED IN IMAGES
ELIXIR:  1.20.x 
PHOENIX: 1.8.x
HTTPD:   2.4.x
NVM:     4.4.7

TO INSTALL YIC2 IN A DOCKER CONTAINER USING PORTAINER

Make sure there is a postgresql database that yic can connect to.
In Portainer:
1. Create a TAR-ball of entrypoint.sh and the dockerfile.
   Next create image yic2:latest based on TAR-ball.
2. create a new image called my_httpd:latest based on httpd.dockerfile.

--no-cache not implemented in Portainer so I use:
docker buildx build --no-cache -t yic2:latest -f dockerfile - < dockerfile.tar
docker buildx build --no-cache -t my_httpd:latest -f httpd.dockerfile - 

Upon creation, create a Stack using docker-compose and the .env file. 
Before you do, make sure that the values in the .env file reflect your situation.

For development purposes:
 - entrypoint.sh contains a "sleep infinity" statement.
 - I use chown -R * <user>:<user> on lib in the yic2 image // In my case user is pieter
=======
BASE VERSIONS USED IN IMAGES
ELIXIR:  1.20.x 
PHOENIX: 1.8.x
HTTPD:   2.4.x
NVM:     4.4.7

TO INSTALL YIC2 IN A DOCKER CONTAINER USING PORTAINER

Make sure there is a postgresql database that yic can connect to.
In Portainer:
1. Create a TAR-ball of entrypoint.sh and the dockerfile.
   Next create image yic2:latest based on TAR-ball.
2. create a new image called my_httpd:latest based on httpd.dockerfile.

--no-cache not implemented in Portainer so I use:
docker buildx build --no-cache -t yic2:latest -f dockerfile - < dockerfile.tar
docker buildx build --no-cache -t my_httpd:latest -f httpd.dockerfile - 

Upon creation, create a Stack using docker-compose and the .env file. 
Before you do, make sure that the values in the .env file reflect your situation.

For development purposes:
 - entrypoint.sh contains a "sleep infinity" statement.
 - I use chown -R * <user>:<user> on lib in the yic2 image // In my case user is pieter
>>>>>>> 446c4c4fee495dba1aa0edea65ca4f1362603173
