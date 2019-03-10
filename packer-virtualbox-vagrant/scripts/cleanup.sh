# Clean up
apt-get --yes autoremove
apt-get --yes clean

# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*
