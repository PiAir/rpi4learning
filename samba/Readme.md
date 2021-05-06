## Samba

Another non essential container. This one enables you to view the filesystem within the docker folder. Easy when you want to move files to and from the Raspberry Pi4.

## Setup
The download from the repository comes with a single user + password setup:
- User:  rpisamba
- Password: Hmk7hsrW9Q8W5hYr
If you want to change them, you have to edit the run-docker.sh file.
```
$ nano run-docker.sh
```
Change the values for the "-u" parameter.
```
Press CTRL+X and Y to save the changes
```
If you want to change the username, you will have to change both occurences!

## Running the container
Starting the container is really simple, just run the shell-script

```
$ ./run-docker.sh
```
The script tells the container to listen to port 445 which is the default. 

Go to file explorer on you computer and open \\[your-rpi4-ip]

You will be prompted for the Username and Password that you've set previously.


## More info

Rpi-Samba on Dockerhub: https://hub.docker.com/r/trnape/rpi-samba/

Note: you get a warning about a platform mismatch (linux/arm versus linux/arm64/v8). You can ignore that, the image works fine.
