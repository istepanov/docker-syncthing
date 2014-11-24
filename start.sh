#!/bin/bash

CONFIG_FOLDER='/home/syncthing/.config/syncthing'

if [ ! -d "$CONFIG_FOLDER" ]; then
    mkdir -p "$CONFIG_FOLDER"
    /syncthing -generate="$CONFIG_FOLDER"
    xmlstarlet ed -L -u "/configuration/gui/address" -v "0.0.0.0:8080" "$CONFIG_FOLDER/config.xml"
fi

exec /syncthing
