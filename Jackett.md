# Installation 
Jackett is a way to provide API support for all your needed indexers and i use it as my bridge from Sonarr/Radarr - desired indexer and push the traffic through the Tor proxy whilst doing so so the chain goes a little like this. Radarr>Jackett>Tor>Indexer

## Run all commands with sudo 
##### As mentioned in the Tor installation. Jackett does not recommend using a proxy as it can leak requests and cause high CPU usage so configure this at your own risk

You will need mono installed for this, see Radarr or Sonarr guides

Jump [here](https://github.com/Jackett/Jackett/releases) and grab a link for the latest release

download the release - replace my link with yours
```
cd /tmp
wget https://github.com/Jackett/Jackett/releases/download/v0.16.103/Jackett.Binaries.LinuxAMDx64.tar.gz
```

extract the files
```
tar -xvzf Jacket*
```

move the files to the opt folder
```
mv Jackett /opt/
```

set ownership/permissions for folder
```
chown jackett:jackett /opt/Jackett -R
chmod 774 /opt/Jackett -R
```

install as a service
```
/opt/Jackett/install_service_systemd.sh
```

as my Jackett user has no home directory, i will need to edit the .service file for Jackett and add a data path to it

first - Make a folder for data and set permissions
```
mkdir /var/lib/jackett
chown jackett:jackett /var/lib/jackett -R
chmod 774 /var/lib/jackett -R
```

Edit .service file
```
nano /etc/systemd/system/jackett.service
```


example systemd service file with the data path 
```
Environment=XDG_CONFIG_HOME=/var/lib/jackett
```



