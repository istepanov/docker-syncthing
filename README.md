istepanov/syncthing
===================

[![Docker Stars](https://img.shields.io/docker/stars/istepanov/syncthing.svg)](https://hub.docker.com/r/istepanov/syncthing/)
[![Docker Pulls](https://img.shields.io/docker/pulls/istepanov/syncthing.svg)](https://hub.docker.com/r/istepanov/syncthing/)
[![Docker Build](https://img.shields.io/docker/automated/istepanov/syncthing.svg)](https://hub.docker.com/r/istepanov/syncthing/)
[![Layers](https://images.microbadger.com/badges/image/istepanov/syncthing.svg)](https://microbadger.com/images/istepanov/syncthing)
[![Version](https://images.microbadger.com/badges/version/istepanov/syncthing.svg)](https://microbadger.com/images/istepanov/syncthing)
[![Join the chat at https://gitter.im/istepanov/docker-syncthing](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/istepanov/docker-syncthing?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[Syncthing](http://syncthing.net/) Docker image

### How to run

    docker run -d \
        --name syncthing \
        --restart always \
        -p 8384:8384 -p 22000:22000 -p 21027:21027/udp \
        -v /opt/docker/syncthing/config:/home/syncthing/.config/syncthing \
        -v /opt/docker/syncthing/Sync:/home/syncthing/Sync \
        istepanov/syncthing

Then access Syncthing Web UI at [http://localhost:8384/]()
