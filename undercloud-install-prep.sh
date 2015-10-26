#!/bin/bash
##
## Scripted OpenStack undercloud install
##

useradd stack
echo "stack ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/stack
chmod 0440 /etc/sudoers.d/stack
echo "The 'stack' user has been created. Currently no password exsists. Create one manually if necessary."
echo "Now switch to the stack user via 'su - stack' and complete the undercloud installation as the stack user."
