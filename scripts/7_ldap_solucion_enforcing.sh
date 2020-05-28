#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 28/05/2020
# Description: permite el acceso a LDAP utilizando la herramineta 
# gráfica PHPLDAPADMIN cuando SELinux opera en modo Enforcing
#########################################################################

# Solución ejemplo 4

# 1. Habilitar el booleano que permite al servicio HTTPD el acceso a LDAP
setsebool httpd_can_connect_ldap on
getsebool httpd_can_connect_ldap

# 2. Abrir un navegador en la máquina local y escribir la siguiente url
http://ldapserver/phpldapadmin

# 3. Conectarse como Manager y como anónimo para verificar que SELinux permite el acceso a LDAP
# login: cn=Manager,dc=edt,dc=org
# password: secret



