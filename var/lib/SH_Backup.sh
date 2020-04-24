
#!/bin/bash
TDATE=$(date +"%d-%m-%y")
mkdir /tmp/SH_Backup_"$TDATE"
TPATH=/tmp/SH_Backup_"$TDATE"
mkdir "$TPATH"/transmission
mkdir "$TPATH"/service
mkdir "$TPATH"/ufw
mkdir "$TPATH"/plex
mkdir "$TPATH"/webmin
mkdir "$TPATH"/Nginx
cp /etc/nginx/sites-enabled "$TPATH"/Nginx/ -r
cp /etc/nginx/nginx.conf "$TPATH"/Nginx/
cp /var/lib/sonarr "$TPATH"/ -r
cp /var/lib/radarr "$TPATH"/ -r
cp /var/lib/jackett "$TPATH"/ -r
cp /var/lib/transmission-daemon/info/settings.json "$TPATH"/transmission/ -L
cp /etc/systemd/system/jackett.service "$TPATH"/service/
cp /etc/systemd/system/radarr.service "$TPATH"/service/
cp /etc/ufw/user.rules "$TPATH"/ufw/
cp /etc/ufw/user6.rules "$TPATH"/ufw/
cp /etc/ufw/applications.d "$TPATH"/ufw/ -r
cp "/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Plug-in Support/Databases" "$TPATH"/plex/ -r
cp /var/lib/webminb/ "$TPATH"/webmin/ -r

rclone move "$TPATH" gdrive:Plex/Backups/SH_Backup_"$TDATE"
# The rm command is there just incase Rclone fails
rm -r "$TPATH"
