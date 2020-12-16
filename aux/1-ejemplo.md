# EJEMPLO 1

- Objetivo: Demostración del funcionamiento del modo de operación **Enforcing** utilizando el servicio **SSHD** y la orden de gestión **semanage**, que se utilizará para crear una regla que permitirá el cambio del puerto del servicio.

## Explicación

El modo Enforcing de SELinux sigue a raja tabla las reglas definidas en el sistema, en el caso de que queramos realizar una acción que no se encuentra en ninguna regla, SELinux nos negará el acceso.

En este caso realizaré pruebas con el servicio SSHD. Existe una regla que dicta que el servicio escuche por el puerto 22, al modificar el puerto por el 2222 SELinux negará el acceso porque no existe una regla que dicte esto.  

Para permitir el acceso por el puerto 2222 crearé una regla con el comando semanage que lo permita i así podremos conectarnos remotamente por el puerto nuevo.

### Comprobaciones

**1. Verificar que SELinux está en modo de operación Enforcing**

![Sestatus](../img/1_ejemplo/sestatus_selinuxx.png)

**2. Buscar la regla del puerto en el que trabaja el servicio SSHD**

![SSHD](../img/1_ejemplo/puertossh.png)

**3. Modificar el puerto del servicio manualmente por el puerto 2222 en el fichero de configuración del server /etc/ssh/sshd_config**

![Puerto 2222](../img/1_ejemplo/puerto_2222.png)

**4. Reiniciar el servicio y verificar que no lo permite porque la regla dicta que escuche solo por el puerto 22**

![Fallo restart](../img/1_ejemplo/restart_sshd.png)
![Fallo journalctl](../img/1_ejemplo/journalctl_sshd.png)

**5. Modificar la política del puerto y añado el puerto 2222. Verificar que se ha añadido correctamente la política**

![Comprobación nueva politica](../img/1_ejemplo/añadir_puerto2222.png)

**6. Reiniciar el servicio y verificar que ahora escucha por el puerto 2222**

![](../img/1_ejemplo/restart_puerto2222.png)

**7. Conectarse a la máquina virtual por el puerto 2222**

![](../img/1_ejemplo/1_connexion.png)
