# Crontab
Because Moodle requires [cron](https://en.wikipedia.org/wiki/Cron) for [reliable operation](https://docs.moodle.org/310/en/Cron). While you could run cron inside the same container as Moodle, it is not propper Moodle etiquette to do so. Indstead we run a different container that has one job: cron.
Like always, there are more than one way to do that, I went with this by [Will Farrell](https://github.com/willfarrell/docker-crontab), although it didn't want to run/work without building the container, changing the base images and some small tweaks in the Dockerfile and docker-compose.yml.
One thing that I had to change for example was the RQ download


## Setup - Build and run
We have to build the image, but in this case the build process is integrated in the docker-compose command:
```
$ docker-compose up -d
```
Take a break, building will take some time.

You don't have to do anything more. In the config folder there is a config.json that tells crontab to connect to the Moodle container every minute and run the cron.php script.

## More info

Based on: https://github.com/willfarrell/docker-crontab


