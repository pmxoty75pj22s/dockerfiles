FROM debian:jessie
RUN \
   apt-get update \
   && apt-get -y upgrade \
   && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            ca-certificates \
            php5-fpm \
            php5-gd \
            php5-imap \
            php5-mysqlnd \
            php5-mcrypt \
            php5-curl \
            php5-json \
            ssmtp \
   && apt-get autoclean \
   && rm -rf /var/lib/apt/lists/*

ADD start.sh /usr/local/bin/
CMD ["start.sh"]
