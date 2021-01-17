#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 28/05/2020
# Description: modifica la carpeta por defecto "/var/www/html" del
# servicio HTTPD y muestra los logs del propio servicio y del sistema
########################################################################


# HTTPD Permissive

# 1. Cambiar el modo de operación de SELinux a Permissive y verificar
setenforce 0
getenforce

# 2. Restablecer las etiquetas por defecto de la carpeta apache y www que están en el directorio home del usuario gus
restorecon -R -v ~gus/apache/
restorecon -R -v ~gus/www/

# 3. Comprobar
ls -lZ ~gus/www/html/index.html
ls -lZ ~gus/apache/myconf.conf

# 4. Reiniciar el servicio y comprobar que funciona
systemctl restart httpd
systemctl status httpd

# 5. Acceder a la máquina virtual a través de un telnet
telnet 192.168.122.112 80 # GET / HTTP/1.0

# 6. Mirar los logs del sistema
tail -n1 /var/log/messages | grep AVC

