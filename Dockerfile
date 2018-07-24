FROM alpine:latest
MAINTAINER Michel Belleau <michel.belleau@malaiwah.com>

RUN apk --update add unbound curl bash openssl

ADD assets/unbound.conf /etc/unbound/unbound.conf

RUN curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache
RUN unbound-anchor -v -a /etc/unbound/root.key; true
RUN chown root:unbound /etc/unbound && chmod 0775 /etc/unbound

ADD start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 53/udp
EXPOSE 53

CMD ["/start.sh"]
