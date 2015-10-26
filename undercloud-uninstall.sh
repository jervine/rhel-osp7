#!/bin/bash
##
## OpenStack Undercloud Uninstaller
##

## Stop the OpenStack Services
systemctl stop openstack-ceilometer-api openstack-ceilometer-collector openstack-ceilometer-notification openstack-glance-api openstack-glance-registry openstack-heat-api-cfn openstack-heat-api openstack-heat-engine openstack-ironic-discoverd-dnsmasq openstack-ironic-discoverd openstack-keystone openstack-nova-consoleauth openstack-nova-scheduler openstack-swift-object-auditor openstack-swift-object-replicator openstack-swift-object-updater openstack-swift-object openstack-swift-proxy

## Remove the RPMs on the Director
yum remove -y openstack-ironic-api-2015 redhat-access-plugin-openstack openstack-swift-plugin-swift3 python-django-openstack-auth openstack-tripleo-image-elements openstack-tuskar openstack-tuskar-ui-extras openstack-heat-api-cfn-2015 openstack-ceilometer-alarm-2015 openstack-swift-account openstack-utils openstack-heat-common openstack-ceilometer-notification openstack-nova-compute python-openstackclient openstack-tripleo openstack-tripleo-puppet-elements openstack-ironic-conductor openstack-dashboard-theme openstack-nova-common openstack-neutron openstack-ceilometer-common openstack-swift openstack-nova-conductor openstack-neutron-openvswitch openstack-swift-container openstack-nova-api openstack-ceilometer-central openstack-heat-templates openstack-tripleo-heat-templates openstack-ironic-common openstack-selinux openstack-dashboard openstack-glance openstack-neutron-common openstack-ceilometer-api openstack-nova-novncproxy openstack-nova-scheduler openstack-swift-object openstack-nova-cert openstack-heat-api-cloudwatch openstack-ceilometer-collector openstack-neutron-ml2 openstack-keystone openstack-puppet-modules openstack-heat-engine openstack-heat-api openstack-tempest-kilo openstack-swift-proxy openstack-tripleo-common openstack-ironic-discoverd openstack-tuskar-ui openstack-nova-console python-neutron python-neutronclient mariadb-devel mariadb mariadb-server mariadb-libs dnsmasq-utils dnsmasq python-glanceclient python-glance-store python-glance python-glance-store python-ceilometerclient python-ceilometer glusterfs-libs glusterfs glusterfs-api haproxy python-heatclient hiera python-ironicclient iscsi-initiator-utils-iscsiuio libiscsi iscsi-initiator-utils libvirt-daemon-driver-nwfilter  libvirt-daemon libvirt-client libvirt-daemon-driver-interface libvirt-daemon-driver-secret libvirt-python libvirt-daemon-driver-qemu libvirt-daemon-driver-storage libvirt-daemon-driver-network libvirt-daemon-driver-nodedev libvirt-daemon-kvm python-novaclient openvswitch python-openvswitch puppet rabbitmq-server tftp-server python-tuskarclient python-swiftclient python-keystoneclient python-keystonemiddleware python-keystone 

## Take a hammer to the remaining files + directories
rm -rf /var/lib/mysql/*
rm -rf /var/lib/ceilometer
rm -rf /var/lib/dnsmasq
rm -rf /var/lib/glance
rm -rf /var/lib/glusterd
rm -rf /var/lib/haproxy
rm -rf /var/lib/heat
rm -rf /var/lib/hiera
rm -rf /var/lib/ironic
rm -rf /var/lib/ironic-discoverd
rm -rf /var/lib/iscsi
rm -rf /var/lib/libvirt
rm -rf /var/lib/neutron
rm -rf /var/lib/nova
rm -rf /var/lib/openvswitch
rm -rf /var/lib/os-prober
rm -rf /var/lib/puppet
rm -rf /var/lib/rabbitmq
rm -rf /var/lib/tftpserver

rm -rf /etc/tuskar
rm -rf /etc/swift
rm -rf /etc/pki/instack-certs
rm -rf /etc/rabbitmq
rm -rf /etc/puppet
rm -rf /etc/os-net-config
rm -rf /etc/os-collect-config.vonf
rm -rf /etc/openvswitch
rm -rf /etc/openstack-dashboard
rm -rf /etc/nova
rm -rf /etc/neutron
rm -rf /etc/my.cnf
rm -rf /etc/my.cnf.d
rm -rf /etc/libvirt
rm -rf /etc/keystone
rm -rf /etc/iscsi
rm -rf /etc/ironic-discoverd
rm -rf /etc/ironic
rm -rf /etc/hiera*
rm -rf /etc/heat
rm -rf /etc/haproxy
rm -rf /etc/dnsmasq*
rm -rf /etc/ceilometer

echo "Deleting the ifcfg-br-ctlplane and ifcfg-eno1 files. Change these lines if they don't match your server!"
rm -rf /etc/sysconfig/network-scripts/ifcfg-br-ctlplane
rm -rf /etc/sysconfig/network-scripts/ifcfg-eno1

rm -rf /home/stack/undercloud.pem
rm -rf /home/stack/cacert.pem
rm -rf /home/stack/privkey.pem

rm -rf /httpboot
