#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 28/05/2020
# Description: modifica la directiva por defecto "/var/www/html" del
# servicio HTTPD y muestra el mensaje de error AVC
########################################################################


# Problema HTTPD ENFORCING

# 1. Cambiar el modo de operación de SELinux a Enforcing
setenforce 1
getenforce

# 2. Encender el servicio
systemctl start httpd

# 3. Crear un fichero index.html dentro de /var/www/html y conectarse a través de un telnet por el puerto 80 para verificar el acceso y que se puede ver el fichero
cat /var/www/html/index.html
telnet 192.168.122.112 80 # GET / HTTP/1.0

# 4. Crear la carpeta apache en el directorio home del usario gus y dentro el fichero de configuración personalizado myconf.conf
cd ~gus/apache
cat myconf.conf

# 4. Crear la carpeta "www/html" en el directorio home del usuario gus y dentro el fichero index.html
cd ~gus/www/html
cat index.html

# 5. Añadir "Include /home/gus/apache/myconf.conf" al final del fichero "etc/httpd/conf/httpd.conf" i comentar la linea "IncludeOptional conf.d/*.conf"
echo "Include /home/gus/apache/myconf.conf" >> /etc/httpd/conf/httpd.conf
vim /etc/httpd/conf/httpd.conf

# 6. Reinciar el servicio y comprobar que no funciona
systemctl restart httpd

# 7. Mirar los logs del sistema
tail /var/log/messages | grep AVC



################################################################################

# Solución HTTPD ENFORCING

# 8. Comparar las etiquetas del fichero index.html original y el personalizado
ls -lZ /var/www/html/index.html
ls -lZ ~gus/www/html/index.html

# 9. Comparar las etiquetas del fichero httpd.conf y el personalizado
ls -lZ /etc/httpd/conf/httpd.conf
ls -lZ ~gus/apache/myconf.conf

# 10. Cambiar las etiquetas de nuestros ficheros
chcon -R -t httpd_sys_content_t ~gus/www
chcon -R -t httpd_config_t ~gus/apache

# 11. Reiniciar el servicio y comprobar que funciona
systemctl restart httpd
systemctl status httpd

# 12. Acceder a la máquina virtual a través de un telnet
telnet 192.168.122.112 80 # GET / HTTP/1.0
