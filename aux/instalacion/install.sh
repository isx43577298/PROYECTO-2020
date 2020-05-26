#! /bin/bash
# Install ldap server

############# LDAP ################################################
rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/ldap/*
cp /opt/docker/DB_CONFIG /var/lib/ldap/.
slaptest -f /opt/docker/slapd.conf -F /etc/openldap/slapd.d
slapadd -F /etc/openldap/slapd.d -l /opt/docker/edt.org.ldif
chown -R ldap.ldap /etc/openldap/slapd.d
chown -R ldap.ldap /var/lib/ldap
cp /opt/docker/ldap.conf /etc/openldap/.
######## PHPLDAPADMIN ##############################################
cp /opt/docker/phpldapadmin.conf /etc/httpd/conf.d/phpldapadmin.conf
cp /opt/docker/config.php  /etc/phpldapadmin/config.php
