# Moodle

Like with Xerte, the Moodle container takes a multi-step approach where I choose easy of upgrade and easy of 'sticking to the official code' to speed of install.
The Moodle container shares de MariaDB container with the Xerte container, but since all databases are stored outside the actual MariaDB container, they can be split whenever needed.
You should know the password for the moodle user that was created when you setup Mariadb.

## Setup - step 1 Build
Like with Xerte, the Moodle code gets updated frequently. Before you run the first one (build.sh) take a look in Dockerfile at the version number for Moodle that you want to build.
If you use this instruction in a couple of months, it is worthwhile checking out the [Moodle github repository](https://github.com/moodle/moodle/releases) to see if there is a new and improved version around.

```
ENV MOODLE_VERSION 3.11.0
```
Once you've checked or changed the versions you want to use in sample.env, build.sh and Dockerfile, start the build process using:
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
- Replace [your-domain].duckdns.org with the url for your Learning Locker install
- Replace [your-lrs-client-Key] with the client key for your learning locker endpoint.
- Replace [your-lrs-client-secret] with the secret for your learning locker endpoint


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
## Setup - step 3 Download plugins

We'll now enable the H5P plugin and connect it to Learning Locker via xAPI. We'll also install the trax plugin that allows you to track all activities in Moodle. They'll be downloaded from github and placed in the correct folder:
```
$ ./get-plugins.sh
```
We need to add the Learning Locker info to the H5P setup. Run:
```
$ ./set_h5p.sh
```
## Setup - step 3 Run Moodle with H5P and trax

We use a different docker-compose to enable H5P and trax:
```
$ docker-compose down
$ docker-compose -f docker-compose-h5p-trax.yml up -d
```
As soon as you return to the Moodle site as an admin, it will want you to confirm the installation of the two plugins. You should just have to press the Continue button to accept the presented choices. Then click on "Upgrade Moodle database now" and Continue again after that.

### New settings - Trax Logs
We need to setup the connection to Learning Locker for Trax Logs:
```
- Enter LRS endpoint:
    - use https://[LRS_URL]:2443/data/xAPI/ where you replace LRS_URL with the value you used in .env
- Enter LRS username (Basic HTTP):
    - use the same value als you used for LRS_USERNAME in .env
- Enter LRS password (Basic HTTP):
    - use the same value als you used for LRS_PASSWORD in .env    
- Enter Platform IRI:
    - you can use any value here, you could use http://[your-rpi-ip]:81 or something like http://moodleserver.home       
- Switch Actors identification to Account (username)
- Disable "Web services anonymization" for now
```
Thinking about privcay, GDPR rules etc. is important in a live situation with students. For this setup, just meant to test things, we can relax a bit more.

### New settings - H5P
Setup H5P:
```
- Enable "Save content state"
- Disable "Contribute usage statistics" unless you don't mind.
- Set "Allow download" to "Controlled by author, default is off"
- Set "Embed button" to "Controlled by author, default is off"
- Uncheck "Copyright button"
- Uncheck "About H5P button"
- Enable "Enable LRS dependent content types"
```
It takes a while before all interactivity types are available. By trial-and-error I figured out that uploading an example in the Content Bank helps.


We can also add the Xerte Module as an External Tool and add it via LTI. Xerte will then take care of the xAPI communication with 

_admin/cli/cron.php should run every minute...need cron container!_


## More info

Moodle on github: https://github.com/moodle/moodle

