# Install vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate -O /home/vagrant/.ssh/authorized_keys "https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub" 
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Customize the message of the day
echo 'Welcome to CARBON' > /var/run/motd


# upgrade Debian images as the LXC template does not do it.
printf '#!/bin/sh\nexit 101\n' > /usr/sbin/policy-rc.d
chmod +x /usr/sbin/policy-rc.d


# setup passwordless sudo for vagrant user
apt install -qy sudo
cat > /etc/sudoers.d/vagrant <<EOF
vagrant ALL=(ALL) NOPASSWD:ALL
EOF

chmod 0440 /etc/sudoers.d/vagrant

## speed up tweaks

# Prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config
# Disable password logins
echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config

# make sure /etc/machine-id is generated on next book
# /etc/machine-id needs to be unique so multiple systemd-networkd dhcp clients
# get different ip addresses from the DHCP server
rm /var/lib/dbus/machine-id > /etc/machine-id
