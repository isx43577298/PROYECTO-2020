#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 28/05/2020
# Description: permite el acceso a LDAP utilizando la herramienta 
# gráfica PHPLDAPADMIN cuando SELinux opera en modo Enforcing
#########################################################################

# Problema LDAP ENFORCING

# 1. Cambiar SELinux a modo Enforcing y verificar
setenforce 1
getenforce

# 2. Verificar que el booleano que permite al servicio HTTPD el acceso a LDAP está inhabilitado
getsebool httpd_can_connect_ldap

# 3. Crear la carpeta /opt/docker y dentro los ficheros de instalación y configuración de LDAP y PHP
cd /opt/docker
pwd

# 4. Ejecutar el script startup.sh como root para poner en marcha LDAP y PHP
./startup.sh #en caso de error parar los servicios php-fmp y httpd

# 5. Verificar que LDAP funciona
ldapsearch -x -LLL | head -n15

# 6. Editar el fichero "/etc/hosts" de la máquina local
echo -e "192.168.122.112\tldapserver" >> /etc/hosts

# 7. Abrir un navegador en la máquina local, escribir la siguiente url y verificar que no se puede acceder
http://ldapserver/phpldapadmin

#########################################################################

# Solución LDAP ENFORCING

# 8. Habilitar el booleano que permite al servicio HTTPD el acceso a LDAP
setsebool httpd_can_connect_ldap on
getsebool httpd_can_connect_ldap

# 9. Abrir un navegador en la máquina local y escribir la siguiente url
http://ldapserver/phpldapadmin

# 10. Conectarse como Manager y como anónimo para verificar que SELinux permite el acceso a LDAP
# login: cn=Manager,dc=edt,dc=org
# password: secret

