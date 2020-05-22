# EJEMPLO 1

- Objetivo: demostración del funcionamiento del modo de operación **Enforcing** utilizando el servicio **SSHD**

## Explicación

El modo Enforcing de SELinux sigue a raja tabla las reglas definidas en el sistema, en el caso de que queramos realizar una acción que no se encuentra en ninguna regla, SELinux nos negará el acceso. 

En este caso realizaré pruebas con el servicio SSHD, existe una regla que dicta que el servicio escuche por el puerto 22, al modificar el puerto por el 2222 SELinux negará el acceso porque no existe una regla que dicte esto. Para permitir el acceso por el puerto 2222 crearé una regla con el comando semanage que lo permita i así podremos conectarnos remotamente por el puerto nuevo.

### Comprobaciones

**1. Compruebo que SELinux está en modo Enforcing**

![Sestatus](../img/1_ejemplo/sestatus_selinuxx.png)

**2. Busco la regla del puerto en el que trabaja el servicio SSHD**

![SSHD](../img/1_ejemplo/puertossh.png)

**3. Modifico el puerto del servicio manualmente por el puerto 2222 en el fichero de configuración del server /etc/ssh/sshd_config**

![Puerto 2222](../img/1_ejemplo/puerto_2222.png)

**4. Reinicio el servicio y compruebo que no me lo permite, porque la regla dicta que escuche solo por el puerto 22**

![Fallo restart](../img/1_ejemplo/restart_sshd.png)
![Fallo journalctl](../img/1_ejemplo/journalctl_sshd.png)

**5. Modifico la política del puerto y añado el puerto 2222. Compruebo tambien que se ha añadido correctamente la política**

![Comprobación nueva politica](../img/1_ejemplo/añadir_puerto2222.png)

**6. Reinicio el servicio y compruebo que ahora si escucha por el puerto 2222, ya que hemos creado una nueva regla**

![](../img/1_ejemplo/restart_puerto2222.png)

**7. Nos conectamos a la máquina virtual por el puerto 2222 desde nuestra máquina local**

![](../img/1_ejemplo/1_connexion.png)










