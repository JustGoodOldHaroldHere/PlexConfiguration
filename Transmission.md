# Installation 
Transmission like many others is a way of handling and downloading torrents. 

## run all commands with sudo 

add the repository 
```
sudo add-apt-repository ppa:transmissionbt/ppa
```

update and install
```
apt update
apt-get install transmission-daemon transmission-common 
```

editing the conf.json

Now Transmission will by default spin up a webui @ http://localhost:9019 you can open this port to the outside world (not recommended) or use SSH Tunneling for cloud setups (SSH Tunneling is explained in the Plex install for Putty users). Local servers just change the localhost part to your servers internal IP
