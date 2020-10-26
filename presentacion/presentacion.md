### SELinux

![](../aux/presentacion/logo.png)

### Que es?

- Security Enhaced Linux
- Modulo de seguridad de Linux

### Como funciona?

![](../aux/presentacion/esquema_selinuxx.png)

### Sistema de etiquetado

- Se realiza desde el momento de la instalación del sistema operativo
- Una etiqueta siempre va asociada a un objeto
- Formato de etiqueta

![](../aux/presentacion/etiqueta.png)

### Políticas y Reglas I: Tipos

- Dos tipos de políticas: **Específica** y **Multinivel**
- Las reglas solo negarán el acceso en el modo de operación Enforcing  
- Una regla siempre va asociada a una etiqueta

![](../aux/presentacion/politica.png)

### Políticas y Reglas II: Como se gestionan



### Modos de Control y Operación I: Tipos de Control

- Control de Acceso Discrecional(DAC)
- SELinux:
  - Control de Acceso Obligatorio(MAC)
    - (MAC) basado en etiquetas
    - Control de Acceso Basado en Roles(RBAC)

### Modos de Control y Operación II: DAC vs MAC

- **DAC**
 - Se basa en propietarios y grupos
 - Es discrecional
 - Se gestionan los permisos con el comando **chmod**

- **MAC**
 - Se basa en políticas
 - No es discrecional
 - Se gestionan las reglas con el comando **semanage**


### Modos de Control y Operación III: Modos de Operación

- **Enforcing:** Permite o niega el acceso a objetos guiándose por las reglas definidas por defecto
- **Permissive:** No realiza ninguna acción de denegación, solo registra las acciones no permitidas en los logs del sistema
- **Disabled:** No se recomienda utilizar este modo si luego queremos activar SELinux

- Para poder visualizar el modo de operación en el que trabajamos podemos usar **getenforce** o **sestatus** si queremos más información. Para cambiar de modo de operación usaremos **setenforce**

### SELinux vs Firewall

- No es un firewall
- Se puede considerar complementario a un firewall
- Diferencias

![](../aux/presentacion/firewall.png)


### Estructura proyecto: Problema Docker I

![](../aux/presentacion/eenforcing_disabled.png)

![](../aux/presentacion/eerrores.png)

### Estructura proyecto: Problema Docker II

![](../aux/presentacion/docker_service.png)

![](../aux/presentacion/docker_info.png)

### Estructura proyecto: Solución KVM

- Solución para implementar virtualización completa con Linux

![](../aux/presentacion/KVM-logo.jpg)

### Estructura proyecto: Como lo tengo montado?

![](../aux/presentacion/esquema.png)

### Y eso es todo!

![](../aux/presentacion/preguntas.jpg)
