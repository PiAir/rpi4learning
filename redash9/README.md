# Redash
Is Redash the best dashboard server for Learning Analytics? No, for sure not. But it was the only open source (for now) one that I could find, that would actually talk to Learning Locker via json.
So, feel free to not install it. I did include the beta for version 9 as a bonus, but here it is.

## Setup - step 1 Build
We need to build this image for it to work on our Raspberry Pi4, but luckily for you, I did all the hard work.

If you look in build.sh you can see [the version](https://github.com/getredash/redash/tags) that is being installed:

```
v9.0.0-beta
```
It is unclear when this beta is going to become the final version, but for now you're good. Start the build process using:
```
$ ./build.sh
```
And go get a cup of tea.

## Setup - step 2 Create the database

The repository contains a sample.env file. In this scenario, you don't have to change anything in it, just rename it to .env.
```
$ mv sample.env .env
```
You then need to create the database before running Redash:
```
$ ./create-database.sh
```

## Setup - step 3 Run Redash

Now it is time to run Redash using docker-compose:
```
$ docker-compose up -d
```
Open a webbrowser and goto http://[your-rpi4-ip]:8090

The first time you will have to create a user:

```
- Set the user-options:
  - Name: redash-admin (for e.g.)
  - Email Address: yourmail@gmail.com
  - Password: Ap28ueW6Ap28ueW6 (again: change!)
- Uncheck the 2 boxes (unless you don't mind)
- Organization Name: Rpi4learning
- Click Setup button
```

When you arrive on the mainscreen, you'll get this question:
```
Would you be ok with sharing anonymous usage data with the Redash team? 
```
Click Yes or No, depending on if you're ok with that.
  
Done, for now.

_Needs info about setting up a dashboard_

## More info

Redash on github: https://github.com/getredash/redash


