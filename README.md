istepanov/syncthing
===================

[Syncthing](http://syncthing.net/) Docker image

[![](https://images.microbadger.com/badges/version/istepanov/syncthing.svg)](https://microbadger.com/images/istepanov/syncthing "Get your own version badge on microbadger.com")

### How to run

    docker run -d \
        --name syncthing \
        --restart always \
        -p 8384:8384 -p 22000:22000 -p 21027:21027/udp \
        -v /opt/docker/syncthing/config:/home/syncthing/.config/syncthing \
        -v /opt/docker/syncthing/Sync:/home/syncthing/Sync \
        istepanov/syncthing

Then access Syncthing Web UI at [http://localhost:8384/]()
