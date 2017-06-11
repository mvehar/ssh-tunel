#!/bin/sh

adduser -D ${USER}  echo "${USER}:${PASS}" | chpasswd

sed -i s/[#]*PasswordAuthentication.*/PasswordAuthentication\ yes/ /etc/ssh/sshd_config 
sed -i s/[#]*PubkeyAuthentication.*/PubkeyAuthentication\ yes/ /etc/ssh/sshd_config
sed -i s/[#]*AllowTcpForwarding.*/AllowTcpForwarding\ yes/ /etc/ssh/sshd_config
sed -i s/[#]*GatewayPorts.*/GatewayPorts\ yes/ /etc/ssh/sshd_config
sed -i s/[#]*ClientAliveInterval.*/ClientAliveInterval\ 15/ /etc/ssh/sshd_config

ssh-keygen -A

/usr/sbin/sshd -D -e $@
