FROM golang
MAINTAINER Ilya Stepanov <dev@ilyastepanov.com>

ENV VERSION v0.11.10

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y git xmlstarlet && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m syncthing

RUN mkdir -p /go/src/github.com/syncthing && \
    cd /go/src/github.com/syncthing && \
    git clone https://github.com/syncthing/syncthing.git && \
    cd syncthing && \
    git checkout $VERSION && \
    go run build.go && \
    mv bin/syncthing /home/syncthing/syncthing && \
    chown syncthing:syncthing /home/syncthing/syncthing && \
    rm -rf /go/src/github.com/syncthing

ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /home/syncthing

VOLUME ["/home/syncthing/.config/syncthing", "/home/syncthing/Sync"]

EXPOSE 8384 22000 21025/udp

CMD ["/start.sh"]
