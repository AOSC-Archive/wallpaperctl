#!/bin/bash

#######################################################
## AOSC Retro Wallpaper Manager (CLI)
## Copyright (c) Neruthes <https://neruthes.xyz> 2020
## Licensed under GNU GPLv2.
#######################################################

## Init
SUBCOMMAND=$1
ARG0=$2
ARG1=$3
ARG2=$4

## Constants
UUID="63d1cc3135374917824c9b33a5455cb8"
TMP=/tmp/tmp.$UUID

## Config
CONFDIR=$HOME/.config/arwm
mkdir -p $CONFDIR

## Config: Ratio
ACCEPTABLE_RATIOS=(4b3 3b2 16b10 16b9 21b9)
RATIO=16b10
RATIO_TMP=`cat $CONFDIR/ratio 2> /dev/null`
for (( i = 0; i < 5; i++ )); do
    if [[ $RATIO_TMP = ${ACCEPTABLE_RATIOS[$i]} ]]; then
        echo "Found good ratio: $RATIO_TMP ($i)"
        RATIO=$RATIO_TMP
    fi
done
echo $RATIO > $CONFDIR/ratio

## Config: Prefix
PREFIX="extra-wallpapers/aosc-wallpapers-"
cat $CONFDIR/prefix 2> $TMP
PREFIX_STDERR=`cat $TMP`
rm $TMP
if [[ ${PREFIX_STDERR:0:3} = "cat" ]]; then
    # Config file "prefix" does not exist
    echo $PREFIX > $CONFDIR/prefix 2> /dev/null
else
    PREFIX=`cat $CONFDIR/prefix`
fi

## Start
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
        apt search $PREFIX
        ;;
    search)
        apt search $PREFIX$ARG0
        ;;
    install)
        sudo apt install $PREFIX$ARG0
        ;;
    rm)
        sudo apt uninstall $PREFIX$ARG0
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
