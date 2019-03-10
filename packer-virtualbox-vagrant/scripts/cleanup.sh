# Clean up
apt --yes autoremove
apt --yes clean

# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

# Reduce grub timeout to 1s to speed up booting
[ -f /etc/default/grub ] && \
  sed -i s/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/ /etc/default/grub

update-grub

# cleanup
rm -f /usr/sbin/policy-rc.d
