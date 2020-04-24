Make a .conf file for each subdomain using these templates and 1 .conf file containing all of your unused domains 

With this config the main [nginx.conf](/etc/nginx/nginx.conf) includes the SSL settings, the certificate location along with other required configuration and all that will be applied accross the board

the [Stub_Status](/etc/nginx/conf.d/stub_status.conf) contains additional configuration for Amplify 

the files within this directory (sites-enabled) are the configuration for each sub domain i use so one for Radarr one for Sonarr.... you get the idea. Each config then has its own HTTP>HTTPS redirect and its own settings for any specific requirements. All domains that i do not use land at a 404 page (defined in the unused domains config) as it is better practise to force them to go somewhere rather than just using a fingers crossed approach to it

Having it this way i find it is better as you can adapt from the base config by making a config for each domain without causing issues to any other site. If you don't want to make and adaptation it will just follow the main base nginx.conf. It also saves you putting the same settings i multiple locations such as the SSL settings making it easier to understand should you have an issue
