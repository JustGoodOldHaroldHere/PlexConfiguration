# Installation of Tor proxy 
Tor or The Onion Router is a way of enabling annonymous communication accross the internet. This is optional that you install Tor but can be useful in order to gain access to certain indexers. I use the proxy for Jackett
### Run all commands with sudo

##### Proxies are not recommended in Jackett as they leak requests and can cause high CPU usage. Please see Jacketts GitHub for further info

generally it is as easy as
```
apt-get install tor
```

However should this not work here is a method for doing so - (Currently not working)

add repo and keys
```
deb https://deb.torproject.org/torproject.org bionic main
deb-src https://deb.torproject.org/torproject.org bionic main
curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
```

update and install
```
apt update
apt install tor
```

Once tor is installed you the proxy will be SOCKS5 address: localhost or 127.0.0.1 Port: 9050

To test it is working - This will provide your Tor IP address back to you
```
curl --socks5 127.0.0.1:9050 http://checkip.amazonaws.com/
```



information sources [Tor1](https://2019.www.torproject.org/docs/debian.html.en)
