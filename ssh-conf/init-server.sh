#! /bin/env/ sh

#Sets the workstation pub key to auth
mkdir -p ~/.ssh
cat /etc/ssh/id_ed25519_ssh_login.pub >> ~/.ssh/authorized_keys
#Starts ssh server
/sbin/tini -s /usr/bin/ssh.sh