# COMANDO: GETSEBOOL i SETSEBOOL

- **Getsebool**: Muestra todos los booleanos, tanto los activos(on) como los inactivos(off)
- **Setsebool**: Manipula el estado de los booleanos


## Información

Los booleanos son valores concretos de las políticas SELinux. Son útiles para modificar elementos o acciones en tiempo de ejecución sin tener que manipular una política definida.

```
# Visualizar los booleanos (añadimos | head para que nos muestre solo los 10 primeros)

[root@localhost ~]# getsebool -a | head
abrt_anon_write --> off
abrt_handle_event --> off
abrt_upload_watch_anon_write --> on
antivirus_can_scan_system --> off
antivirus_use_jit --> off
auditadm_exec_content --> on
authlogin_nsswitch_use_ldap --> off
authlogin_radius --> off
authlogin_yubikey --> off
awstats_purge_apache_log_files --> off

```

En el siguiente ejemplo podemos ver como cambiar el booleano **ftpd_anon_write** al valor "on" lo que concede permiso de escritura ftp al usuario anónimo.

```
# 1. Miramos que en que estado se encuentra
[root@localhost ~]# getsebool ftpd_anon_write
ftpd_anon_write --> off

# 2. Con la orden setsebool lo activamos "on"
[root@localhost ~]# setsebool ftpd_anon_write on

# 3. Comprobamos que lo hemos activado
[root@localhost ~]# getsebool ftpd_anon_write
ftpd_anon_write --> on

# 4. Lo volvemos a desactivar por cuestiones de seguridad
[root@localhost ~]# setsebool ftpd_anon_write off
[root@localhost ~]# getsebool ftpd_anon_write
ftpd_anon_write --> off

```



