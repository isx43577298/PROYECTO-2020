# EJEMPLO 8

- Objetivo: Instalar Wordpress cuando esté activo el modo de operación **Enforcing** cambiando el contexto de seguridad de los archivos de configuración.

## Explicación



## Instalacion Nextcloud Server

[Instalación Wordpress](../aux/nextcloud/instalacion_wordpress.md)

## Configuración LDAP en Nextcloud

**1. Instalar el paquete php-ldap**

```
dnf -y install php-ldap
```

**2. Reinicar el servicio Apache**

```
systemctl restart httpd
```

**3. Iniciar sesión en Nextcloud con el usuario creado anteriormente en la instalación**

![](../img/7_ejemplo/nextcloud.png)

**4. Acceder al apartado de aplicaciones y activar LDAP user and group backend**

![](../img/7_ejemplo/aplicaciones.png)

**5. Acceder al apartado de configuración y posteriormente al subapartado Integración LDAP/AD donde se configurará el servidor LDAP**

![](../img/7_ejemplo/configuracion.png)

**6. Comprobar que no permite connectarse a LDAP aunque la configuración sea correcta**

![](../img/7_ejemplo/comprobacion.png)

**7. Permitir la connexión a LDAP**

![](../img/7_ejemplo/connexion.png)

**8. Comprobar que permite connectarse a LDAP y que puede leer los usuarios y grupos**

![](../img/7_ejemplo/servidor.png)
![](../img/7_ejemplo/usuarios.png)
![](../img/7_ejemplo/atributos.png)
![](../img/7_ejemplo/grupos.png)

**9. Acceder al apartado de usuarios y verificar que se han añadido los usuarios de LDAP**

![](../img/7_ejemplo/usuarios_ldap.png)

**10. Iniciar sesión con un usuario LDAP para comprobar la connexión entre Nextcloud Server y OpenLDAP**

![](../img/7_ejemplo/login_anna.png)
![](../img/7_ejemplo/anna_sesion.png)
