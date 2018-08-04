FROM alpine:latest

MAINTAINER blueapple <blueapple1120@qq.com>

ARG VERSION

LABEL maintainer="blueapple" \
      org.label-schema.name="Lighttpd" \
      org.label-schema.version=$VERSION

ENV UID     100
ENV GID     101

RUN set -ex && \
    apk add --no-cache lighttpd curl

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

WORKDIR /var/www

VOLUME ["/var/www"]

EXPOSE 80

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
