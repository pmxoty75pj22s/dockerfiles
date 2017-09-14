FROM debian:jessie

RUN \
   apt-get update \
   && apt-get -y upgrade \
   && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            ca-certificates \
            php5 \
            php5-gd \
            php5-imap \
            php5-mysqlnd \
            php5-mcrypt \
            php5-curl \
            php5-json \
            ssmtp \
            unzip \
   && apt-get autoclean \
   && rm -rf /var/lib/apt/lists/*

# composer install
# see https://getcomposer.org/download/
RUN \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=1.5.2 \
    && rm composer-setup.php

RUN \
   ln -sf /dev/stdout /var/log/apache2/access.log \
   && ln -sf /dev/stderr /var/log/apache2/error.log


ENV APACHE_CONFDIR=/etc/apache2
ENV APACHE_ENVVARS=$APACHE_CONFDIR/envvars
ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_RUN_DIR=/var/run/apache2
ENV APACHE_PID_FILE=$APACHE_RUN_DIR/apache2.pid
ENV APACHE_LOCK_DIR=/var/lock/apache2
ENV APACHE_LOG_DIR=/var/log/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

EXPOSE 80

CMD ["apache2", "-DFOREGROUND"]
