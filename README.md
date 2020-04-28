# PROYECTO SELinux

+ Gustavo Tello Beltran
+ isx43577298

## INDEX

+ Información sobre el proyecto
+ Documentación
  + Información básica
  + Introducción
  + Arquitectura
    + Como funciona
    + Que estructura usa
  + Configuración
  + Comandos
+ Proceso Práctico
  + Creación de imagen docker
  + Implementación práctica 

### Informació sobre el proyecto

El proyecto consistirá en la explicación del módulo de seguridad para el kernel de Linux, llamado **SELinux**, que proporciona el mecanismo para soportat políticas de seguridad para el acceso a aplicaciones, procesos y archivos del sistema.

### Documentación

#### Información básica: Definición de SELinux

SELinux (Security-Enchanced Linux) es una arquitectura de seguridad para los sistemas Linux. Fue integrado a la rama principal del núcleo de Linux desde la versión 2.6, el 8 de agosto de 2003.


#### Introducción para entender mejor SELinux

Tradicionalmente manejamos los tipicos atributos rwx(read-write-execute) para permitir o negar el permiso a nuestros archivos, directorios y ejecutables. Este modulo de seguridad se conoce como DAC(Control de Acceso Discrecional), ya que la asignación de permisos queda a criterio del proopietario de los archivos o recursos. Pero SELinux es diferente, implementa el modelo de seguridad MAC(Control de Acceso por Mandato). Este modelo utiliza RBAC(Control de Acceso Basado en Roles), es decir, a los usuarios se les otorga un rol en el sistema, en base a esto pueden realizar determinadas tareas sobre el control de acceso a los objetos.

La asignación de los permisos y el permitir o denegar la autorización para acceder a un recurso del sistema no depende del usuario sino de unas reglas programadas (politicas) de SELinux.

SELinux asigna una etiqueta a todo. Mediante el uso de estas, se establecen relaciones entre los usuarios, procesos, archivos y directorios, logrando establecer politicas a un acceso más específico.

```
# Formato de una etiqueta

user:role:type:level
```

El level es opcional y el tipo es el aspecto más importante de la **politica específica**. El user, el role y el level se utilizan en implementaciones más avanzadas de SELinux, como la **MLS**.




#### Arquitectura

#### Como funciona

SELinux utiliza la aplicación del tipo de etiqueta para aplicar cierta politica definida en el sistema, es decir, las politicas de SELinux definen si un proceso que se ejecuta con cierto tipo de etiqueta puede acceder a un archivo que tiene un determinado tipo de etiqueta.
El proceso de etiquetado se realiza desde el momento de la instal·lación y una vez que SELinux se ejecuta por primera vez. Por defecto ya existe un conjunto de políticas básicas predefinidas en el sistema, las cuales se aplican en el momento de arranque y durante el tiempo que el sistema se encuentre en funcionamiento.

Ejemplo:

1. Una aplicacion o proceso(sujetos) solicita acceso a un archivo(objeto)
2. SELinux consulta la caché de vector de acceso (AVC), donde se almacenan los permisos de los objetos y los sujetos

**En caso de que no pueda tomar una decision en funcion a los permisos almacenados en la cache, pasaría al paso 3**

3. Envía una solicitud al server de seguridad, que analiza el contexto de seguridad y luego, permite o niega el acceso.

#### Arquitectura

SELinux es un LSM(Linux Security Modules), es decir, un **Modulo de Seguridad** de Linux y por lo tanto se encuentra integrado en el Kernel, de esta manera, obtiene acceso directo a todas ls operaciones a nivel de Seguridad.

**Las reglas DAC se aplican primero que las reglas de SELinux**




#### Como se configura y que ficheros usa

Hay muchas formas de configurar SELinux para proteger el sistema. Las más comunes son:

- **Politica específica** : es la opcion predeterminada y comprende una serie de procesos, tares y servicios.
- **Seguridad de varios niveles (MLS)**: es muy compleja y, generalmente, solo la utilizan los organismo gubernamentales

Para saber con qué configuración se ejecuta el sistema, basta con consultar el archivo **/etc/sysconfig/selinux**. El archivo contendrá una sección donde se indicará si SELinux se encuentra en modo enforcing, permissive o disabled, y qué política se debería cargar targeted, minimum o mls .

[Ejemplo del fichero selinux](./img/etc_sysconfig_selinuxx.png)

- **enforcing**: comprueba las reglas y hace que se cumplan forzosamente
- **permissive**: solamente deja registro de las reglas que no se han cumplido
- **disabled**: SELinux deshabilitado

- **targeted**: todos los processos están protegidos
- **minimum**: solo los procesos seleccionados están protegidos. 
- **mls**: protección de seguridad multinivel.




#### Comandos





### Proceso Práctico


