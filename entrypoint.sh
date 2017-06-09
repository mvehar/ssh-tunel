#!/bin/sh

adduser -D ${USER} && echo "${USER}:${PASS}" | chpasswd

ssh-keygen -A

/usr/sbin/sshd -D -e $@
