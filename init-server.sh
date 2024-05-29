#! /bin/env/ bash

SSH_KEY=$SSH_LOGIN_PUB_KEY

#Sets the workstation pub key to auth
mkdir -p ~/.ssh
#cat /etc/ssh/id_ed25519_ssh_login.pub >> ~/.ssh/authorized_keys

#checks if ssh pub key was set
if [ -z "${SSH_KEY}" ]; then
    echo "env var SSH_LOGIN_PUB_KEY was not set"
    exit 1
else
    #Checks if file doesn't exists
    if [ ! -f ~/.ssh/authorized_keys ]; then
        echo $SSH_KEY > ~/.ssh/authorized_keys
    else
        keyAlreadySet=$(grep "$SSH_KEY" ~/.ssh/authorized_keys | wc -l)
        if [ "$keyAlreadySet" -gt "0" ]; then
            echo "SSH_KEY already exists"
        else
            echo $SSH_KEY >> ~/.ssh/authorized_keys
        fi
    fi
fi
#Starts ssh server
#/sbin/tini -s /usr/bin/ssh.sh
/usr/sbin/sshd -D