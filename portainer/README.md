# Portainer

This container is really helpful as it enables you to see all other running container, start them, stop them etc.

## .env
The folder contains a sample.env file with the PWD variable. You shouldn't need to change it, just rename it to .env.
```
$ mv sample.env .env
```

## Running the container
Starting the container is really simple, just run the docker-compose command

```
$ docker-compose up -d
```
The script tells the container to listen to port 9000. 

Open http://[your-rpi4-ip]:**9000** in the browser. The first time you need to complete the setup:
```
- Change the username, e.g. admin-portainer
- Set a strong password! e.g. BBcxhfzsGNWAaZ2m - generate one at https://passwordsgenerator.net/
- Choose: Manage the local Docker environment
- Choose: Connect
```

Next time you can simply logon and see the containers that you've added in the other steps.

## More info

Portainer on Dockerhub: https://hub.docker.com/r/portainer/portainer-ce - check for possible new versions and update docker-compose.yml

More info: https://documentation.portainer.io/quickstart/
