# COMANDO: CHCON

Herramienta que permite cambiar el contexto de seguridad de SELinux de archivos/directorios

## Ejemplos  

```
# Cambiar el tipo de un archivo o directorio en concreto
chcon -t [tipo] [archivo|directorio]

[root@localhost ~]# chcon -t httpd_sys_content html/myconf.conf
```

```
# Cambiar el tipo de un directorio y su contenido
chcon -R -t [tipo] [directorio]

[root@localhost ~]# chcon -R -t httpd_sys_content html/
```

