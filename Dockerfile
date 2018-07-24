FROM alpine:latest
MAINTAINER Michel Belleau <michel.belleau@malaiwah.com>

RUN apk --update add unbound curl bash

ADD assets/unbound.conf /etc/unbound/unbound.conf

RUN curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache

ADD start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 53/udp
EXPOSE 53

CMD ["/start.sh"]
