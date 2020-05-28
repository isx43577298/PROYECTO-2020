#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 25/05/2020
# Description: modifica el puerto SSHD actual(22) por uno nuevo(2222)
# y verifica si se ha podido realizar cuando SELinux se encuentre
# en modo de operación Enforcing
####################################################3

# Solución ejemplo 1

# 6. Añadir el puerto 2222 a la política de puertos del servicio
semanage port -a -t ssh_port_t -p tcp 2222

# 7. Iniciar el servicio y verificar que ahora escucha por el puerto nuevo
systemctl start sshd
systemctl status sshd

# 8. Conectarse desde la máquina local a la virtual por el puerto 2222 del servicio
	# ssh -p 2222 root@192.168.122.112




