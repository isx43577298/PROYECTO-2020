# EJEMPLO 1

- Objetivo: demostración del funcionamiento del modo de operación **Enforcing**

## Comprobaciones

**1. Comprobar en que modo de operación trabaja actualmente SELinux, en nuestro caso está en modo Enforcing**

![Sestatus](../img/sestatus_selinux.png)

**2. Buscamos el puerto en el que trabaja el servicio sshd**

![SSHD](../img/puertossh.png)

**3. Modificamos el puerto sshd manualmente por el puerto 2222**

![Puerto 2222](../img/puerto_2222.png)

**4. Reiniciamos el servicio y vemos que no nos lo permite**

![Fallo restart](../img/restart_sshd.png)
![Fallo journalctl](../img/journalctl_sshd.png)

**5. Dejamos el fichero /etc/ssh/sshd_config como estaba**

![Puerto 22](../img/puerto_22.png)

**6. Modificaremos la política del puerto del servicio sshd y añadiremos el puerto 2222**

![Politica puerto 2222](../img/añadir_puerto2222.png)

**7. Comprobamos que la política se ha añadido correctamente**

![Comprobación nueva politica](../img/nueva_politicassh.png)

**8. Intentamos eliminar la politica del puerto 22 del servicio ssh y vemos que no nos permite eliminar una política ya definida por defecto**

![Comprobacion borra politica definida por defecto](../img/comprobacion_borrar_politica.png)


**9. Reiniciamos el servicio y vemos que omite la política añadida. El servicio sshd sigue escuchando solo por el puerto 22**

![Omisión nueva política](../img/restart_ok.png)

**10. Intentamos acceder por el puerto 2222 desde nuestra máquina local hacia la máquina virtual para comprobar que el servicio no atiende por el puerto 2222**

![Comprobación final](../comprobacion_final)









