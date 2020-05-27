# INSTALACIÓN Y CONFIGURACIÓN DE PHPLDAPADMIN

## PASOS A SEGUIR

**1. Instalar los paquetes necesarios**

```
dnf -y install phpldapadmin php-xml
```

**2. Crear los archivos necesarios para la configuración personalizada de PHPLDAPADMIN**

[config.php](./config.php)
[phpldapadmin.conf](./phpldapadmin.conf)

**3. Reemplazar los archivos de configuración por defecto por los archivos de configuración personalizados**

```
cp /opt/docker/phpldapadmin.conf /etc/httpd/conf.d/phpldapadmin.conf
cp /opt/docker/config.php  /etc/phpldapadmin/config.php
```

**4. Encender el servicio php-fpm**

```
systemctl start php-fpm
```

**5. Abrir un navegador y escribir la siguiente url "http://ldapserver/phpldapadmin**

![](../img/5_ejemplo/phpldapadmin.png)






