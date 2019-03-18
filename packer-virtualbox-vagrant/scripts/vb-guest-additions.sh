#!/bin/sh
# install virtualbox additions build dependancies
apt --yes install --no-install-recommends linux-headers-amd64 make gcc bzip2

mount /dev/sr1 /media/cdrom
/media/cdrom/VBoxLinuxAdditions.run
