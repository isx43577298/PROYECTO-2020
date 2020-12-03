# PROYECTO - Seguridad Avanzada: SELinux

+ Gustavo Tello Beltran
+ isx43577298

## ÍNDICE

+ [Documentación](#Documentación)
  + [Información básica](#Información-básica)
  + [Introducción](#Introducción-para-entender-mejor-SELinux)
  + [Arquitectura](#Arquitectura)
    + [Funcionamiento](#Como-funciona)
    + [Estructura](#Como-es-su-estructura:-MAC-VS-DAC)
      + [Modos de operación](#Modos-de-operación)
  + [Configuración](#Como-se-configura-y-que-ficheros-utiliza)
  + [Comandos](#Comandos)
+ [Proceso Práctico](#Proceso-Práctico)
  + [Creación de maquina virtual en KVM](#Máquina-KVM)
  + [Ejemplos prácticos](#Ejemplos-prácticos)

### Documentación

#### Información básica

SELinux (Security-Enhanced Linux) es una arquitectura de seguridad que viene integrado en el kernel Linux desde la version 2.6 que implementa módulos para mejorar la seguridad. Esta dirigida para administradores de servidores, quienes deben de implementar las políticas para otorgar o negar privilegios a un usuario sobre los objetos del sistema(archivos, puertos, sockets y otros procesos).

No reemplaza el modelo tradicional de seguridad de Linux y sirve como complemento para cubrir los puntos debiles que existen en el sistema, por esta razon es importante no deshabilitarlo.

#### Introducción para entender mejor SELinux

Tradicionalmente manejamos los típicos atributos rwx(read-write-execute) para permitir o negar el permiso a nuestros archivos, directorios y ejecutables, este módulo de seguridad se conoce como DAC(Control de Acceso Discrecional), ya que la asignación de permisos queda a criterio del propietario de los archivos o recursos. Pero SELinux utiliza el sistema MAC(Control de acceso obligatorio) basado en la interfaz LSM(Módulos de Seguridad de Linux), el núcleo pregunta a SELinux antes de cada llamada al sistema para saber si un proceso está autorizado a realizar una determinada operación.

SELinux utiliza una serie de reglas conocidas en conjunto como una política para autorizar o denegar operaciones. Se proporcionan dos políticas estándar targeted dirigida) y strict(estricta) para evitar gran parte del trabajo de configuración. Estas reglas van ligadas a las etiquetas que proporciona SELinux a todos los usuarios, procesos, archivos y directorios, estableciendo así una relación una relación entre este logrando establecer políticas con un acceso más específico.

<center>

![](../aux/presentacion/etiqueta.png)

</center>

El **nivel** es opcional y el **tipo** es el aspecto más importante de la **Política Específica**. El **usuario, rol y nivel** se utilizan en implementaciones más avanzadas de SELinux, como la **MLS**(Seguridad Multinivel).


#### Arquitectura

#### Como funciona

Las distribuciones GNU/Linux Fedora, Red Hat Enterprise Linux, CentOS y Scientific Linux incorporan SELinux habilitado por defecto a la hora de la instalación del sistema operativo.  
Una vez iniciado el sistema, SELinux realizará el etiquetado del disco duro. Consiste en asignar una etiqueta a cada objeto del sistema que irá asociada a una regla que permitirá o negará el acceso a un sujeto que pretenda acceder.

**Ejemplo de una regla**

<center>

![](../img/regla.png)

Regla que establece el puerto por el cual se puede acceder al servidor **SSHD**.

</center>

En el caso de que se quiera hacer un reetiquetado del sistema, se creará un fichero vacío llamado **.autorelabel** en el directorio raíz y después se reiniciará el sistema para que se inicie el reetiquetado.

Cuando un sujeto intenta acceder a un objeto SELinux utiliza la base de datos de las políticas para autorizar o denegar el acceso. En caso de que se deniegue el acceso se registra y se guarda en un log en el sistema en el fichero **/var/log/messages**.

<center>

![](../img/como_funciona_selinux.png)


Estas políticas se guardan en el fichero **/etc/selinux/targeted/policy/policy.[version]**

</center>

##### Ejemplo

El **usuario gustavo** intenta cambiar el puerto 22 por defecto del servidor SSHD, por ejemplo al puerto 2222. SELinux irá a buscar al base de datos de las políticas para verificar si existe una regla que permita abrir el puerto nuevo para el servidor.

En caso de que exista se permitirá el cambio, sino se negrá el cambio y se generará un mensaje de error al AVC(Caché de Control de Acceso) que contiene los permisos objeto y sujeto bajo control.

#### AVC Caché de Control de Acceso

Contiene los permisos objeto y sujeto bajo control. Es donde se generan los mensajes de error cuando una regla deniegue el acceso de un sujeto a un objeto.

<center>

![](../img/avc_denied.png)

</center>

**Partes del mensaje**  

+ **avc: denied**:	Se denegó una operación.
+ **{ read }**:	Esta operación necesita los permisos read y write.  
+ **pid=1484**:	El proceso con PID 1484 ejecutó la operación (o intentó hacerlo).
+ **comm="httpd"**:	Este proceso es una instancia del servidor httpd.
+ **name="myconf.conf"**:	El objeto de destino se llamaba myconf.conf. En ciertos casos también se puede tener una variable «path» con una ruta completa.
+ **dev=dm-0**:	El dispositivo que alberga el objeto destino es un dm-0, un dispositivo lógico LVM.
+ **ino=794975**:	El objeto está identificado por el número de inodo 794975.
+ **scontext=system_u:system_r:httpd_t:s0**:	Este es el contexto de seguridad del proceso que ejecutó la operación.
+ **tcontext=unconfined_u:object_r:user_home_t:s0**:	Este es el contexto de seguridad del objeto destino.
+ **tclass=file**:	El objeto destino es un archivo.
+ **permissive=0**: El modo de operación permissive está desactivado.

#### Como es su estructura: MAC VS DAC

Tradicionalmente, los sistemas Linux y UNIX utilizan DAC. SELinux es un ejemplo de un sistema MAC para Linux.

Con DAC, los archivos y los procesos tienen propietarios, que pueden ser usuarios, grupos o cualquier persona. Los usuarios pueden cambiar los permisos de sus propios archivos. Con un sistema DAC, el usuario raíz tiene control de acceso total. El acceso raíz le permite acceder a los archivos de cualquier otro usuario o ejecutar cualquier otra acción en el sistema.

Sin embargo, en los sistemas MAC, como SELinux, hay una política de acceso establecida a nivel administrativo. Incluso si se modifica la configuración del DAC en el directorio principal, la política de SELinux establecida protegerá el sistema e impedirá que otro usuario o proceso acceda al directorio. Las políticas de SELinux le permiten ser específico y abarcar una gran cantidad de procesos. Puede realizar modificaciones con SELinux para limitar el acceso entre usuarios, archivos, directorios y más.

##### Modos de operación

SELinux puede trabajar en tres modos de configuración:

1. **Disabled**: No carga el conjunto de políticas definidas y tampoco realiza el etiquetado de los objetos. No se recomienda utilizar este modo,ya que si más adelante se pretende activar SELinux, este puede caer en un estado de inconsistencia de las reglas y políticas en el caso de haber creado archivos, directorios, procesos o servicios instalados que no están etiquetados.

2. **Permissive**: Carga las políticas definidas y registra las acciones en el archivo log (depende la configuración), sin embargo, no realiza ninguna acción de denegación. Este modo se suele utilizar para diseñar y depurar políticas, pero no se recomienda para entornos de producción.

3. **Enforcing**: Carga las políticas definidas y permite o niega el acceso a objetos del sistema. Este es el modo que recomiendan para entornos de producción.

#### Como se configura y que ficheros utiliza

Hay muchas formas de configurar SELinux para proteger el sistema. Las más comunes son:

- **Política específica** : es la opción predeterminada y comprende una serie de procesos, tareas y servicios.
- **Seguridad de varios niveles (MLS)**: es muy compleja y, generalmente, solo la utilizan los organismo gubernamentales.

Para saber con qué configuración se ejecuta el sistema, basta con consultar el archivo **/etc/sysconfig/selinux**. El archivo contendrá una sección donde se indicará si SELinux se encuentra en modo enforcing, permissive o disabled, y qué política se debería cargar targeted, minimum o mls .

![](../img/etc_sysconfig_selinuxx.png)

1. **targeted**: todos los procesos están protegidos
2. **minimum**: solo los procesos seleccionados están protegidos.
3. **mls**: protección de seguridad multinivel.

**El archivo /etc/sysconfig/selinux contiene un enlace simbólico al archivo de configuración real, /etc/selinux/config.**

El directorio /etc/selinux/ es la ubicación principal para todos los archivos de políticas y también del archivo de configuración principal.

[Contenido del directorio /etc/selinux](../img/etc_selinux.png)


#### Comandos

[Comando seinfo](../aux/ordenes/seinfo.md)

[Comando getsebool/setsebool](../aux/ordenes/getsebool.md)

[Comando semodule](../aux/ordenes/semodule.md)

[Comando getenforce/setenforce](../aux/ordenes/getenforce.md)

[Comando semanage](../aux/ordenes/semanage.md)

[Comando sestatus](../aux/ordenes/sestatus.md)

[Comando chcon](../aux/ordenes/chcon.md)

[Comando restorecon](../aux/ordenes/restorecon.md)

[Comando getfacl](../aux/ordenes/getfacl.md)

### Proceso Práctico

#### Máquina KVM

Descarto crear un docker ya que no se puede manipular las políticas, los roles de los usuarios ni el modo de operación en el que trabaja SELinux.
El sistema de etiquetaje lo hace correctamente pero al manipular SELinux siempre salta el mensaje de que está en modo disabled.

Crearé una maquina virtual en KVM(Kernel-based Virtual Machine) con la imagen de un Fedora-29, que es el mismo que tengo en mi maquina local. Una vez instalada escojo la configuración por defecto de red de la máquina virtual, en este caso, NAT. Este modo permite a las máquinas virtuales conectarse hacia el exterior utilizando la IP del anfitrión, pero las máquinas exteriores, excepto el anfitrión, no pueden conectarse a la máquina virtual.

[Configuración de la red de la maquina virtual](../img/configuracion_red_mv.png)

[Comprobaciones de acceso](../aux/test.md)

#### Ejemplos prácticos

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

[Comprobaciones ejemplo 4](../aux/4-ejemplo.md)

**Ejemplo 5**

- LDAP y PHPLDAPADMIN
- Modo de operación de SELinux: **Enforcing**

En este ejemplo mostraré como SELinux niega el acceso a **LDAP** utilizando la herramienta de interfaz gráfica **PHPLDAPADMIN**, cuando SELinux opere en modo **Enforcing**.

[Comprobaciones ejemplo 5](../aux/5-ejemplo.md)


**Ejemplo 6**

- LDAP y PHPLDAPADMIN
- Modo de operación de SELinux: **Permissive**

En este ejemplo mostraré como SELinux permite el acceso a **LDAP** utilizando la herramienta de interfaz gráfica **PHPLDAPADMIN**, cuando SELinux opere en modo **Permissive**.

[Comprobaciones ejemplo 6](../aux/6-ejemplo.md)

**Ejemplo 7**

- Nextcloud y LDAP
- Modo de operacion de SELinux: **Enforcing**

En este ejemplo mostraré como SELinux no permite el acceso a **LDAP** utilizando el servidor **Nextcloud**, cuando SELinux opere en modo **Enforcing**.

[Comprobaciones ejemplo 7](../aux/7-ejemplo.md)


**Ejemplo 8**

- Wordpress
- Modo de operacion de SELinux: **Enforcing**

[...]

[Comprobaciones ejemplo 8](../aux/8-ejemplo.md)

**Ejemplo 9**

- Moddle
- Modo de operacion de SELinux: **Enforcing**

[...]

[Comprobaciones ejemplo 9](../aux/9-ejemplo.md)
