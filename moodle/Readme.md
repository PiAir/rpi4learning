# Moodle

Like with Xerte, the Moodle container takes a multi-step approach where I choose easy of upgrade and easy of 'sticking to the official code' to speed of install.
The Moodle container shares de MariaDB container with the Xerte container, but since all databases are stored outside the actual MariaDB container, they can be split whenever needed.
You should know the password for the moodle user that was created when you setup Mariadb.

## Setup - step 1 Build
Like with Xerte, the Moodle code gets updated frequently. Before you run the first one (build.sh) take a look in Dockerfile at the version number for Moodle that you want to build.
If you use this instruction in a couple of months, it is worthwhile checking out the Moodle github repository to see if there is a new and improved version around.

```
ENV MOODLE_VERSION 3.10.3
```
Once you've checked or changed the versions you want to use, start the build process using:
```
$ ./build.sh
```
And go get a cup of tea.

When building the rpi4learningbox/moodle:latest has completed we first need to check the docker-compose.yml for all the needed environment values.
```
$ nano docker-compose.yml
```
Some you can probably leave unchanged, others (like the ip for your Raspberry Pi4 device) will need changing:
```
    - MOODLE_URL=**[your-Rpi4-ip]**
    - MOODLE_DB_URL=mariadb
    - MOODLE_DB_NAME=moodle-db
    - MOODLE_DB_USER=moodle
    - MOODLE_DB_PASS=**YVNex3CHq4yc2DzHYVNex3CHq4yc2DzH**
    - MOODLE_DB_PORT=3306
    - MOODLE_MAX_BODY_SIZE=200M
    - MOODLE_BODY_TIMEOUT=300s
    - MOODLE_UPLOAD_MAX_FILESIZE=200M  
```
If you changed the password vfor the Moodle user during the MariaDB setup, change it here also!

## Setup - step 2 Run Moodle

Now it is time to run Moodle using docker-compose:
```
$ docker-compose up -d
```

## Setup - step 3 Setup Moodle

```
Open a webbrowser and goto http://[your-rpi4-ip]:**81**
```
The first time you will be redirected to /admin/index.php

```
- Read the conditions and accept them by clicking on the Continue button
- On the next page, scroll down and again click on the Continue button
- 
```


_Need more info_


Done (for now, LTI, xAPI are still to come).

## More info

Moodle on github: https://github.com/moodle/moodle

