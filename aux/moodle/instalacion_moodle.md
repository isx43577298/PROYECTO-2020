# PASOS PARA INSTALAR MOODLE

- Ejecutaremos Moodle sobre LAMP Server. LAMP(Linux, Apache, MySQL/MariaDB y PHP) define la infraestructura de un servidor web.

## 1. Instalación del servidor LAMP

**Al tener el servidor LAMP instalado solo haremos los siguientes pasos**

**1. Crear un usuario y una base de datos para la instancia de Wordpress**

```
mysql -u root -p
 create database moodle;
 grant all on moodle.* to 'gusmoodle'@'localhost' identified by 'moodle';
 flush privileges;
 exit;
```

**2. Instalar módulos de PHP**

```
dnf -y install php-curl php-gd php-intl php-json php-mbstring php-opcache php-soap php-xml php-xmlrpc php-pecl-zip
```

**3. Reiniciar PHP**

```
systemctl restart php-fpm
```

## 2. Instalación Moodle

**1. Descargar Moodle en formato tar.gz**

```
wget https://download.moodle.org/download.php/direct/stable39/moodle-latest-39.tgz
```

**2. Descomprimir el fichero tar.gz**

```
tar xf moodle-latest-39.tgz -C /var/www/html/
```

**3. Cambiar el propietario al usuario Apache**

```
chown -R apache:apache /var/www/html/moodle
```

**4. Crear un directorio para los datos de Moodle**

```
mkdir /var/www/moodledata
```

**5. Cambiar el propietario al usuario Apache**

```
chown apache: /var/www/moodledata/
```

### 2.1. Configuración SELinux-Moodle

**1. Cambiar la etiqueta de la carpeta de instalación de Moodle**

```
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/moodle(/.*)?"
```

**2. Definir la etiqueta del paso anterior de manera permanente**

```
restorecon -R /var/www/html/moodle/
```

**3. Cambiar la etiqueta de la carpeta de datos de Moodle**

```
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/moodledata(/.*)?"
```

**4. Definir la etiqueta del paso anterior de manera permanente**

```
restorecon /var/www/moodledata/
```

**5. Para que el servidor web y PHP puedan realizar conexiones a Internet en busca de componentes de Moodle, activar el booleano httpd_can_network_connect**

```
setsebool -P httpd_can_network_connect on
```

## 3. Configuración Moodle

**1. Poner en el navegador la siguiente linea**

```
http://IPhost/moodle

# En mi caso:
http://192.168.122.112/moodle
```

**2. Comprobar que carga correctamente la pagina**

![](../../img/wordpress/moodle.png)

**3. Confirmar las rutas de Moodle**

![](../../img/wordpress/rutas.png)

**4. Escoger la Base de Datos adecuada**

![](../../img/wordpress/base_de_datos.png)

**5. Introducir los datos de conexión**

![](../../img/wordpress/ajuste_bd.png)

**6. Antes de comenzar con el proceso de instalación, aceptar los términos y condiciones del servicio**

![](../../img/wordpress/terminos.png)

**7. Verificar si cumplimos con todos los requisitos para realizar la instalación**

![](../../img/wordpress/requisitos.png)

![](../../img/wordpress/requisitos2.png)

**8. Configurar la información del administrador**

![](../../img/wordpress/info_general.png)

**9. Configurar la descripción de la página principal**

![](../../img/wordpress/descripcion.png)

**10. Verificar que podemos entrar directamente a nuestra área personal**

![](../../img/wordpress/area_personal.png)















