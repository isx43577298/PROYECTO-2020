# EJEMPLO 10

- Objetivo: Demostrar el funcionamiento de las ACL's mediante sus ordenes de gestión: **getfacl** y **setfactl**.

## Explicación

En este ejemplo tenemos tres situaciones en las que las reglas DAC y MAC actúan de manera diferente dependiendo de los permisos y el sujeto que actua sobre un objeto.

Recordemos que las reglas DAC actúan primero, en caso de que estas permitan el acceso se mirarán posteriormente las MAC para ver si estas deniegan el acceso.


## Situación 1

1. Tenemos un archivo llamado hola.txt en el directorio home del usuario gus el cual es el propietario con los siguientes permisos:

![](../img/10_ejemplo/hola_txt.png)

2. Asignamos una ACL que solo permita al usuario maria leer el archivo.

![](../img/10_ejemplo/acll.png)

3. Comprobamos que las ACL actúan denegando la escritura al usuario maria.

![](../img/10_ejemplo/lectura.png)


## Situación 2

1. Tenemos un archivo llamado adios.txt en el directorio home del usuario gus el cual es el propietario con los siguientes permisos:

![](../img/10_ejemplo/adios.png)

2. Asignamos una ACL que solo permita al usuario maria leer, editar y ejecutar el archivo.

![](../img/10_ejemplo/maria_rw.png)

3. Comprobamos que las ACL actúan y permite la lectura y escritura al usuario maria.

![](../img/10_ejemplo/situacion_2.png)

**Si se añaden ACL permitiendo a un sujeto acceder a un objeto aunque las reglas DAC digan lo contrario se permitirá el acceso**


## Situación 3
