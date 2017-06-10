#!/bin/sh

adduser -D ${USER} && echo "${USER}:${PASS}" | chpasswd

ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ""

/usr/sbin/sshd -D -e $@
