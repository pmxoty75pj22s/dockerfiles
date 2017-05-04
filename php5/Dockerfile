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
   && apt-get autoclean \
   && rm -rf /var/lib/apt/lists/*

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
