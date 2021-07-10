# Learning Locker

Learning Locker is an open source Learning Record store that also offers commercial licenses and support options.
For our goals we'll be using the open source version.
I started using this docker version by [up2university](https://github.com/up2university/learninglocker2), kudos to them for providing that!
But since then new versions of the source code and the different components have been release and eventually the build process failed to complete. So I changed some things based on the fixes provided online. I decided to rename the docker labels to reflect that change and replaced the 'dev' tags with the version numbers actually used in this build.

Getting Learning Locker to work is a multi-step process, and like with some of the other images, it starts with a build.

## Setup - Build

Most of the setup files provided in this repository just use passwords generated [here](https://passwordsgenerator.net/), but the .env file for Learning Locker wanted a real app-password for gmail. And I can't share mine with all of you. :-)
Because of that, the repository contains a sample.env file with dummy data that you have to replace with your own data. Rename the sample file and edit it.
```
$ mv sample.env .env
$ nano .env
```
- Replace [your-domain].duckdns.org with the DuckDNS domain you created
- Replace [yourmail]@gmail.com with your gmail address
- Replace [your-smtp-password] with your gmail app-password - [see how to create one](https://support.google.com/accounts/answer/185833)
- Save the changes.

Before you start building, check the versions used by the scripts.

### Get your versions
In the Dockerfile in the ./app directory you will find a line 
```
ENV LL_TAG=7.0.0
```
You can control which version of Learning Locker is installed by changing that tag. At the moment of writing this instruction, [that was 7.0.0](https://github.com/LearningLocker/learninglocker/tags).

Despite nodejs version 10.x being rather old, I stuck to that version, reason for that was that the build process caused a lot of trouble. If you get it working with one of the newer versions, please submit a PR.

Version 7.0.0 of Learning Locker requires at least Mongo 4.2. in the docker-compose.yml file you'll find that I use
```
image: mongo:4.4.5
```
In the Dockerfile in the ./nginx directory you can see that I use the 1.20.0 version of nginx:
```
FROM nginx:1.20.0
```
This also is something that can be updated over time.

Once you've checked the different versions, it is time to build the app and nginx images. Start the build process using:
```
$ ./build.sh
```
And go get a cup of tea. The app-building part takes a really long time. Also keep in mind that it puts quite a strain on your RPi4. I stopped all containers except for Portainer and cAdvisor before starting the build. Below you can see the CPU-usage:

![LL-building-CPU-load](https://raw.githubusercontent.com/PiAir/rpi4learning/main/resources/images/ll_building_CPU.png)
The build uses quite some space, I had been testing a while with different container images and almost filled up the 32GB micro-SD card I was using.

Note: there will be some warnings during the building of the app with regard to incorrect peer dependencies. I don't know how to fix them, but the appear to be related to the application code, not the Docker image creation process itself.

## Run the services
To run the services we use docker-compose. Type:
```
docker-compose up -d
```

## Create a user and organisation
To be able to logon to Learng Locker we need to create a new user and organisation for the site. The command structure is as follows:

```
$ docker-compose exec api node cli/dist/server createSiteAdmin [email] [organisation] [password]
e.g.
$ docker-compose exec api node cli/dist/server createSiteAdmin mymail@gmail.com Rpi4learning Ap28ueW6
```
The password needs to be at least 8 characters and needs to contain at least one number.

## Connect to the site

The script tells the container to listen to port 2443. 

Open **https**://[your-domain].duckdns.org:**2443** in the browser. You should see the logon page. Use the username and password that you used in the previous set.


## Create Store and endpoint

```
- Click on Settings in the menu on the left and then on Stores
- Click the +Add new button
- Add a title for the new store, e.g. 'RPI4learning Store' - no need to save
- Click on Clients in the menu on the left
- Click on the +Add new button
- Add a title for the new client, e.g. 'RPI4learning default' - no need to save
- Check the 'API ALL'

```

## More info
The original up2university repository: https://github.com/up2university/learninglocker2

Learning Locker github repository: https://github.com/LearningLocker/learninglocker

For LL's architecture consult http://docs.learninglocker.net/overview-architecture/

