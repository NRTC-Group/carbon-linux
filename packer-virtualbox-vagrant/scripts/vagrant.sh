# Install vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget -O /home/vagrant/.ssh/authorized_keys "https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub" 
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Customize the message of the day
echo 'Welcome to CARBON' > /var/run/motd
