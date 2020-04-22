# Installation 
Radarr is very much just Sonarr but for movies. it is an automated way of downloading and handling movies.
## Run all commands with sudo 


Install Mono - If you have already installed Sonarr and it is working then please skip this step 
```
apt install gnupg ca-certificates
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
apt update
apt install mono-devel
```

Radarr installation 
```
cd /tmp
curl -L -O $( curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 )
tar -xvzf Radarr.develop.*.linux.tar.gz
mv Radarr /opt
```

### Now is good time to see the general.md for setting up users and groups if you have not already


Make a data directory
```
mkdir /var/lib/radarr
```

set ownership and permissions
```
chmod 774 /var/lib/radarr
chown radarr:radarr /var/lib/radarr -R 
```

creating a .service file for Radarr
```
nano /etc/systemd/system/radarr.service
```

A service configuration
```
[Unit]
Description=Radarr Daemon
After=syslog.target network.target

[Service]
# Change the user and group variables here.
User=radarr
Group=radarr

Type=simple

# Change the path to Radarr or mono here if it is in a different location for you.
ExecStart=/usr/bin/mono --debug /opt/Radarr/Radarr.exe -nobrowser -data=/var/lib/radarr
TimeoutStopSec=20
KillMode=process
Restart=on-failure

# These lines optionally isolate (sandbox) Radarr from the rest of the system.
# Make sure to add any paths it might use to the list below (space-separated).
#ReadWritePaths=/opt/Radarr /path/to/movies/folder
#ProtectSystem=strict
#PrivateDevices=true
#ProtectHome=true

[Install]
WantedBy=multi-user.target
```

Save and close 

enable and start the service
```
systemctl enable radarr.service
service radarr start
```

check it is working
```
systemctl status radarr
```

Now radarr will by default spin up a webui @ http://localhost:7878 you can open this port to the outside world (not recommended) or use SSH Tunneling for cloud setups (SSH Tunneling is explained in the Plex install for Putty users). Local servers just change the localhost part to your servers internal IP





Information sources: [Mono](https://www.mono-project.com/download/stable/#download-lin-ubuntu) [Radarr1](https://github.com/Radarr/Radarr/wiki/Installation#manually-install-radarr) [Radarr2](https://github.com/Radarr/Radarr/wiki/Autostart-on-Linux)
