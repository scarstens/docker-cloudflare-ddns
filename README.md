<p align="center">
  <a href="http://docker.io">
    <img height="81" width="341" src="http://upload.wikimedia.org/wikipedia/commons/7/79/Docker_(container_engine)_logo.png">
  </a>
</p>

# docker-cloudflare-ddns
## Overview
Run this docker container as a service on your server to initiate a free Dynamic DNS solution on your own custom domains. Example docker run command:

```

```

## Nginx + PHP 7
A Nginx + PHP 7.0 (FPM) base container. Builds upon on the [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker) container. You can find the docker automated build [here](https://registry.hub.docker.com/u/ttaranto/docker-nginx-php7/).

## Services
All services are defined and managed using the phusion/baseimage methodology. Logs are output using syslog and can be accessed using ``docker logs {container}``.

* Nginx (lastest)
* PHP-FPM (7.0)
* Composer (PHP)
* Node.JS (lastest)
* XTERM environment support w/colors
* dnsutils
* cfcli

## Web Root
The following folder is specified as the default root web folder:

``/var/www/public``

TODO: build log reader at web endpoint for unraid GUI