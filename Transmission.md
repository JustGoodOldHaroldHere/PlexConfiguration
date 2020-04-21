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

##### editing the settings.json
first stop the service
```
service transmission-daemon stop
```

edit the settings.json
```
nano /var/lib/transmission-daemon/info/settings.json
```
I have uploaded my settings.json [here](/var/lib/transmission-daemon/info/settings.json)

Generally speaking you want to change the umask value, RPC username and RPC password

save and close when you are done and restart the service
```
service transmission-daemon start
```

Now Transmission will by default spin up a webui @ http://localhost:9019 you can open this port to the outside world (not recommended) or use SSH Tunneling for cloud setups (SSH Tunneling is explained in the Plex install for Putty users). Local servers just change the localhost part to your servers internal IP
