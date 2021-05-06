## cAdvisor

Technically you don't need this container, but it enables you to view the resources used by the docker containers. And setup is super simple.

## Running the container
Starting the container is really simple, just run the shell-script

```
$ ./run-docker.sh
```
The script tells the container to listen to port 8081. 

Open http://[your-rpi4-ip]:**8081** in the browser. 


## More info

cAdvisor on Dockerhub: https://hub.docker.com/r/google/cadvisor

Note: on the RPI4 Debian image, the memory use is not shown. There should be a work-around, just haven't tested it yet.

Note: you get a warning about a platform mismatch (linux/arm versus linux/arm64/v8). You can ignore that, the image works fine.
