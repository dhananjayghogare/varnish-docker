FROM alpine:3.6
ENV VARNISH_VCL_CONF /etc/varnish/default.vcl
ENV VARNISH_LISTEN_PORT 80
ENV VARNISH_ADMIN_ADDRESS 127.0.0.1
ENV VARNISH_ADMIN_PORT 6082
ENV VARNISH_MEMORY 256M
ENV VARNISH_TTL 120
ENV VARNISH_USER varnish
ENV VARNISH_GROUP varnish
ENV VARNISH_STORAGE /var/lib/varnish
ENV VARNISH_SECRET_FILE /etc/varnish/secret
ENV VARNISH_MIN_THREADS 50
ENV VARNISH_MAX_THREADS  1000
ENV VARNISH_THREADPOOL_TIMEOUT 300
EXPOSE 80 6082
RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache varnish varnish-dev varnish-geoip varnish-libs varnish-dbg bash

# Expose volumes to be able to use data containers
VOLUME ["/var/lib/varnish", "/etc/varnish"]
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
