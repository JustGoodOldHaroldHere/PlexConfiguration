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

i have uploaded my application file here you will find it in the GitHub folder of [/etc/ufw/applications.d/](/etc/ufw/applications.d/plexmediaserver) 

Set the firewall to default deny *This may effect your SSH Session*
```
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
ufw update plexmediaserver
ufw allow plexmediaserver
```



