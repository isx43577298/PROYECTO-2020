# EJEMPLO 1

- Objetivo: demostración del funcionamiento del modo de operación **Enforcing**

## Explicación

El modo Enforcing de SELinux sigue a raja tabla las reglas definidas en el sistema, en el caso de que queramos realizar una acción que no se encuentra en ninguna regla, SELinux nos negará el acceso. 

En este caso realizaremos pruebas con el servicio SSHD, donde hay una regla que dicta que el servicio escuche por el puerto 22, al modificar el puerto por el 2222 SELinux negará el acceso porque no existe esta regla. Para permitir el acceso por el puerto 2222 crearemos una regla con el comando semanage que dicte esto i así podremos conectarnos remotamente por dicho puerto.

### Comprobaciones

**1. Comprobar en que modo de operación trabaja actualmente SELinux, en nuestro caso está en modo Enforcing**

![Sestatus](../img/1_ejemplo/sestatus_selinuxx.png)

**2. Buscamos el puerto en el que trabaja el servicio sshd**

![SSHD](../img/1_ejemplo/puertossh.png)

**3. Modificamos el puerto sshd manualmente por el puerto 2222 en el ficher /etc/ssh/sshd_config**

![Puerto 2222](../img/1_ejemplo/puerto_2222.png)

**4. Reiniciamos el servicio y vemos que no nos lo permite porque la regla del puerto del servicio ssh hace que escuche solo por el puerto 22**

![Fallo restart](../img/1_ejemplo/restart_sshd.png)
![Fallo journalctl](../img/1_ejemplo/journalctl_sshd.png)

**5. Modificamos la politica del puerto ssh y añadimos el puerto 2222. Comprobamos tambien que se ha añadido correctamente la política**

![Comprobación nueva politica](../img/1_ejemplo/añadir_puerto2222.png)

**6. Reiniciamos el servicio sshd y vemos que ahora si escucha por el puerto 2222, ya que hemos creado una nueva regla**

![](../img/1_ejemplo/restart_puerto_2222.png)

**7. Nos conectamos a la máquina virtual por el puerto 2222 desde nuestra máquina local**

![](../img/1_ejemplo/1_connexion.png)










