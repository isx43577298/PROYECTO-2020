# COMANDO: RESTORECON

Herramienta que restaura los contextos de seguridad predeterminados de SELinux de los archivos y directorios

## EJEMPLOS

```
# Restablecer el tipo predeterminado de un archivo o directorio en concreto
restorecon -v [archivo|directorio]

[root@localhost ~]# restorecon -v html/myconf.conf
```

```
# Restablecer el tipo predeterminado de un directorio y su contenido
restorecon -R -v [directorio]

[root@localhost ~]# restorecon -R -v html/
```




