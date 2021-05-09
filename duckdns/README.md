# Let's Encrypt for Duck DNS

I would have liked to have been able to avoid using this container, but it turns out the Learning Locker requires a SSL/HTTPS connection when receiving xAPI statements.
So, it could not be avoided. I considered the use of [Nginx Proxy Manager](https://nginxproxymanager.com/) which I use and like for my 'regular' Docker containers on my home Synology NAS, but that adds another huge level of complexity to this project.
Instead I went for the 'as easy as possible sollution: only Learning Locker gets a (free DuckDNS) domain name and SSL connection, and all the other containers (Xerte, Moodle, Redash) stay on unsecured connections via IP-addresses.
Note that if you were planning on using your Raspberry Pi to provide external access to your Xerte learning resources, this won't work/be enough. Let me know if that actually is a goal that people have with this.

## Change the configuration
The duckdns container uses .env to set the DuckDNS domain name and token. I can't share mine with all of you, so because of that, the repository contains a sample.env file with dummy data that you have to replace with your own data. Rename the sample file and edit it.
```
$ mv sample.env .env
$ nano .env
```
- Replace '[your-duckdns-token]' with your unique DuckDNS token
- Replace '[your-domain]' with the domainname you choose on DuckDNS
- Save the changes.

## Running the container
Starting the container is simple and done through docker-compose:

```
$ docker-compose up -d
```
The container has no webinterface, but you should see /home/pi/docker/learninglocker/data/cert being filled with folders (accounts, archive, crs, keys, live, renewal, renewal-hoos, ...)

## Port forwarding in your router
This part is a bit more difficult to explain. Most home internet routers have a way to forward certain traffic from outside to devices inside the network.
![Example of port forwarding](https://raw.githubusercontent.com/PiAir/rpi4learning/main/resources/images/port_forwarding.png)
The above image shows how I've set my router to forward any traffic on port 2443 to port 2443 on the device with ip 192.168.0.72, which is the IP-address of my Raspberry Pi4.
You need to setup your router in a similar way. You can find guides for many different routers [on this website](https://portforward.com/router.htm). Please understand that I can't offer support in getting this to work in your situation!

## More info

maksimstojkovic/letsencrypt on Dockerhub: https://github.com/maksimstojkovic/docker-letsencrypt


