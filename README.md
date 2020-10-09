# ARWM-CLI (AOSC Retro Wallpaper Manager)

## Introduction

WIP.

This is a lightweight tool for managing wallpapers and wallpaper packages.
It is tailored for AOSC OS (Retro), but other distributions which use the APT toolchain for
package management may find this tool useful.

## Usage

| Command                       | Description
| ----------------------------- | -----------
| `arwm lsPkgs`                 | List installed wallpaper packages.
| `arwm lsPkgContent {pkgid}`   | List content of an installed package. Returns an array of wallpaper stdnames.
| `arwm install {pkgid}`        | Install the specified package.
| `arwm rm {pkgid}`             | Uninstall the specified package.
| `arwm world`                  | List known wallpaper packages.
| `arwm search {word}`          | List known wallpaper packages then grep with $word.
| `arwm pkgInfo {pkgid}`        | Get description for a specific wallpaper package.
| `arwm ls`                     | List all wallpapers. Returns an array of wallpaper stdnames.
| `arwm info {wpid}`            | Get wallpaper metadata.
| `arwm path {wpid} {res}`      | Get wallpaper absolute path with a specific resolution.
| `arwm use {wpid}`             | Set wallpaper.
<!-- | `arwm setNamespace {ns}`      | Set global APT namespace (APT package name prefix, default "extra-wallpapers/aosc-wallpapers-"). -->
<!-- | `arwm upgrade {pkgid}`        | Upgrade to the latest version of the specified  wallpaper package. -->
<!-- | `arwm upgrade-all`            | Upgrade all wapplaper packages. -->

## Copyright

Copyright (c) 2020 Neruthes <i@neruthes.xyz> and 0 other contributors.

The Programs in this repository are released under GNU GPLv2.

The images may have their respective licenses, as defined in the corresponding configuration files.
