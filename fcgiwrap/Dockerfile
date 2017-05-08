FROM debian:jessie
RUN \
   apt-get update \
   && apt-get -y upgrade \
   && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            fcgiwrap \
            cpanminus \
            make \
            ssmtp \
            libcgi-PM-perl \
            imagemagick \
            perlmagick \
   && apt-get autoclean \
   && rm -rf /var/lib/apt/lists/*
RUN \
    cpanm \
       URI::Escape \
       MIME::Lite \
       Jcode;

RUN \
   groupmod -g 10001 www-data \
   && usermod -u 10001 www-data \
   && mkdir /var/run/fcgiwrap \
   && chown www-data:www-data /var/run/fcgiwrap

ADD ssmtp.conf /etc/ssmtp

ADD start.sh /usr/local/bin/
CMD ["start.sh"]
