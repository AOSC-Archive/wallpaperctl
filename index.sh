#!/bin/bash

# AOSC Retro Wallpaper Manager (CLI)

SUBCOMMAND=$1
ARG0=$2
ARG1=$3
ARG2=$4

PREFIX="aosc-wallpapers-"
PREFIX="xf86-"
NAMESPACE="extra-wallpapers/$PREFIX"
UUID="63d1cc3135374917824c9b33a5455cb8"
TMP=/tmp/tmp.$UUID

case $SUBCOMMAND in
    ls)
        ls -1 /usr/share/wallpapers
        ;;
    info)
        StdName=$ARG0
        FieldName=$ARG1
        MetadataPath=/usr/share/wallpapers/$StdName/metadata.desktop
        grep "X-KDE-PluginInfo-$FieldName=" $MetadataPath > $TMP
        sed -i "s/$FieldName//" $TMP
        QueryResult=`cat $TMP`
        rm $TMP
        echo ${QueryResult:18}
        ;;
    world)
        apt search $NAMESPACE
        ;;
    search)
        apt search $NAMESPACE$ARG0
        ;;
    install)
        sudo apt install $NAMESPACE$ARG0
        ;;
    rm)
        sudo apt uninstall $NAMESPACE$ARG0
        ;;
    lsPkgs)
        apt list > $TMP 2> /dev/null
        grep installed $TMP > $TMP.1
        grep $PREFIX $TMP.1 > $TMP
        sed -i "s/$PREFIX//" $TMP
        sed -i "s/ .*\$//" $TMP
        sed -i "s/\/.*\$//" $TMP
        cat $TMP
        rm $TMP $TMP.1
        ;;
    pkgInfo)
        apt info $PREFIX$ARG0
esac
