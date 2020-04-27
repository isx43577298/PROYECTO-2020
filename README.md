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

+ 1. Una aplicación o proceso (sujetos) solicitan acceso a un archivo (objeto).
+ 2. SELinux consulta la caché de vector de accesos (AVC), donde se almacenan los permisos de los sujetos y objetos.

**En caso de que no pueda tomar una decision en funcion a los permisos almacenados en la cache, haría un tercer paso**

+ 3. Envía una solicitud al server de seguridad, que analiza el contexto de seguridad, este se aplica desde la base de datos de politicas de SELinux y luego, se otorga o se niega el permiso.




 






#### Proceso Práctico


