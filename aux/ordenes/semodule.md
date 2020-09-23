# COMANDO: SEMODULE

Herramienta que gestiona módulos de política de SELinux.

## Ejemplos

```
# Listar módulos de SELinux (añadimos | head para que se muestren los 10 primeros)

[root@localhost ~]# semodule -l | head
abrt
accountsd
acct
afs
aiccu
aide
ajaxterm
alsa
amanda
amtu

```

```
# Añadir un módulo

[root@localhost ~]# semodule -i [módulo]

# Habilitar un módulo

[root@localhost ~]# semodule -e [módulo]

# Deshabilitar un módulo

[root@localhost ~]# semodule -d [módulo]

# Eliminar un módulo: 

[root@localhost ~]# semodule -r [módulo]

```

