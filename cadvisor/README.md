# cAdvisor

Technically you don't need this container, but it enables you to view the resources used by the docker containers. I couldn't get the Google version to run straight away. There is a version, maintained by Ondřej Záruba, that will run on the Raspberry Pi4 without a problem and can be found [here](https://github.com/Budry/cadvisor-arm). But I wanted to build it for a newer version of cAdvisor, so I decided to build the image based on the Dockerfile provided by Ondřej.

Because we're using 64-bit Debian, I could replace the 'arm32v7/golang' base image with regular 'golang' and 'arm32v7/debian' with 'debian:buster-slim'.
cAdvisor version used, is set in Dockerfile:
```
ENV CADVISOR_VERSION "v0.37.5"
```

## Build the container
Building is easy, but takes some time:
```
$ ./build.sh
```

## Running the container
Starting the container is simple, just run the shell-script

```
$ ./run-docker.sh
```
The script tells the container to listen to port 8081. 

Open http://[your-rpi4-ip]:**8081** in the browser. 


## More info

cAdvisor on Dockerhub: https://hub.docker.com/r/google/cadvisor

cAdvisor on github: https://github.com/google/cadvisor

cAdvisor for Docker by Budry on github: https://github.com/Budry/cadvisor-arm

Note: on the RPI4 Debian image, the memory use is not shown. There should be a work-around, just haven't tested it yet.

