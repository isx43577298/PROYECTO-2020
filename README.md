# PROYECTO EDT 2020: SELinux

## Objetivo del proyecto

El objetivo del proyecto consistirá en la explicación del módulo de seguridad para el kernel de Linux, llamado **SELinux**, que proporciona el mecanismo para sopoertar políticas de seguridad para el accesos a aplicaciones, procesos, servicios y archivos del sistema. 

Además mostraremos las diferencias que hay entre sus modos de trabajo.

### Documentación y Prácticas

[Documentación y ejemplos del proyecto](./documentation/README.md)

### SELinux

+ Módulo de seguridad.
+ Realiza un sistema de etiquetaje a todos los objetos y así establece políticas a un acceso más específico.
+ Mediante reglas permite o no el acceso a los objetos.
+ Tiene 3 modos de operación: **Enforcing**,**Permissive**,**Disabled**.

### Conceptos importantes

**Control de Acceso Discrecional(DAC)**: Permisos tradicionales de los sistemas UNIX (Propietario-Grupo-Otros ; Lectura-Escritura-Ejecución)

**Control de Acceso Obligatorio(MAC)**: Conjunto de reglas que si una operación sobre un objeto está permitida o no.

**Control de Acceso Basado en Roles(RBAC)**: Mediante roles permite o no a cada usuario realizar diferentes acciones.

### Estructura del proyecto

+ Investigación sobre SELinux.
+ Estructura y funcionamiento de SELinux.
+ Configuración de los archivos de SELinux.
+ Demostración y explicación sobre los modos de operación de SELinux.

### Planning

[Planning del proyecto](./planificacion/horarios.md)








