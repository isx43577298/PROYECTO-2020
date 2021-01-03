#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 25/05/2020
# Description: modifica el puerto SSHD actual(22) por uno nuevo(2222)
# y verifica si se ha podido realizar cuando SELinux se encuentre
# en modo de operación Permissive
####################################################

# SSHD PERMISSIVE

# 1. Cambiar SELinux a modo Permissive y comprobar
setenforce 0
getenforce

# 2. Eliminar la política creada en el ejemplo anterior y comprobar que se ha eliminado correctamente
semanage port -d -t ssh_port_t -p tcp 2222
semanage port -l | grep ssh

# 3. Comentar la linea Port 2222 del fichero de configuración
sed -i 's/Port 2222/#Port 22/g' /etc/ssh/sshd_config
grep "#Port 22" /etc/ssh/sshd_config

# 4. Reiniciar el servicio y comprobar que escucha por el puerto 22
systemctl restart sshd
systemctl status sshd

# 5. Conectarse a la máquina virtual por el puerto 22
ssh root@192.168.122.112
