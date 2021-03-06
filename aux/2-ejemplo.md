# COMPROBACIONES EJEMPLO 2

- Objetivo: demostración del funcionamiento del modo de operación **Permissive** utilizando el servicio **SSHD**.

## Explicación

El modo Permissive de SELinux no realiza ninguna acción de negación de acceso, solo las registra en los logs del sistema.

Utilizaré el mismo servicio que en el ejemplo 1, el **SSHD**. En este caso al cambiar el puerto por defecto (22) del servicio por uno nuevo (2222) SELinux no negará este cambio aunque no haya una regla definida y por lo tanto podré conectarme desde otra terminal remotamente por el puerto 2222.

### Comprobaciones

**1. Cambiar el modo de operación de SELinux a Permissive**

![](../img/2_ejemplo/cambiar_permissive.png)

**2. Editar manualmente el fichero /etc/ssh/sshd_config y cambiar el puerto por el 2222**

![](../img/2_ejemplo/puerto2222.png)

**3. Verificar que la regla del puerto del servicio hace que escuche por el puerto 22**

![](../img/2_ejemplo/regla_ssh_22.png)

**4. Reiniciar el servicio y verificar que escucha por el puerto 2222 y no por el 22 aunque así lo dicte la regla de SELinux**

![](../img/2_ejemplo/restart_sshd.png)

**5. Conectarse a la máquina virtual por el puerto nuevo**

![](../img/2_ejemplo/conexion_puerto2222.png)
