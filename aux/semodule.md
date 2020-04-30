# COMANDO: SEMODULE

Gestiona módulos de política de SELinux.

## Información

### Ejemplos

```
# Listar modulos de SELinux (añadimos | head para que se muestren los 10 primeros)

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
# Añadir un modulo

[root@localhost ~]# semodule -i [modulo]

# Habilitar un modulo

[root@localhost ~]# semodule -e [modulo]

# Deshabilitar un modulo

[root@localhost ~]# semodule -d [modulo]

# Eliminar un modulo: 

[root@localhost ~]# semodule -r [modulo]

```

