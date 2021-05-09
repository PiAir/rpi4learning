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

The folder also contains a sample.env file with dummy data that you have to replace with your own data. Rename the sample file and edit it.
```
$ mv sample.env .env
$ nano .env
```
- Replace [your-rpi4-ip] with the ip-address of your Raspberry Pi
- Replace [your-moodle-db-password-from-MariaDB-setup] with the password that you set for the moodle database user during creation of the MariaDB container.

## Setup - step 2 Run Moodle

Now it is time to run Moodle using docker-compose:
```
$ docker-compose up -d
```

## Setup - step 3 Setup Moodle

```
Open a webbrowser and goto http://[your-rpi4-ip]:81
```
The first time you will be redirected to /admin/index.php

```
- Read the conditions and accept them by clicking on the Continue button
- On the next page, scroll down and again click on the Continue button
- Wait a while...installing the tables in the database takes a long time.
- Create a user:
    - Username: e.g. admin-moodle
    - New Password: create one using https://passwordsgenerator.net/
    - Firstname: [your choice] 
    - Surname: [your choice]
    - Email address: yourmail@gmail.com - make sure this is correct if you want to be able to reset password!  
- Click Update Profile - wait
- On New settings - Front page settings add:
    - Full site name: Rpi4Learning
    - Short name for site (eg single word): Rpi4L   
    - No-reply address: noreply@gmail.com
- Click Save Changes - wait
   
```
Done, for now.

_Needs info about using LTI to add Xerte content_

_admin/cli/cron.php should run every minute...need cron container!_


## More info

Moodle on github: https://github.com/moodle/moodle

