# COMANDO: GETFACL Y SETFACL

Herramienta que permite establecer listas de control de acceso a archivos(**setfacl**) i que permite visualizar estas listas de control (**getfacl**)

## Ejemplos  

```
# Establecer que el usuario gus solo pueda ver el archivo maquina_virtual.txt aunque sus permisos DAC se lo permitan

[root@ldapserver tmp]# ll
total 4
-rw-rw-rw- 1 root root 28 oct 26 16:26 maquina_virtual.txt

[root@ldapserver tmp]# setfacl -m "u:gus:r" maquina_virtual.txt 
```


```
# Visualizar la lista de control de acceso del fichero maquina_virtual.txt

[root@ldapserver tmp]# getfacl maquina_virtual.txt 
# file: maquina_virtual.txt
# owner: root
# group: root
user::rw-
user:gus:r--
group::r--
mask::rw-
other::rw-
```

