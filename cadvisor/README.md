# cAdvisor

Technically you don't need this container, but it enables you to view the resources used by the docker containers. I couldn't get the Google version to run straight away. There is a version, maintained by Ondřej Záruba, that will run on the Raspberry Pi4 without a problem and can be found [here](https://github.com/Budry/cadvisor-arm). But I wanted to build it for a newer version of cAdvisor, so I decided to build the image based on the Dockerfile provided by Ondřej.

Because we're using 64-bit Debian, I could replace the 'arm32v7/golang' base image with regular 'golang' and 'arm32v7/debian' with 'debian:buster-slim'.
cAdvisor version used, is set in Dockerfile:
```
ENV CADVISOR_VERSION "v0.40.0"
```
You could look for newer versions of at [their github repository](https://github.com/google/cadvisor/releases).


## Build the container
Building is easy, but takes some time:
```
$ ./build.sh
```

## Running the container
Starting the container is simple, just use docker-compose:

```
$ docker-compose up -d
```
The docker-compose file tells the container to listen to port 8081. 

Open http://[your-rpi4-ip]:**8081** in the browser. 

## Fix the missing Memory display
By default cAdvisor won't display memory usage. By following the instructions found [here](https://jackgruber.github.io/2020-08-15-Docker-monitoring-with-Grafana/), that can be fixed. I won't go into all the details of linking cAdvisor to Prometeus and Grafana, that you can read yourself there.
The steps to fix:
```
$ sudo nano /boot/cmdline.txt
```
- add this to the end of the line: 
```
cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1
```
- save and close
```
$ sudo nano /etc/docker/daemon.json
```
- add this to the file (keep the spacing):
```
{
  "exec-opts": ["native.cgroupdriver=systemd"]
}
```
- save and close
- reboot the RPi4:
```
$ sudo reboot now
```
If the Raspberry Pi has finished rebooting, you should see the memory used.
You can also do that from the commandline by using:
```
$ docker stats --no-stream
```

This should give you an overview of all the running containers.

## More info

cAdvisor on Dockerhub: https://hub.docker.com/r/google/cadvisor

cAdvisor on github: https://github.com/google/cadvisor

cAdvisor for Docker by Budry on github: https://github.com/Budry/cadvisor-arm

