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

Run the config tool:
```
sudo raspi-config
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
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo usermod -aG docker pi
```
logout and login again as user pi. Test if docker is running properly:
```
docker --version
docker run hello-world
```
### docker compose
```
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose

docker-compose --version

mkdir docker
cd docker
mkdir mariadb
mkdir mariadb/data
mkdir xerte
mkdir xerte/USER-FILES
```

Follow the steps desribed in the README files in the folders in this order:

- portainer
- phpmyadmin
- cadvisor (optional)
- samba (optional)
- mariadb
- xerte
- learninglocker
