# Installation for Nginx and Certbot
the purpose of nginx and certbot is a lightweight web server. I use this to allow external access to certain webui's such as Radarr and Sonarr. Of course you should always be careful when doing this and you are doing this at your own risk. The purpose of certbot is to provide signed SSL certificates, you dont want to be using HTTP
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

Now you have 2 options, obtain and install your certificate or just obtain

Just obtain
```
certbot certonly --nginx
```

Obtain and install
```
certbot --nginx
```

Follow the instructions on the screen

Configuring nginx 

So for Nginx again there are a million ways to do so and it all depends on your requirements. I have uploaded my Nginx config [here](/etc/nginx/)


You can also install Nginx amplify which allows you to have some nice look statistics and monitoring for your webserver. you will need to sign up [here](https://amplify.nginx.com/login) and it will provide instructions upon login. Again my nginx config is already setup with this


information sources: [Nginx1](https://certbot.eff.org/lets-encrypt/ubuntubionic-nginx)
