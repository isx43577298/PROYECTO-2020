# COMANDO: SEMANAGE

Herramienta de gestión de políticas de SELinux

## Información

Se usa para configurar ciertos elementos de la política de SELinux sin requerir modificaciones o recompilación de las fuentes de políticas.

Esto incluye la asignación de nombres de usuario de Linux a las identidades de usuario de SELinux, así como las asignaciones de contexto de seguridad para varios tipos de objetos, como los roles de los usarios, los booleanos, los modulos y los puertos.
 

## Ejemplos

```
# Lista definiciones de tipos de puerto de red

[root@localhost ~]# semanage port -l 

# Lista los booleanos inactivos y activos

[root@localhost ~]# semanage boolean -l

# Lista los usuarios de SELinux y sus roles

[root@localhost ~]# semanage user -l

# Lista los modulos

[root@localhost ~]# semanage module -l

# Politica que hace que el servicio ssh escuche por el puerto 2222

[root@localhost ~]# semanage port -a -t ssh_port_t -p tcp 2222 

```
