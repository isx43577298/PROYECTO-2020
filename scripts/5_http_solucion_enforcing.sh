#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 28/05/2020
# Description: modifica la carpeta por defecto "var/www/html" del 
# servicio HTTPD y muestra los logs del propio servicio y del sistema
########################################################################


# Solución ejemplo 3

# 1. Cambiar el modo de operación de SELinux a Permissive y verificar
setenforce 0
getenforce

# 2. Comentar la linea "Include /home/gus/apache/myconf.conf" del fichero "etc/httpd/conf/httpd.conf"
sed -i "s/Include \/home\/gus\/apache\/myconf.conf"

# 6. Reinciar el servicio y comprobar que no funciona
systemctl restart httpd

# 7. Mirar los logs del servicio y del sistema
tail /var/log/messages
tail -n1 /var/log/httpd/error_log

# 8. Mirar las etiquetas de la carpeta por defecto del servicio "/var/www/html" y del fichero de configuración
ls -lZ /var/www/html
ls -lZ /etc/httpd/conf/httpd.conf

# 9. Mirar las etiquetas de nuestros ficheros
ls -lZ ~gus/apache/myconf.conf
ls -lZ ~gus/www/html/index.html

# 10. Cambiar las etiquetas de nuestros ficheros
chcon -R -t httpd_sys_content_t ~gus/www
chcon -R -t httpd_config_t ~gus/apache

# 11. Reiniciar el servicio y comprobar que funciona
systemctl start httpd
systemctl status httpd

# 12. Acceder a la máquina virtual a través de un telnet
telnet 192.168.122.112 80 # GET / HTTP/1.0

# 13. Mirar los logs del sistema
tail /var/log/messages






