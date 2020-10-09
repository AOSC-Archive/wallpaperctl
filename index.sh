#!/bin/bash

# AOSC Retro Wallpaper Manager (CLI)

SUBCOMMAND=$1
ARG0=$2
ARG1=$3
ARG2=$4

NAMESPACE="extra-wallpapers/aosc-wallpapers-"
UUID=`uuidgen`

case $SUBCOMMAND in
    lsWp )
        ls -1 /usr/share/wallpapers
        ;;
    info )
        StdName=$ARG0
        FieldName=$ARG1
        MetadataPath=/usr/share/wallpapers/$StdName/metadata.desktop
        grep "X-KDE-PluginInfo-$FieldName=" $MetadataPath > /tmp/$UUID.info1
        sed -i "s/$FieldName//" /tmp/$UUID.info1
        QueryResult=`cat /tmp/$UUID.info1`
        rm /tmp/$UUID.info1
        echo ${QueryResult:18}
        ;;
    world )
        apt search $NAMESPACE
        ;;
    search )
        apt search $NAMESPACE$ARG0
        ;;
    install )
        sudo apt install $NAMESPACE$ARG0
        ;;
    rm )
        sudo apt uninstall $NAMESPACE$ARG0
        ;;
    info )
        ;;
esac
