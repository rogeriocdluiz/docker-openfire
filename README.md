# docker-openfire
Openfire Dockerfile for trusted automated Docker builds

- [Introduction](#introduction)
- [Image](#image)
- [Installation](#installation)
  - [Usage](#usage)
   - [Embededdb](#embededdb)
- [References](#references)
- [Licence](#licence)



# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [Openfire](http://www.igniterealtime.org/projects/openfire/).

Openfire is a real time collaboration (RTC) server licensed under the Open Source Apache License. It uses the only widely adopted open protocol for instant messaging, XMPP (also called Jabber). Openfire is incredibly easy to setup and administer, but offers rock-solid security and performance.


# Image

* [debian:stable](https://hub.docker.com/_/debian/)

# Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/xxxxx/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull xxxxxx/openfire`

## Usage

    docker run -ti --rm -name openfire -v /opt/docker/openfire/conf:/opt/openfire/conf -v /opt/docker/openfire/logs:/opt/openfire/logs/ -v /opt/docker/openfire/plugins:/opt/openfire/plugins -p 9090:9090/tcp -p 0.0.0.0:9091:9091/tcp -p 0.0.0.0:5222:5222/tcp -p 0.0.0.0:7777:7777/tcp  rc/openfire /bin/bash


*Alternatively, you can use the sample [docker-compose.yml](docker-compose.yml) file to start the container using [Docker Compose](https://docs.docker.com/compose/)*

Point your browser to http://localhost:9090 and follow the setup procedure to complete the installation. The [Build A Free Jabber Server In 10 Minutes](https://www.youtube.com/watch?v=ytUB5qJm5HE#t=246s) video by HAKK5 should help you with the configuration and also introduce you to some of its features.

### Embededdb

    docker run -ti --rm -name openfire -v /opt/docker/openfire/conf:/opt/openfire/conf -v /opt/docker/openfire/logs:/opt/openfire/logs/ -v /opt/docker/openfire/plugins:/opt/openfire/plugins -v /opt/docker/openfire/embedded-db:/opt/openfire/embedded-db -p 9090:9090/tcp -p 0.0.0.0:9091:9091/tcp -p 0.0.0.0:5222:5222/tcp -p 0.0.0.0:7777:7777/tcp  rc/openfire /bin/bash



## Persistence

For the Openfire to preserve its state across container shutdown and startup you should mount a volume at `/opt/openfire/conf`,`/opt/openfire/logs`,`/opt/openfire/plugins` and `/opt/openfire/embedded-db`.


# References

  * http://www.igniterealtime.org/projects/openfire/

# Licence

MIT

