#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 25/05/2020
# Description: modifica el puerto SSHD actual(22) por uno nuevo(2222)
# y verifica si se ha podido realizar cuando SELinux se encuentre
# en modo de operación Enforcing
####################################################3

# Problema ejemplo 1

# 1. Verificar que SELinux está en modo enforcing
	# getenforce

# 2. Buscar la regla del puerto en el que trabaja el servicio SSHD
	# semanage port -l | grep ssh

# 3. Modificar el puerto del servicio en el fichero de configuración del server
sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config

# 4. Verificar que se ha cambiado la linea correctamente
grep "Port 2222" /etc/ssh/sshd_config

# 5. Encender el servicio y verificar que no es posible
systemctl start sshd






