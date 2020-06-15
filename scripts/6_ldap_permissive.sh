#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 28/05/2020
# Description: permite el acceso a LDAP utilizando la herramineta 
# gráfica PHPLDAPADMIN cuando SELinux opera en modo Permissive
#########################################################################

# LDAP PERMISSIVE

# 1. Inhabilitar el booleano que permite al servicio HTTPD el acceso a LDAP
setsebool httpd_can_connect_ldap off
getsebool httpd_can_connect_ldap

# 2. Cambiar SELinux a modo de operación Permissive y verificar
setenforce 0
getenforce

# 3. Abrir un navegador en la máquina local y escribir la siguiente url
http://ldapserver/phpldapadmin

# 4. Conectarse como Manager y como anónimo para verificar que SELinux permite el acceso a LDAP
# login: cn=Manager,dc=edt,dc=org
# password: secret



