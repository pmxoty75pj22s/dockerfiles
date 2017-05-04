#!/bin/sh
groupmod -g 10001 www-data
usermod -u 10001 www-data
mkdir -p /var/run/php5-fpm
chown www-data. /var/run/php5-fpm
cat <<EOM > /etc/php5/fpm/pool.d/www.conf
[www]
user = www-data
group = www-data
listen = /var/run/php5-fpm/php5-fpm.sock
listen.owner = www-data
listen.group = www-data
listen.mode = 666
pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3
chdir = /
EOM
cat <<EOM >/etc/php5/fpm/pool.d/docker.conf
[global]
error_log = /proc/self/fd/2

[www]
clear_env = no
catch_workers_output = yes
EOM
cat <<EOM > /etc/php5/fpm/pool.d/zz-docker.conf
[global]
daemonize = no
EOM
exec php5-fpm
