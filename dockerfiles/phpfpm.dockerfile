
# alpine:3.6
FROM alpine@sha256:d6bfc3baf615dc9618209a8d607ba2a8103d9c8a405b3bd8741d88b4bef36478

RUN apk add --no-cache \
    php7 \
    php7-curl \
    php7-dom \
    php7-fpm \
    php7-gmp \
    php7-json \
    php7-ldap \
    php7-mbstring \
    php7-openssl \
    php7-phar \
    php7-session \
    php7-xml \
    php7-zlib \
    wget

ENV SIMPLESAMLPHP_VERSION 1.14.17
ENV SIMPLESAMLPHP_CHECKSUM 4b67333ac210767f11991aa3df519ec371292fc7c3dda3f2ffbdba3162aba850
RUN wget -q https://github.com/simplesamlphp/simplesamlphp/releases/download/v$SIMPLESAMLPHP_VERSION/simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz && \
    echo "$SIMPLESAMLPHP_CHECKSUM  simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz" | sha256sum -c - && \
    tar -C /var -xz -f simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz && \
    mv /var/simplesamlphp-$SIMPLESAMLPHP_VERSION /var/simplesamlphp && \
    rm simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz 

ENV COMPOSER_VERSION 1.5.2
ENV COMPOSER_CHECKSUM c0a5519c768ef854913206d45bd360efc2eb4a3e6eb1e1c7d0a4b5e0d3bbb31f
RUN wget -q https://getcomposer.org/download/$COMPOSER_VERSION/composer.phar && \
    echo "$COMPOSER_CHECKSUM  composer.phar" | sha256sum -c - && \
    mv composer.phar /usr/bin/composer && \
    chmod +x /usr/bin/composer

RUN composer --working-dir=/var/simplesamlphp install --no-dev

RUN mkdir -p \
    /var/run/php7/

COPY configuration/php-fpm.conf /etc/php7/
COPY configuration/www.conf /etc/php7/php-fpm.d/

RUN chown -R nobody:nobody \
    /etc/php7/ \
    /var/log/php7/ \
    /var/run/php7/ \
    /var/simplesamlphp/

# Port nginx will forward connections to
EXPOSE 9000

# Run as unprivileged user
USER nobody

ENTRYPOINT ["/usr/sbin/php-fpm7"]
CMD ["--fpm-config", "/etc/php7/php-fpm.conf"]
