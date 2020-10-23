# WallpaperCtl

## Introduction

WIP.

This is a lightweight tool for managing wallpapers and wallpaper packages.
It is tailored for AOSC OS (Retro), but other distributions which use the APT+DPKG toolchain for
package management may find this tool useful.

## Usage

| Command                               | Description
| ------------------------------------- | ----------------------------------------------
| `wallpaperctl lsPkgs`                 | List installed wallpaper packages.
| `wallpaperctl lsPkgContent {pkgid}`   | List content of an installed package. Returns an array of wallpaper stdnames.
| `wallpaperctl install {pkgid}`        | Install the specified package.
| `wallpaperctl rm {pkgid}`             | Uninstall the specified package.
| `wallpaperctl world`                  | List known wallpaper packages.
| `wallpaperctl search {word}`          | List known wallpaper packages then grep with $word.
| `wallpaperctl pkgInfo {pkgid}`        | Get description for a specific wallpaper package.
| `wallpaperctl ls`                     | List all wallpapers. Returns an array of wallpaper stdnames.
| `wallpaperctl info {wpid}`            | Get wallpaper metadata.
| `wallpaperctl path {wpid} {res}`      | Get wallpaper absolute path with a specific resolution.
| `wallpaperctl use {wpid}`             | Set wallpaper.
| `wallpaperctl getRatio`               | Get screen ratio.
| `wallpaperctl setRatio ${ratio}`      | Set screen ratio. The ratio field should look like `16b10`.
| `wallpaperctl setNamespace {ns}`      | Set global APT namespace (APT package name prefix, default "extra-wallpapers/aosc-wallpapers-").
| `wallpaperctl upgrade {pkgid}`        | Upgrade to the latest version of the specified  wallpaper package.
| `wallpaperctl upgrade-all`            | Upgrade all wapplaper packages.

## Referenced Files

| Path                              | Description
| --------------------------------- | ------------------------------------------
| (null)                            | None yet

## Copyright

Copyright (c) 2020 Neruthes <i@neruthes.xyz> and 0 other contributors.

The Programs in this repository are released under GNU GPLv2.

The images may have their respective licenses, as defined in the corresponding configuration files.
