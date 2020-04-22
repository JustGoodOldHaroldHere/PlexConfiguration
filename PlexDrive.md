# Installation PlexDrive
PlexDrive is verymuch similar to Rclone howver is more designed to work with, you guessed it, Plex. Now it is not compulsary you install PlexDrive as Rclone can handle all of that for you however as mentioned in the rclone.md it is very much just fine tuning what works for you. 

## Run all commands with sudo

Plex drive is dead simple to install however currently requires manual updates

Grag the latest [release](https://github.com/plexdrive/plexdrive/releases) - replace my link with yours
```
cd /tmp
wget https://github.com/plexdrive/plexdrive/releases/download/5.1.0/plexdrive-linux-amd64
```

now move it somewhere useful
```
mv plexdrive* /usr/bin/plexdrive
```

Make a config folder
```
mkdir /root/.config/plexdrive
```

Job done - To use it you simply create a service like rclone but of course use the plexdrive supported options (see information sources)

here is an example
```
[Unit]
Description=PlexDrive Service
After=plexdrive.target network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/plexdrive mount -c /root/.config/plexdrive/ \
/mnt/plexdrive \
-o \
--allow-other \
-v 4 
ExecStop=/usr/bin/sudo /usr/bin/fusermount -uz /mnt/plexdrive
Restart=on-abort

[Install]
WantedBy=default.target
```

Plexdrive will go through obtaining a client ID and secret [See Rclone.md](/rclone.md)


Information sources: [PlexDrive1](https://github.com/plexdrive/plexdrive)
