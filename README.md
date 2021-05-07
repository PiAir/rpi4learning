# Build your own Mobile Learning Box (on a Raspberry Pi4)
Repository with files needed to run Xerte, Moodle, Learning Locker on Docker on a Raspberry Pi4

Note: I am not affiliated with any of the mentioned project!

Note: You need a Raspberry Pi4 to do this, this won't work on any of the previous versions.

## Preparing the Raspberry Pi4
Goto: https://downloads.raspberrypi.org/raspios_arm64/images/

Download the ZIP of the most recent version of the 64bit operating system. Currently that is:
https://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2021-04-09/2021-03-04-raspios-buster-arm64.zip

Install: https://www.balena.io/etcher/

Write the ZIP image to a micro-SD card. Make sure it is large enough, 32GB preferably.

Add ssh file to boot partition (we are going to use wired internet!)

Boot up and wait...

Use your router to find the ip-address and note it down

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

Exit and reboot. Reconnect to the Pi

## Install Docker and Docker-compose

These instructions were adapted from the info on: https://devdojo.com/bobbyiliev/how-to-install-docker-and-docker-compose-on-raspberry-pi

### docker
```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh
$ sudo usermod -aG docker pi
```
logout and login again as user pi. Test if docker is running properly:
```
$ docker --version
$ docker run hello-world
```
### docker compose
```
$ sudo apt-get install libffi-dev libssl-dev
$ sudo apt install python3-dev
$ sudo apt-get install -y python3 python3-pip
$ sudo pip3 install docker-compose

$ docker-compose --version
```
### get the repository files
Note: currently the version tags are being updated quicker than this documentation. Make sure you get the latest version of the repository!
```
$ mkdir docker
$ cd docker
$ wget https://github.com/PiAir/rpi4learning/archive/refs/tags/v0.2.zip
$ unzip *.zip
$ mv rpi4learning-0.2/* ./
$ rm *.zip
$ rm -r rpi4learning-0.2/
$ find ~/docker -type f -iname "*.sh" -exec chmod +x {} \;
```
The last command makes sure that all the run-docker.sh and build.sh files in the repository have the correct execute rights.

### docker - create the rpi4learning network
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
- [Learning Locker](learninglocker/README.md)
- [Moodle](moodle/README.md)
- Redash
