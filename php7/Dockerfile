FROM debian:jessie

RUN \
   apt-get update \
   && apt-get -y upgrade \
   && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            apt-transport-https \
            ca-certificates \
            wget \
   && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
   && echo "deb https://packages.sury.org/php/ jessie main" | tee /etc/apt/sources.list.d/php.list \
   && apt-get -y remove wget \
   && apt-get autoclean \
   && rm -rf /var/lib/apt/lists/*

RUN \
   apt-get update \
   && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            apache2  \
            php7.1 \
            php7.1-gd \
            php7.1-imap \
            php7.1-mysql \
            php7.1-mcrypt \
            php7.1-curl \
            php7.1-json \
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
