#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 25/05/2020
# Description: modifica el puerto SSHD actual(22) por uno nuevo(2222)
# y verifica si se ha podido realizar cuando SELinux se encuentre
# en modo de operación Enforcing
#####################################################################

# Problema SSHD ENFORCING

# 1. Cambiar el modo de operación de SELinux a Enforcing y verificar
setenforce 1
getenforce

# 2. Buscar la regla del puerto en el que trabaja el servicio SSHD
semanage port -l | grep ssh

# 3. Modificar el puerto del servicio en el fichero de configuración del server
sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config

# 4. Verificar que se ha cambiado la linea correctamente
grep "Port 2222" /etc/ssh/sshd_config

# 5. Reiniciar el servicio y verificar que no es posible
systemctl restart sshd



########################################################################





# Solución SSHD ENFORCING

# 6. Añadir el puerto 2222 a la política de puertos del servicio
semanage port -a -t ssh_port_t -p tcp 2222

# 7. Comprobar que se ha añadido correctament
semanage port -l | grep ssh

# 8. Iniciar el servicio y verificar que ahora escucha por el puerto nuevo
systemctl restart sshd
systemctl status sshd

# 9. Conectarse desde la máquina local a la virtual por el puerto 2222 del servicio
ssh -p 2222 root@192.168.122.112




