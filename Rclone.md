# Installation for Rclone 
Rclone uses fuse and allows you to mount remote storage solutions such as Google Drive to your local storage

## Run all commands with sudo

Install Rclone
```
curl https://rclone.org/install.sh | sudo bash
```

to configure rclone
```
rclone config
```

Here generally speaking you have options. You obviously want to add your Google Drive but if you are one with a tinfoil hat then you might want to add a crypt to encrypt your google drive. I do not use a crypt myself

Firstly you want to go to [this link](developers.google.com) Scroll to the bottom and 
click google API Console. (This is for Google One users, GSuite might be different)

Create a project 

Once your project is made, click Library

find Google Drive API and enable it

Go back to the navigation menu click OAuth consent screen

Select external, hit create, just give it an application name and hit Save

Back on the navigation menu, click credentials 

Click create credentials>OAuth Client ID

Select other and give it a name

Make a note of your client ID and Client secret


Within Rclone config here are the general options you want to select in order to add a Google Drive remote

- N for New Remote
- Give it a name, i will use GDrive
- 13 for storage (option for Google Drive)
- The client ID from the steps above
- The client secret from the steps above
- 1 for Access which provides full access
- Blank for Root folder ID
- Blank for service account 
- n for auto config
- You want to visit the link it provides, follow the steps and paste in the auth code
- n for configure as a team drive

For further options and support please visit the RClone forums/website. Information sources 

to test your remote is working - Should report your google drive folders back to you 
```
rclone lsd GDrive:
```

Mounting on startup 

I use a systemd .service file for this and again you will find my config may not be the same for your config but [here is mine](etc/systemd/systemgdrive.service)

I would recommend having a look on the RClone website to see what all of the options do and mean as it will take a little fine tuning for you get it to match your requirements

Commands for creating the service 
```
nano /etc/systemd/system/FILENAMEHERE.service
```

once saved and closed
```
systemctl enable FILENAMEHERE.service
```

If you ever edit it 
```
systemctl daemon-reload
```

Now when it comes to writing to google drive with the likes of Radarr and Sonarr. You cannot download torrents directly to the drive!! I would advise making temporary directories for Transmission to download content to and configure Sonarr/Radarr to NOT use hardlinks when moving to your library folder (which is in Google Drive). This way you are not directly downloading torrents to google you are downloading them directly to your server and allowing Radarr/Sonarr to rename and move them to your Google Drive for you

I would advise to make a cron job to cleanup every once in a while or you can just manually check it yourself. This will prevent un-required data being left on your server. If you are following my folder layout and using a wasteland folder for incomplete downloads you will not have to worry about moving media that is not downloaded because once it is complete it will be in your Radarr/Sonarr download directory



Information sources [Rclone1](https://rclone.org/install/) [Rclone2](https://rclone.org/drive/) [Rclone3](https://rclone.org/commands/rclone_mount/) [Rclone4](https://bytesized-hosting.com/pages/rclone-gdrive)
