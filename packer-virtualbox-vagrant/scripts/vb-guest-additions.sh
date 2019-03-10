#!/bin/sh
# install virtualbox additions build dependancies
apt --yes install --no-install-recommends linux-headers-amd64 make gcc

# cleanup virtualbox stuff
apt purge --yes linux-headers-amd64 make gcc
apt purge --yes --autoremove
apt clean --yes
