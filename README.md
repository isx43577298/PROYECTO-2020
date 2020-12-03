# PROYECTO EDT 2020: SELinux

## Objetivo del proyecto

El objetivo del proyecto consistirá en la explicación del módulo de seguridad para el kernel de Linux, llamado **SELinux**, una arquitectura de seguridad que viene integrado en el kernel Linux que implementa módulos para mejorar la seguridad del sistema. 

### Documentación y Prácticas

[Documentación y ejemplos del proyecto](./documentation/README.md)

### SELinux

+ Módulo de seguridad.
+ Realiza un sistema de etiquetaje a todos los objetos y así establece políticas a un acceso más específico.
+ Mediante reglas permite o no el acceso a los objetos.
+ Tiene 3 modos de operación: **Enforcing**,**Permissive**,**Disabled**.
+ Utiliza un **Control de Acceso Obligatorio**.

### Conceptos importantes

**Control de Acceso Discrecional(DAC)**: Permisos tradicionales de los sistemas UNIX (Propietario-Grupo-Otros ; Lectura-Escritura-Ejecución)
**Control de Acceso Obligatorio(MAC)**: Conjunto de reglas que permite o no una operación sobre un objeto.
**Control de Acceso Basado en Roles(RBAC)**: Mediante roles permite o no a cada usuario realizar diferentes acciones.

### Estructura del proyecto

+ Investigación sobre SELinux.
+ Estructura y funcionamiento de SELinux.
+ Configuración de los archivos de SELinux.
+ Demostración y explicación sobre el comportamiento de los modos de trabajo.

### Planning

[Planning del proyecto](./planificacion/planning.md)








