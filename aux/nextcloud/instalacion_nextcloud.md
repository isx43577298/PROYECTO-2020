# PASOS PARA INSTALAR NEXTCLOUD

- Ejecutaremos Nextcloud sobre LAMP Server. LAMP(Linux, Apache, MySQL/MariaDB y PHP) define la infraestructura de un servidor web.


## 1. Instalar el servidor LAMP

**1. Instalar el servidor web Apache**

```
dnf -y install httpd
```

**2. Iniciar el servidor web**

```
systemctl start httpd
systemctl enable httpd
```

**3. Instalar MySQL/MariaDB Server**

```
dnf -y install mariadb-server
```

**4. Iniciar MariaDB**

```
systemctl start mariadb
systemctl enable mariadb
```

**5. Ejecutar el script mysql_secure_installation para mejorar la seguridad de la instalación de MariaDB**

```
mysql_secure_installation
```

## 2. 

