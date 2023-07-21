FROM php:8.2-fpm

# https://simplesamlphp.org/docs/stable/simplesamlphp-install.html#prerequisites
# Note, all other modules are already installed (see 'php -m')
RUN apt update && apt install -y \
        libicu-dev \
        wget \
    && docker-php-ext-install \
        intl

ENV SIMPLESAMLPHP_VERSION 2.0.4
ENV SIMPLESAMLPHP_CHECKSUM 10f50ae5165b044cd4c78de3c118a025ecf47586e428f16b340933f9d44ab52c
RUN wget -q https://github.com/simplesamlphp/simplesamlphp/releases/download/v$SIMPLESAMLPHP_VERSION/simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz && \
    echo "$SIMPLESAMLPHP_CHECKSUM  simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz" | sha256sum -c - && \
    tar -C /var -xz -f simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz && \
    mv /var/simplesamlphp-$SIMPLESAMLPHP_VERSION /var/simplesamlphp && \
    rm simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz

RUN mkdir /var/simplesamlphp/log/
RUN chown -R nobody /var/simplesamlphp/log/

USER nobody

# Port nginx will forward connections to
EXPOSE 9000
