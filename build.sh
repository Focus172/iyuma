#!/bin/sh

case $1 in
    "usr") home-manager switch --flake '.#focus'
    ;;
    "sys") sudo nixos-rebuild switch --flake '.#steambox'
    ;;
    *) echo "Enter a target to rebuild: usr or sys" && exit 1
    ;;
esac
