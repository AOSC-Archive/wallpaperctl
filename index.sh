#!/bin/bash

# AOSC Retro Wallpaper Manager (CLI)

SUBCOMMAND=$1
ARG0=$2
ARG1=$3
ARG2=$4

UUID=`uuidgen`

if [[ $SUBCOMMAND = "lsWp" ]]; then
    ls -1 /usr/share/wallpapers
fi

if [[ $SUBCOMMAND = "info" ]]; then
    # Usage: arwm info {StdName} {FieldName}
    StdName=$ARG0
    FieldName=$ARG1
    MetadataPath=/usr/share/wallpapers/$StdName/metadata.desktop
    # [Desktop Entry]
    # Name=Jelly YSGD
    # X-KDE-PluginInfo-Name=Jelly YSGD
    # X-KDE-PluginInfo-Author=Neruthes
    # X-KDE-PluginInfo-Email=undefined
    # X-KDE-PluginInfo-License=CC-BY-NC-ND-4.0
    grep "X-KDE-PluginInfo-$FieldName=" $MetadataPath > /tmp/$UUID.info1
    sed -i "s/$FieldName//" /tmp/$UUID.info1
    QueryResult=`cat /tmp/$UUID.info1`
    echo ${QueryResult:18}
fi
