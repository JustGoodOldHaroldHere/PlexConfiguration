# General configuration 
Here i will cover some basic configuration for your setup
## Run all commands with sudo

### Users and groups 
So there are a million ways of doing this but a way i like to use is having a different user and group for all applications and a group called media that the relevant users are a member of. you can then set permissions and ownership of your library to specific users and the media group and set the permissions accordingly rather than smashing it all out with 777 and not knowing who is doing what and where. For cloud users who mount Google Drive you do not need to worry about the folder permissions and the media group but still run your applications with their own users/groups

Generally most applications will go and create a user as part of the installation but some do not such as Radarr. I would advise making the following users and groups

radarr, sonarr, jackett

command - replace USERNAME with your desired username. This will create a system user with no home directory and create a group named after the user as well
```
adduser --system --no-create-home --group USERNAME
```

create our media group
```
groupadd media
```

adding users to the media group - You want to have a think about this as not everthing needs to be in here radarr, sonarr, plex and transmission are the members that require access to your library
```
usermod -aG media USERNAME
```

### Ubuntu firewall 
Now this is not a problem really for internal servers as one would hope you have this sorted at your router but cloud users might be interested in this. I have my firewall enabled and allow certain ports through such as 443 for HTTPS, 80 for HTTP and an obscure port for SSH. I then make applications like plex which contain all of the plex ports and allow that application through. My firewall has the default of deny all

i have uploaded my application file [here](/etc/ufw/applications.d/plexmediaserver) 

Set the firewall to default deny - *This may effect your SSH Session*
```
apt-get install ufw
ufw enable
ufw default deny incoming
```

allowing a port
```
ufw allow http
ufw allow https
ufw allow 80
ufw allow 443
```
Now the above shows pre-defined services so 'ufw allow http' is 'ufw allow 80' they are the same thing, that is also the case with https and 443

if you have added the plexmediaserver application to the relevant directory, to enable it you would use the following
```
ufw app update plexmediaserver
ufw allow plexmediaserver
```

To check what you have allowed through 
```
ufw status
```
to delete an entry
```
ufw delete allow 80
```


### File structure

So one important step is making your folder tree for your library. I have mine in /mnt/plex and use the following layout. permissions are set 774 accross the board (RWE for owner, RWE for group, R for public). For cloud users the same applies except permissions/owners

radarr - Folder where transmission downloads movies to and Radarr scans for new files to rename and manage (owner radarr:media)

sonarr - Folder where transmission downloads TV programs and Sonarr scans for new files to rename and manage (owner sonarr:media)

wasteland - where incomplete/partial downloads go for transmission (debian-transmission:debian-transmission)

lost - the default transmission dowload folder if one is not specified by Sonarr/Radarr (debian-transmission:debian-transmission)

plex - plex library (plex:media)

plex/tv - folder Sonarr places content when it is renamed and the folder Plex points to for TV programs 

plex/films - folder Radarr places content when it is renamed and the folder Plex points to for films

### Automagic updates

now you can use the likes of livepatch but here is another solution 

install package
```
apt install unattended-upgrades
```

Edit the config
```
/etc/apt/apt.conf.d/50unattended-upgrades
```

Here is an example config for the section you will need to edit - See information sources for more details
```
Unattended-Upgrade::Allowed-Origins {
        "${distro_id}:${distro_codename}";
        "${distro_id}:${distro_codename}-security";
        "${distro_id}:${distro_codename}-updates";
//      "${distro_id}:${distro_codename}-proposed";
//      "${distro_id}:${distro_codename}-backports";
};
```

save and close

enable the automatic upgrades and specify settings
```
nano /etc/apt/apt.conf.d/20auto-upgrades
```

an example 
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
```


Information sources [Updates1](https://help.ubuntu.com/lts/serverguide/automatic-updates.html)
