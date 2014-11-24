#!/bin/bash

set -e

HOME=`eval echo ~syncthing`
CONFIG_FOLDER="$HOME/.config/syncthing"
CONFIG_FILE="$CONFIG_FOLDER/config.xml"

if [ ! -f "$CONFIG_FILE" ]; then
    /syncthing -generate="$CONFIG_FOLDER"
    xmlstarlet ed -L -u "/configuration/gui/address" -v "0.0.0.0:8080" "$CONFIG_FILE"
fi

chown -R syncthing:syncthing "$HOME"

exec su - syncthing -c /syncthing
