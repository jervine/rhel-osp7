#!/bin/bash
##
## Script to set up the undercloud
##


## Prep:
mkdir ~/images
mkdir ~/templates
sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf

echo "Checking hostname ..."
hostname
echo "Checking FQDN hostname ..."
hostname -f
echo "If either of those are wrong, please correct them using the hostnamectl command:"
echo "e.g. 'sudo hostnamectl set-hostname manager.example.com' or 'sudo hostnamectl set-hostname --transient manager.example.com'"

echo "The director also needs an entry in the /etc/hosts file:"
cat /etc/hosts | grep 127
echo "You should have an entry like: 127.0.0.1   manager.example.com manager localhost localhost.localdomain localhost4 localhost4.localdomain4"
echo "If not present, update the /etc/hosts file appropriately."

echo "Ensure your system is registered to the OpenStack channels"
echo "Run sudo subscription-manager register"
echo "Find the correct poolID from: sudo subscription-manager list --available --all"
echo "Subscribe to the poolID: sudo subscription-manager attach --pool=pool_id"
echo "Disable all the repos: sudo subscription-manager repos --disable=*"
echo "Enable the required repos: sudo subscription-manager repos --enable=rhel-7-server-rpms --enable=rhel-7-server-optional-rpms --enable=rhel-7-server-extras-rpms --enable=rhel-7-server-openstack-7.0-rpms --enable=rhel-7-server-openstack-7.0-director-rpms"


## Extra installs:
sudo yum install -y yum-plugin-priorities yum-utils
sudo yum-config-manager --enable rhel-7-server-openstack-7.0-rpms --setopt="rhel-7-server-openstack-7.0-rpms.priority=1"
sudo yum-config-manager --enable rhel-7-server-rpms --setopt="rhel-7-server-rpms.priority=1"
sudo yum-config-manager --enable rhel-7-server-optional-rpms --setopt="rhel-7-server-optional-rpms.priority=1"
sudo yum-config-manager --enable rhel-7-server-extras-rpms --setopt="rhel-7-server-extras-rpms.priority=1"


## Update
echo "Updating ... reboot afterwards"
sudo yum update -y


## Actual Installation
sudo yum install -y python-rdomanager-oscplugin


## Create the instack certificates
openssl genrsa -out privkey.pem 2048
echo "Now manually run: openssl req -new -x509 -key privkey.pem -out cacert.pem -days 365"
echo "Now run: cat cacert.pem privkey.pem > undercloud.pem"

sudo mkdir /etc/pki/instack-certs
sudo cp ~/undercloud.pem /etc/pki/instack-certs/.
sudo semanage fcontext -a -t etc_t "/etc/pki/instack-certs(/.*)?"
sudo restorecon -R /etc/pki/instack-certs

## Install the undercloud
echo "Configure the undercloud.conf file as per the documentation ..."
echo "Now run: openstack undercloud install"
