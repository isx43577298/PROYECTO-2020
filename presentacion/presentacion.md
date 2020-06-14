### SELinux

![](../aux/presentacion/logo.png)

### Estructura

![](../aux/presentacion/esquema_selinux.png)

### Etiquetaje

- Sistema de etiquetado
- Formato de etiqueta

![](../aux/presentacion/etiqueta.png)

### Políticas

- Dos tipos de politicas: **Específica** y **Multinivel**
- Asociada a una etiqueta
- Se ejecutarán solo en el modo de operación Enforcing  

![](../aux/presentacion/politica.png)


### Tipos de Control

- Control de Acceso Discrecional(DAC)
- Control de Acceso Obligatorio(MAC)
  - MAC basado en etiquetas
  - Control de Acceso Basado en Roles(RBAC)  


### Modos de Operación

- Enforcing
- Permissive
- Disabled

### Es un firewall?

- NO!
- Diferencias SELinux vs Firewall

![](../aux/presentacion/firewall.png)

### Como lo tengo montado?

![](../aux/presentacion/esquema.png)

### Problema: Docker I

![](../aux/presentacion/eenforcing_disabled.png)

![](../aux/presentacion/eerrores.png)

### Problema: Docker II

![](../aux/presentacion/docker_service.png)

![](../aux/presentacion/docker_info.png)

### Solución: KVM

- Solución para implementar virtualización completa con Linux

![](../aux/presentacion/KVM-logo.jpg)
