FROM php:7.3-apache-buster

ADD ext/ /ext
# Fix the original permissions of /tmp, the PHP default upload tmp dir.
RUN chmod 777 /tmp && chmod +t /tmp

# Install some packages that are useful within the images.
RUN apt-get update && apt-get install -y git texinfo && rm -rf /var/lib/apt/lists/*

# Setup the required extensions.
ARG DEBIAN_FRONTEND=noninteractive
RUN /ext/php-extensions.sh
RUN /ext/oci8-extension.sh
ENV LD_LIBRARY_PATH /usr/local/instantclient

RUN mkdir /var/www/moodledata && chown www-data /var/www/moodledata && \
    mkdir /var/www/phpunitdata && chown www-data /var/www/phpunitdata && \
    mkdir /var/www/behatdata && chown www-data /var/www/behatdata && \
    mkdir /var/www/behatfaildumps && chown www-data /var/www/behatfaildumps
