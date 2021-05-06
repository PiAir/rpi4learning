docker run -d -p 9000:9000 --name=portainer --network=rpi4learning --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
