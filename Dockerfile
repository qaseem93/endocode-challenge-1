FROM php:7.4.9-apache

# Configure stuff
COPY ./vhost.conf /etc/apache2/sites-available/vhost.conf
RUN ln -s /etc/apache2/sites-available/vhost.conf /etc/apache2/sites-enabled/vhost.conf

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN a2enmod rewrite
RUN service apache2 restart


# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]