FROM alpine
MAINTAINER Matej Vehar "https://github.com/mvehar"

ENV USER tunnel
ENV PASS tunnelpwd
EXPOSE 22

RUN apk --no-cache add --update  openssh-server

ADD entrypoint.sh /

CMD ["/entrypoint.sh"]

