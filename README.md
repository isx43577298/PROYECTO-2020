# PROYECTO SELinux

+ Gustavo Tello Beltran
+ isx43577298

## INDEX

+ Documentación
  + Información básica
  + Como funciona y que estructura usa
  + Como se configura y que ficheros usa
  + Comandos que usa y para que sirven
+ Proceso Práctico
  + Creación de imagen docker
  + Implementación práctica 

### Informació sobre el proyecto

El proyecto consistirá en la explicación del módulo de seguridad para el kernel de Linux, llamado **SELinux**, que proporciona el mecanismo para soportat políticas de seguridad para el acceso a aplicaciones, procesos y archivos del sistema.

#### Documentación

##### Información básica: Que es SELinux?

SELinux (Security-Enchanced Linux) es una arquitectura de seguridad para los sistemas Linux. Fue inetgrado a la rama principal del núcleo de Linux desde la versión 2.6, el 8 de agosto de 2003.


##### Funcionamiento y estructura

SELinux define los controles de acceso para aplicaciones, los procesos y los archivos dentro de un sistema. Utiliza politicas de seguridad, un conjunto de reglas que indican a SELinux a que se puede acceder. Ejemplo:

1. Una aplicación o proceso (sujetos) solicitan acceso a un archivo (objeto).
2. SELinux consulta la caché de vector de accesos (AVC), donde se almacenan los permisos de los sujetos y objetos.

**En caso de que no pueda tomar una decision en funcion a los permisos almacenados en la cache, haría un tercer paso**

3. Envía una solicitud al server de seguridad, que analiza el contexto de seguridad, este se aplica desde la base de datos de politicas de SELinux y luego, se otorga o se niega el permiso.

Trabaja como sistema de etiquetado, significa que hay una etiqueta de SELinux asociada a cada archivo, proceso y puerto del sistema. Las etiquetas son un metodo logico para agrupar elementos, y el kernel las gestiona durante el proceso de arranque. Formato de las etiquetas "user:role:type:[level]", donde el level es opcional y el tipo es el aspecto más importante de la **politica especifíca**. El user, el role y el level se utilizan en implementaciones más avanzadas de SELinux, como la **MLS**.



##### Configuración

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




##### Comandos





#### Proceso Práctico


