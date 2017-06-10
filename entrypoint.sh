#!/bin/sh

adduser -D ${USER} && echo "${USER}:${PASS}" | chpasswd

ssh-keygen -t rsa

/usr/sbin/sshd -D -e $@
