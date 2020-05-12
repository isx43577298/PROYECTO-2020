# COMANDO: SEINFO

Es una herramienta de **información** de políticas de SELinux

## Información

De este comando destacaremos el uso de los roles y explicaremos los más comunes, aunque este solo sirva para informar.

Los roles de SELinux llevan el sufijo **_r**. Los roles más comunes en la mayoría de los sistemas con SELinux, son los siguientes:

- **user_r**: Rol de usuario básico. Este rol puede hacer la mayoría de las cosas que puede hacer un usuario de Linux que no sea UID 0.
- **staff_r**: Rol de usuario sin privilegios de administrador. Este rol es básicamente el mismo que user_r, pero está destinado para administradores.
- **sysadm_r**: Dispone de privilegios que permiten la ejecución de tareas administrativas del sistema.
- **secadm_r**: Tiene la capacidad de modificar la política SELinux y gestionar los controles SELinux.
- **system_r**: Los procesos en segundo plano y los daemons tienen este rol.
- **unconfined_r**: Está asociado a usuarios finales. Desde este rol se pueden usar diferentes tipos, los cuales tendrán más o menos privilegios dependiendo de las reglas que se le apliquen en cada caso.

**Para los usuarios de SELinux, se usa el sufijo _u.**

### Ejemplos

```
# Visualizar los users

[root@localhost ~]# seinfo -u

# Visualizar los types

[root@localhost ~]# seinfo -t

# Visualizar los roles

[root@localhost ~]# seinfo -r

# Visualizar los booleanos

[root@localhost ~]# seinfo -b

```

