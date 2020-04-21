# Plex Installation and configuration 

I will skip the introduction to Plex as i may ask why you are here if you are not sure of its purpose. Have an open SSH session to your server and lets get started

## 1 Installation
### Run all commands with sudo

Jump to this link and choose your OS, if Ubuntu is not there then go for Linux. Click the 'Choose Distrobution' which will show the list of avaliable options. Right click your option and copy its link address

Jump to the tmp firectory
```
cd /tmp
```

Download the package, replace my link with the one you copied
```
wget https://downloads.plex.tv/plex-media-server-new/1.19.2.2673-776106bc6/debian/plexmediaserver_1.19.2.2673-776106bc6_amd64.deb
```

Install the package
```
dpkg -i plexmediaserver*
```

Plex will install and then be active @ http://localhost:32400/web for you to setup (if this is a local server replace localhost with your servers internal IP). Now if you are using a cloud solution you will most likely need to use SSH Tunneling in order to get to that link. If you are using Putty, open a Putty window type your IP/Hostname and port and expand the SSH tab on the left

Once you have expanded that tab, you guessed it. Click Tunnels 

Source port is 32400
Destination is localhost:32400
Click add

Scroll the left pane back up and click session

Now if you hit open and authenticate you can go to your web browser on your local machine to the Plex link above

Information sources: https://support.plex.tv/articles/200288586-installation/
