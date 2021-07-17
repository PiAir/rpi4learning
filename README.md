# Build your own Mobile Learning Box (on a Raspberry Pi4)
Repository with files needed to run Xerte, Moodle, Learning Locker on Docker on a Raspberry Pi4

Note: I am not affiliated with any of the mentioned project!

Note: You need a Raspberry Pi4 to do this, this won't work on any of the previous versions.

## Preparing the Raspberry Pi4
Goto: https://downloads.raspberrypi.org/raspios_arm64/images/

Download the ZIP of the most recent version of the 64bit operating system. Currently that is:

https://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2021-05-28/2021-05-07-raspios-buster-arm64.zip

Install: https://www.balena.io/etcher/

Write the ZIP image to a micro-SD card. Make sure it is large enough, 32GB preferably.

Add an empty ssh file (= a file named 'ssh' with nothing in it) to the boot partition to enable ssh on the Pi (we are going to use wired internet!)

Boot up and wait...

Use your router to find the ip-address and note it down

** Note: I'll be using an external SSD connected to one of the USB3 ports of the Raspberry Pi. 

## Setup Raspberry Pi

Connect to the pi using usernam: pi and password: raspberry

Change the password using 'passwd'
```
$ passwd
```
I'll repeat this many more times, but if you're looking for strong passwords, [take a look here](https://passwordsgenerator.net/)

Run the config tool:
```
$ sudo raspi-config
```

Change the hostname to eg rpi4docker
```
System Options > Hostname
```
Change the GPU memory to 16MB	
```
System > Performance Options > GPU Memory > 16MB
```
Change Timezone to Amsterdam (if applicable)
```
Localisation Options > Timezone > Europe > Amsterdam
```
Expand the filesystem to full size:
```
Advanced Options > Expand Filesystem > Ok
```
Exit using Finish and reboot. Reconnect to the Pi

## Get the repository files
Note: Make sure you get [the latest version](https://github.com/PiAir/rpi4learning/releases) of the repository. Check the version number there and adapt it down here in the instructions:
```
$ mkdir docker
$ cd docker
$ wget https://github.com/PiAir/rpi4learning/archive/refs/tags/v0.4.zip
$ unzip *.zip
$ mv rpi4learning-0.4/* ./
$ rm *.zip
$ rm -r rpi4learning-0.4/
$ rm -rf .keep
$ find ~/docker -type f -iname "*.sh" -exec chmod +x {} \;
```
The last command makes sure that all the run-docker.sh and build.sh files in the repository have the correct execute rights.


## Install Docker and Docker-compose

I used the info [available here](https://devdojo.com/bobbyiliev/how-to-install-docker-and-docker-compose-on-raspberry-pi) to create a build-script build.sh that is available in the docker folder if you've donwloaded the repository files. So all you have to do is run the script in that folder and wait:

```
$ ./build.sh
```
The script adds the pi useraccount to the docker group so you don't have to use sudo to run docker of docker-compose.
You'll have to logout and login again for it to work.
Then test if docker is running properly:
```
$ docker --version
$ docker run hello-world
```
Now test if docker-compose is working properly:
```
$ docker-compose --version
```
### how long does it take to build?
This is an optional tip if you want to know how long a command took to complete. Don't use it on the docker-compose commands in the instructions, but if you want to get a report afterwards how long for instance the installation of docker and docker-compose took, then replace the default build.sh command with:
```
$ time ./build.sh --takeyourtime
```

## Docker - create the rpi4learning network
All containers share this bridge network. Create it first from the command-line:
```
$ docker network create -d bridge rpi4learning
```
## Install all the other components
Follow the steps desribed in the README files in the folders in this order:

- [Portainer](portainer/README.md)
- [phpMyAdmin](phpmyadmin/README.md)
- [cAdvisor](cadvisor/README.md) (optional)
- [samba](samba/README.md) (optional)
- [MariaDB](mariadb/README.md)
- [Xerte](xerte/README.md)
- [Duckdns](duckdns/README.md)
- [Learning Locker](learninglocker/README.md)
- [Moodle](moodle/README.md)
- [Crontab](crontab/README.md)
- [Redash](redash10/README.md)


![The final result in Portainer](https://raw.githubusercontent.com/PiAir/rpi4learning/main/resources/images/Containerlist_Rpi4.png)
