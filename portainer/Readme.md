# Portainer

This container is really helpful as it enables you to see all other running container, start them, stop them etc.

## Running the container
Starting the container is really simple, just run the shell-script

```
$ ./run-docker.sh
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

Portainer on Dockerhub: https://hub.docker.com/r/portainer/portainer

More info: https://documentation.portainer.io/quickstart/
