
# alpine:3.6
FROM alpine@sha256:d6bfc3baf615dc9618209a8d607ba2a8103d9c8a405b3bd8741d88b4bef36478

RUN apk add --no-cache \
    nginx

RUN mkdir -p \
    /var/run/nginx/

COPY configuration/nginx.conf /etc/nginx/

RUN chown -R nginx:nginx \
    /etc/nginx/ \
    /var/log/nginx/ \
    /var/run/nginx/

ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-c", "/etc/nginx/nginx.conf"]
