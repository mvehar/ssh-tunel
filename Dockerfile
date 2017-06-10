FROM alpine
MAINTAINER Matej Vehar "https://github.com/mvehar"

ENV USER tunnel
ENV PASS tunnelpwd
EXPOSE 22

RUN apk --no-cache add --update  openssh-server \
  && sed -i s/#PasswordAuthentication.*/PasswordAuthentication\ yes/ /etc/ssh/sshd_config \
  && sed -i s/#PubkeyAuthentication.*/PubkeyAuthentication\ yes/ /etc/ssh/sshd_config \
  && sed -i s/#AllowTcpForwarding.*/AllowTcpForwarding\ yes/ /etc/ssh/sshd_config \
  && sed -i s/#GatewayPorts.*/GatewayPorts\ yes/ /etc/ssh/sshd_config \
  && sed -i s/#StrictHostKeyChecking.*/StrictHostKeyChecking\ no/ /etc/ssh/sshd_config

ADD entrypoint.sh /

CMD ["/entrypoint.sh"]

