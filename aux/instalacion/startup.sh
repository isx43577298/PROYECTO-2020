#! /bin/bash

bash /opt/docker/install.sh
/sbin/slapd
systemctl start php-fpm
systemctl start httpd
