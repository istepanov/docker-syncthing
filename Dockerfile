FROM golang
MAINTAINER Ilya Stepanov <dev@ilyastepanov.com>

ENV VERSION v0.10.6

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /go/src/github.com/syncthing && \
    cd /go/src/github.com/syncthing && \
    git clone https://github.com/syncthing/syncthing.git && \
    cd syncthing && \
    git checkout $VERSION && \
    go run build.go && \
    mv bin/syncthing /syncthing && \
    rm -rf /go/src/github.com/syncthing

RUN useradd -m syncthing
USER syncthing

EXPOSE 8080 22000 21025/udp

CMD ["/syncthing"]
