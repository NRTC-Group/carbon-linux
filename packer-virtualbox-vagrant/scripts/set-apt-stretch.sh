#!/bin/bash

set -e

echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/99translations

cat > /etc/apt/sources.list <<-EOF
# Debian Main Repos

deb http://deb.debian.org/debian-security stretch/updates main contrib non-free
deb http://deb.debian.org/debian/ stretch main contrib non-free
deb http://deb.debian.org/debian/ stretch-updates main contrib non-free
deb http://deb.debian.org/debian/ stretch-proposed-updates main contrib non-free
deb http://deb.debian.org/debian stretch-backports main contrib non-free
deb http://deb.debian.org/debian-debug stretch-debug main contrib non-free
deb http://deb.debian.org/debian-debug stretch-proposed-updates-debug main contrib non-free
deb http://deb.debian.org/debian-debug stretch-backports-debug main contrib non-free
EOF

apt --yes update
apt --yes dist-upgrade
