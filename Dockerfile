FROM php:8.0.8-cli-buster

ENV TZ=UTC

COPY files/php-ext.ini /usr/local/etc/php/conf.d/php-ext.ini

RUN DEBIAN_FRONTEND=noninteractive \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && mkdir /soft/ \
    # Error dir
    && mkdir /tmp/error/ \
    && chmod a+w /tmp/error/ \
    #
    && apt-get update \
    && apt-get --no-install-recommends -qq -y install vim aptitude \
    #
    INCLUDE(docker-php-extension.sh)
    INCLUDE(docker-pinba.sh)
    #
    && aptitude purge -y '?user-tag(forbuildonly)' \
    && docker-php-source delete \
    && apt-get -y remove aptitude python3 \
    && apt-get -y autoremove \
    && rm -rf /soft/ \
    && rm -rf /var/lib/apt/lists/*