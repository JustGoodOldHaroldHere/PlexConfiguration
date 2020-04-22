# Installation for Sonarr
Sonarr is a web based app that automates downloading and handling of tv programs. 
## Run all commands with sudo 

You have 2 options and i will cover both, Sonarrv2 or Sonarrv3 v2 is the mainstream supported version and v3 at this current time is a beta and may have major issues. Please refer to the main sonarr website for details

### V2 installation

#### install mono
If you have already installed Radarr and it is working then please skip this step. Skip as well if you will be installing Sonarr v3
```
apt install gnupg ca-certificates
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
apt update
apt install mono-devel
```
#### install sonarr
Add the repo
```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xA236C58F409091A18ACA53CBEBFF6B99D9B78493
echo "deb http://apt.sonarr.tv/ master main" | sudo tee /etc/apt/sources.list.d/sonarr.list
```

update and install
```
sudo apt update
sudo apt install nzbdrone 
```

#### Now is good time to see the general.md for setting up users and groups if you have not already

make a data dir and set permissions
```
mkdir /var/lib/sonarr
chmod 774 /var/lib/sonarr
shown sonarr:sonarr /var/lib/sonarr -R
```

Make a .service 
```
nano /etc/systemd/system/sonarr.service
```

default service file
```
[Unit]
Description=Sonarr Daemon
After=network.target

[Service]
# Change and/or create the required user and group.
User=sonarr
Group=sonarr

# The UMask parameter controls the permissions of folders and files created.
#UMask=002

# The -data=/path argument can be used to force the config/db folder
ExecStart=/usr/bin/mono --debug /opt/NzbDrone/NzbDrone.exe -nobrowser -data=/var/lib/sonarr

Type=simple
TimeoutStopSec=20
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
Save and close

enable service 
```
systemctl enable sonarr.service
```

start the service and check it is working
```
service sonarr start
systemctl status sonarr
```

### v3 installation

add repo and key
```
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 2009837CBFFD68F45BC180471F4F90DE2A9B4BF8
echo "deb https://apt.sonarr.tv/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/sonarr.list
```

Update and install
```
apt update
apt install sonarr
```
During installation you will be asked about the user and group

Now Sonarr will by default spin up a webui @ http://localhost:8989 you can open this port to the outside world (not recommended) or use SSH Tunneling for cloud setups (SSH Tunneling is explained in the Plex install for Putty users). Local servers just change the localhost part to your servers internal IP


Information sources: [Sonarr1](https://github.com/Sonarr/Sonarr/wiki/Installation) , [Sonarr2](https://github.com/Sonarr/Sonarr/wiki/Autostart-on-Linux) , [Sonarr3](https://sonarr.tv/#downloads-v3-linux-ubuntu)
