# PROYECTO SELinux

+ Gustavo Tello Beltran
+ isx43577298

## INDEX

+ [Documentación](#Documentación)
  + [Información básica](#Información-básica)
  + [Introducción](#Introducción-para-entender-mejor-SELinux)
  + [Arquitectura](#Arquitectura)
    + [Funcionamiento](#Como-funciona) 
    + [Estructura](#Como-es-su-estructura)
      + [Modos de operación](#Modos-de-operación) 
  + [Configuración](#Como-se-configura-y-que-ficheros-utiliza)
  + [Comandos](#Comandos)
+ [Proceso Práctico](#Proceso-Práctico)
  + [Creación de maquina virtual en KVM](#Maquina-KVM)
  + [Ejemplos practicos](#Ejemplos-rracticos)

### Documentación

#### Información básica

SELinux (Security-Enchanced Linux) es una arquitectura de seguridad para los sistemas Linux i forma parte del modelo de seguridad de Android . En Linux fue integrado a la rama principal del núcleo desde la versión 2.6, el 8 de agosto de 2003 i en Android de forma permamente a partir de la versión 5.0. 


#### Introducción para entender mejor SELinux

Tradicionalmente manejamos los tipicos atributos rwx(read-write-execute) para permitir o negar el permiso a nuestros archivos, directorios y ejecutables. Este modulo de seguridad se conoce como DAC(Control de Acceso Discrecional), ya que la asignación de permisos queda a criterio del proopietario de los archivos o recursos. Pero SELinux es diferente, implementa el modelo de seguridad MAC(Control de Acceso por Mandato). Este modelo utiliza RBAC(Control de Acceso Basado en Roles), es decir, a los usuarios se les otorga un rol en el sistema, en base a esto pueden realizar determinadas tareas sobre el control de acceso a los objetos.

La asignación de los permisos y el permitir o denegar la autorización para acceder a un recurso del sistema no depende del usuario sino de unas reglas programadas (politicas) de SELinux.

SELinux asigna una etiqueta a todo. Mediante el uso de estas, se establecen relaciones entre los usuarios, procesos, archivos y directorios, logrando establecer politicas a un acceso más específico.

```
# Formato de una etiqueta

user:role:type:level
```

El level es opcional y el type es el aspecto más importante de la **politica específica**. El user, el role y el level se utilizan en implementaciones más avanzadas de SELinux, como la **MLS**.


#### Arquitectura

#### Como funciona

SELinux utiliza la aplicación del tipo de etiqueta para aplicar cierta politica definida en el sistema, es decir, las politicas de SELinux definen si un proceso que se ejecuta con cierto tipo de etiqueta puede acceder a un archivo que tiene un determinado tipo de etiqueta.
En el caso de Centos, RedHat y Fedora el proceso de etiquetado se realiza desde el momento de la instal·lación y una vez que SELinux se ejecuta por primera vez . Por defecto ya existe un conjunto de políticas básicas predefinidas en el sistema, las cuales se aplican en el momento de arranque y durante el tiempo que el sistema se encuentre en funcionamiento.

Ejemplo:

1. Una aplicacion o proceso(sujetos) solicita acceso a un archivo(objeto)
2. SELinux consulta la caché de vector de acceso (AVC), donde se almacenan los permisos de los objetos y los sujetos

**En caso de que no pueda tomar una decision en funcion a los permisos almacenados en la cache, pasaría al paso 3**

3. Envía una solicitud al server de seguridad, que analiza el contexto de seguridad y luego, permite o niega el acceso.

#### Como es su estructura

SELinux es un LSM(Linux Security Modules), es decir, un **Modulo de Seguridad** de Linux y por lo tanto se encuentra integrado en el Kernel, de esta manera, obtiene acceso directo a todas ls operaciones a nivel de Seguridad.

**Las reglas DAC se aplican primero que las reglas de SELinux**

##### Modos de operación

SELinux puede trabajar en tres modos de configuración:

1. **Disabled**: No carga el conjunto de políticas definidas y tampoco realiza el etiquetado de los objetos. No se recomienda utilizar este modo,ya que si más adelante se pretende activar SELinux, este puede caer en un estado de inconsistencia de las reglas y políticas en el caso de haber creado archivos, directorios, procesos o servicios instalados que no están etiquetados.

2. **Permissive**: Carga las políticas definidas y registra las acciones en el archivo log (depende la configuración), sin embargo, no realiza ninguna acción de denegación. Este modo se suele utilizar para diseñar y depurar políticas, pero no se recomienda para entornos de producción.

3. **Enforcing**: Carga las políticas definidas y permite o niega el acceso a objetos del sistema. Este es el modo que recomiendan para entornos de producción.



#### Como se configura y que ficheros utiliza

Hay muchas formas de configurar SELinux para proteger el sistema. Las más comunes son:

- **Politica específica** : es la opcion predeterminada y comprende una serie de procesos, tareas y servicios.
- **Seguridad de varios niveles (MLS)**: es muy compleja y, generalmente, solo la utilizan los organismo gubernamentales.

Para saber con qué configuración se ejecuta el sistema, basta con consultar el archivo **/etc/sysconfig/selinux**. El archivo contendrá una sección donde se indicará si SELinux se encuentra en modo enforcing, permissive o disabled, y qué política se debería cargar targeted, minimum o mls .

[Ejemplo del fichero /etc/sysconfig/selinux](../img/etc_sysconfig_selinuxx.png)

1. **targeted**: todos los processos están protegidos
2. **minimum**: solo los procesos seleccionados están protegidos. 
3. **mls**: protección de seguridad multinivel.

**El archivo /etc/sysconfig/selinux contiene un enlace simbólico al archivo de configuración real, /etc/selinux/config.**

El directorio /etc/selinux/ es la ubicación principal para todos los archivos de políticas y también del archivo de configuración principal.

[Contenido del directorio /etc/selinux](../img/etc_selinux.png)


#### Comandos

[Comando seinfo](../aux/seinfo.md)

[Comando getsebool/setsebool](../aux/getsebool.md)

[Comando semodule](../aux/semodule.md)

[Comando getenforce/setenforce](../aux/getenforce.md)

[Comando semanage](../aux/semanage.md)

[Comando sestatus](../aux/sestatus.md)

[Comando chcon](../aux/chcon.md)

[Comando restorecon](../aux/restorecon.md)

### Proceso Práctico

#### Máquina KVM

Descarto crear un docker ya que no se puede manipular las políticas, los roles de los usuarios ni el modo de operación en el que trabaja SELinux.
El sistema de etiquetaje lo hace correctamente pero al manipular SELinux siempre salta el mensaje de que está en modo disabled.

Crearé una maquina virtual en KVM(Kernel-based Virtual Machine) con la imagen de un Fedora-29, que es el mismo que tengo en mi maquina local. Una vez instalada escojo la configuración por defecto de red de la máquina virtual, en este caso, NAT. Este modo permite a las máquinas virtuales conectarse hacia el exterior utilizando la IP del anfitrión, pero las máquinas exteriores, excepto el anfitrión, no pueden conectarse a la máquina virtual.

[Configuración de la red de la maquina virtual](../img/configuracion_red_mv.png)

[Comprobaciones de acceso](../aux/test.md)

#### Ejemplos Práctico

**Ejemplo 1**

- Servidor SSHD
- Modo de operación de SELinux: **Enforcing**

En este ejemplo demostraré como el modo de operación Enforcing permite o niega el acceso a objetos del sistema según las políticas definidas por defecto utilizando el servicio SSHD. 

[Comprobaciones ejemplo 1](../aux/1-ejemplo.md)


**Ejemplo 2**

- Servidor SSHD
- Modo de operación de SELinux: **Permissive**

En este ejemplo demostraré como el modo de operación Permissive solo registra las acciones denegadas pero las ejecuta igualmente utilizando el servicio SSHD.

[comprobaciones ejemplo 2](../aux/2-ejemplo.md)

**Ejemplo 3**

- Servidor Apache 
- Modo de operación de SELinux: **Enforcing**

En este ejemplo mostraré como encontrar en los logs cuando queremos que el servidor apache utilice un directorio virtual des de otro directorio que no sea el que tiene por defecto (/var/www/html) cuando SELinux esté operando en modo Enforcing

[comprobaciones ejemplo 3](../aux/3-ejemplo.md)

**Ejemplo 4**

- Servidor Apache
- Modo de operación de SELinux: **Permissive**

En este ejemplo mostraré como encontrar en los logs cuando queremos que el servidor apache utilice un directorio virtual des de otro directorio que no sea el que tiene por defecto (/var/www/html) cuando SELinux esté operando en modo Permissive

[comprobaciones ejemplo 4](../aux/4-ejemplo.md)







