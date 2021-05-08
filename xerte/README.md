# Xerte

Finally, the container that started this all (and the question "can you explain how to run Xerte on docker?"). Up to this point, you should have at least portainder, phpMyAdmin, Mariadb running. And you should know the password for the xerte user that was created when you setup Mariadb.

## Setup - step 1 Build
Setting up Xerte on Docker requires a bit of work and mostly involves you waiting (or doing other stuff because docker is doing all the hard work). There is no official Docker image for Xerte (and this is *not* an official image!), so we'll be and building the image from the ground up, using the Xerte github source code. 
I choose to include the [tsugi framework](https://www.tsugi.org/) so that we can link Xerte learning resources to any LMS that has support for LTI (the Learning Tools Interoperability framework).
That means a bit more time when creating the image, but also the option to rebuild the image when a new version of Xerte is released.
I also decided to stick to the regular Xerte setup script. It takes a bit more time, because of its extensive checks, but again, by leaving it as is, the chances of breaking the Docker setup are smaller.

We will be running 3 shell files to get this container going. Before you run the first one (build.sh) take a look in Dockerfile at the version numbers for Xerte and Tsugi that you want to build.
If you use this instruction in a couple of months, it is worthwhile checking out the Xerte and Tsugi github repositories to see if there are new and improved versions around.

```
ENV XERTE_VERSION 3.9
ENV TSUGI_VERSION 21.04.24 
```
Once you've checked or changed the versions you want to use, start the build process using:
```
$ ./build.sh
```
And go get a cup of tea.

When building the rpi4learningbox/xerte:latest has completed we can run the first version of the container. It is only slightly different from the second (final) version.
This is because Xerte has a somewhat problematic way of checking if the database has already been setup: it checks for the existence of database.php
Now, for production purposes I want to have that file outside of the docker container and would normally link it using something like 
```
-v $PWD/database.php:/var/www/html/xerteonlinetoolkits/database.php
```
when using docker run.
But that would prevent the initial setup from running.
So we create a container without it, run setup, copy database.php to outside of the container, remove the container and recreate it linking to the external copy of database.php.
Don't worry, we'll do it step by step.

## Setup - step 2 Setup Xerte database

After build.sh has completed, first run
```
$ ./run-docker-setup.sh
```
When the container has started go to: http://[your-rpi4-ip]:**8041**
You will be redirected to the Xerte setup.
- Scroll down to the page and click the Install button.
- On the System Requirements page, click on the Next button.
- On the File System Checks page, click on the Next button.
- On the PHP Module Checks page, scroll down and click on the Next button.
- On the MySQL Database Creation page enter the following:
  - Database Host: mariadb
  - Database Username: xerte
  - Database Name: xerte-db
  - Database Password: the password set while setting up Mariadb (default: AYUaFW5zhQvNzHHcv2q67gzfmMtvmpAD)
  - Database Prefix: leave empty
- Click on the Next button.
- You don't need to change anythin on the MySQL Database Account Set up page, just click the Next button.
- On the Admin Password Setup Page choose a admin account name and password:
  -  Admin account name: eg admin-xerte
  -  Admin account password: e.g. x3EaVnJ9L8pXrjqf (use https://passwordsgenerator.net/ !)
-  On the Toolkits Set up page scroll all the way down. Don't click on Save yet!
-  Select 'Db' from the Choose an authentication method dropdown
-  Now you can click on Save.

You should now get the 'Install complete' page. Note that it advises us to remove the setup file. We will do just that when we run the production version of the container.
If you go back to phpMyAdmin and look at the xerte-db database, you'll find 19 newly created tables ther.

## Setup - step 3 Run Xerte for production

The next step might start a bit unexpected. We will now stop and remove the Xerte container that we used for step 2:
```
$ docker stop xerte
$ docker rm xerte
```
In the tsugi subfolder you'll find a config.php file. Edit the file using 
```
$ nano tsugi/config.php
```
and look for the line that says:
```
$CFG->dbpass    = 'AYUaFW5zhQvNzHHcv2q67gzfmMtvmpAD';
```
Change that (if needed) to the password for the xerte-user created during the setup of Mariadb.
Now look for the line that says:
```
$apphome = "http://[your-rpi4-ip]:8041";
```
And change it to the correct ip for your Raspberry Pi4.
Save the changes.

Do the same for the database.php file in the Xerte folder.  Edit the file using 
```
$ nano database.php
```
and look for the line that says:
```
$xerte_toolkits_site->database_password = 'AYUaFW5zhQvNzHHcv2q67gzfmMtvmpAD';
```
Change that (if needed) to the password for the xerte-user created during the setup of Mariadb.
Save the changes.

Now it is time to run the production version of the Xerte container and finish the setup. We'll use docker-compose now:
```
$ docker-compose up -d
```
This script will remove the Xerte setup-files from the installation, adding a bit more security:
```
$ ./rm-setup.sh
```

## Setup - step 3 Setup Tsugi

```
Open a webbrowser and goto http://[your-rpi4-ip]:8041/tsugi/admin
Enter the admin password for Tsugi (default: tsugi)
```
You should get a message starting with "It appears that your database connection is working properly but you have no tables in your database."
On the page find "Upgrade Database" and click on it. The database tables will be installed.
Close the pop-up. The message should now be gone.

## Setup - step 4 create Xerte user and get going

Finally there. We have Xerte setup, Tsugi setup, an admin account for Xerte, we just need a regular user account for Xerte to get going.
Goto http://[your-rpi4-ip]:8041/management.php and login with your Xerte admin useraccount (created during setup)
```
Click on the users button in the top row.
Enter Login name, First name, Last name, Password, Email for this user.
Click on Create user.

Click on Logout (upper right of the screen)
Make sure you'r back to http://[your-rpi4-ip]:8041/ and 
Login with the newly created user.
```

Done (for now, LTI, xAPI are still to come).

## More info

Xerte on github: https://github.com/thexerteproject/xerteonlinetoolkits

Tsugi on github: https://github.com/tsugiproject/tsugi

