# Samba

Another non essential container. This one enables you to view the filesystem within the docker folder. Easy when you want to move files to and from the Raspberry Pi4.

## Setup
## Change the configuration
The duckdns container uses .env to set the DuckDNS domain name and token. I can't share mine with all of you, so because of that, the repository contains a sample.env file with dummy data that you have to replace with your own data. Rename the sample file and edit it.
```
$ mv sample.env .env
$ nano .env
```
- Replace [set-a-password] with a strong password.
- Save the changes.

## Running the container
Start the container using docker-compose:

```
$ docker-compose up -d
```
The script tells the container to listen to port 445 which is the default. 

Go to file explorer on you computer and open \\[your-rpi4-ip]

You will be prompted for the username and password set in the .env file


## More info

Rpi-Samba on Dockerhub: https://hub.docker.com/r/trnape/rpi-samba/

Note: you get a warning about a platform mismatch (linux/arm versus linux/arm64/v8). You can ignore that, the image works fine.
