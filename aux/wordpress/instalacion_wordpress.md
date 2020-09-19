# PASOS PARA INSTALAR WORDPRESS

- Ejecutaremos Wordpress sobre LAMP Server. LAMP(Linux, Apache, MySQL/MariaDB y PHP) define la infraestructura de un servidor web.

## 1. Instalación del servidor LAMP

**Al tener el servidor LAMP instalado solo haremos los siguientes pasos**

**1. Crear un usuario y una base de datos para la instancia de Wordpress**

```
mysql -u root
 create database wp_db;
 grant all on wp_db.* to 'wp_gustavo'@'localhost' identified by 'wordpress';
 flush privileges;
 exit;
```

**2. Instalar módulos de PHP**

```
dnf -y install php-bcmath php-gd php-json php-mbstring php-pecl-imagick php-pecl-zip php-xml
```

**3. Reiniciar PHP**

```
systemctl restart php-fpm
```

## 2. Instalación de Wordpress

**1. Descargamos Wordpress en formato tar.gz**

```
wget https://es.wordpress.org/latest-es_ES.tar.gz
```

**2. 


