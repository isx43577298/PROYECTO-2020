# COMANDO: GETENFORCE i SETENFORCE

- **Getenforce**: Obtiene el modo actual de SELinux
- **Setenforce**: Modifica el modo en que se ejecuta SELinux

## Ejemplos

```
# En mi caso lo tengo en modo Permissive

[root@localhost ~]# getenforce
Permissive
```

```
# Cambiar a modo Enforcing (al primer reinicio vuelve a su estado original)

[root@localhost ~]# setenforce 0

# Cambiar a modo Permissive (al primer reinicio vuelve a su estado original)

[root@localhost ~]# setenforce 1

# Cambiar a un modo permanente 

Editar la variable SELINUX= del fichero /etc/selinux/config y asignarle [enforcing|permissive|disabled].
```


