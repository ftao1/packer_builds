#!/bin/sh

# Remove Linux headers
#yum -y remove gcc kernel-devel kernel-headers perl cpp
yum -y clean all

# Remove Virtualbox specific files
rm -rf /usr/src/vboxguest* /usr/src/virtualbox-ose-guest*
rm -rf *.iso *.iso.? /tmp/vbox /home/vagrant/.vbox_version

# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# remove under tmp directory
rm -rf /tmp/*

# zero out empty space
dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY
