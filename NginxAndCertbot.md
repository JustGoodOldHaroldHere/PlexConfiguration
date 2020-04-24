# Installation for Nginx and Certbot
the purpose of nginx and certbot is a lightweight web server. I use this to allow external access to certain webui's such as Radarr and Sonarr. Of course you should always be careful when doing this and you are doing this at your own risk. The purpose of certbot is to provide signed SSL certificates, you dont want to be using HTTP

Now it is down to you to decide what you want to be able to see on the public internet but of course take caution in this and never forget about security. I only ever allow Radarr, Sonarr (and Webmin with 2FA enabled and IP access restrictions). All of these use an SSL certificate and the beauty of NGINX being a reverse proxy, you do not need to open anymore ports than 443 and 80 as Nginx handles the forwarding for you. Webmin handles its own Webui so i do not use Nginx for it however i do use the SSL certificate and an obscure port

## Run all commands with sudo

### You will need to know/own the following 
- A domain name - i will be using domain.com 
- ensure ports 80 and 443 are open to your server
- point your desired domains and subdomains to your servers external IP address in DNS 

Now there are again a million ways to do this but i like short, simple and rather bulletproof 

Install software properties - if you haven't already
```
apt-get install software-properties-common
```

add repositories and update
```
add-apt-repository universe
add-apt-repository ppa:certbot/certbot
apt update
```

install required packages
```
apt-get install certbot python-certbot-nginx nginx
```

Now you have 2 options, obtain and install your certificate or just obtain. I would first setup your nginx configuration with all of your domains. Of course leave out the certificate location otherwise nginx wont start but setting up the configuration (even you are placing in settings for SSL) for the domains you wish to obtain a certificate for will save you time as Certbot will try and detect them. It is worth noting if nginx will not start Certbot will fail

Just obtain
```
certbot certonly --nginx
```

Obtain and install
```
certbot --nginx
```

Follow the instructions on the screen

So for configuring Nginx again there are a million ways to do so and it all depends on your requirements. I have uploaded my Nginx config [here](/etc/nginx/)


You can also install Nginx amplify which allows you to have some nice looking statistics and monitoring for your webserver. you will need to sign up [here](https://amplify.nginx.com/login) and it will provide instructions upon login. My nginx config is already setup with this in mind


information sources: [Nginx1](https://certbot.eff.org/lets-encrypt/ubuntubionic-nginx)
