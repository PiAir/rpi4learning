## Xerte

Finally, the container that started this all (and the question "can you explain how to run Xerte on docker?"). Up to this point, you should have at least portainder, phpMyAdmin, Mariadb running. And you should know the password for the xerte user that was created when you setup Mariadb.

## Setup
Setting up Xert on Docker requires a bit of work. There is no official Docker image for Xerte (and this is *not* an official image!).
I choose to include the [tsugi framework](https://www.tsugi.org/) so that we can link Xerte learning resources to any LMS that has support for LTI (the Learning Tools Interoperability framework).
and to build the image using the Xerte github source code. 
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

After build.sh has completed, first run
```
$ ./run-docker-setup.sh
```
When the container has started go to: http://[your-rpi4-ip]:**8041**
You will be redirected to the Xerte setup.





## More info

Xerte on github: https://github.com/thexerteproject/xerteonlinetoolkits

Tsugi on github: https://github.com/tsugiproject/tsugi

