# Crontab
Because Moodle requires [cron](https://en.wikipedia.org/wiki/Cron) for [reliable operation](https://docs.moodle.org/310/en/Cron). While you could run cron inside the same container as Moodle, it is not propper Moodle etiquette to do so. Indstead we run a different container that has one job: cron.
Like always, there are more than one way to do that, I went with this by [Will Farrell](https://github.com/willfarrell/docker-crontab), although it didn't want to run/work without building the container, cahnging the base images and some small tweaks in the Dockerfile and docker-compose.yml.
One thing that I had to change for example was the RQ download


## Setup - step 1 Build
We need to build this image for it to work on our Raspberry Pi4. Start the build process using:
```
$ ./build.sh
```
And go get a cup of tea. This build also takes some time.

Now it is time to run Crontab using docker-compose:
```
$ docker-compose up -d
```
You don't have to do anything more. In the config folder there is a config.json that tells crontab to connect to the Moodle container every minute and run the cron.php script.

## More info

Based on: https://github.com/willfarrell/docker-crontab


