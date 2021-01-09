#! /bin/bash
# Gustavo Tello
# EDT M14 PROYECTO: SELINUX
# 28/05/2020
# Description: Ejemplo de manipulación de ACL's.
# Demostración de como actúan las reglas DAC y MAC mediante
# tres situaciones diferentes. 
# Reglas DAC: rwx (lectura-escritura-ejecución)
# Reglas MAC: ACL
########################################################################


# Ejemplo 1

# 1. Crear el fichero 1_ejemplo.txt con permisos de lectura y escritura para todos.
ls -l 1_ejemplo.txt

# 2. Asignar una ACL que solo permita al usuario maria la lectura del archivo. Verificar que se ha añadido correctamente la ACL.
setfacl -m 'u:maria:r' 1_ejemplo.txt
getfacl 1_ejemplo.txt

# 3. Comprobar que las ACL deniegan la escritura al usuario maria.
vim 1_ejemplo.txt

# 4. Borrar la ACL y comprobar que ahora el usuario maria puede editar el archivo.
setfacl -b 1_ejemplo.txt

########################################################################

# Ejemplo 2

# 1. Crear el fichero 2_ejemplo.txt con permisos de lectura y escritura para el propietario.
ls -l 2_ejemplo.txt

# 2. Asignar una ACL que permita al usuario maria la lectura y escritura del archivo. Verificar que se ha añadido correctamente la ACL.
setfacl -m 'u:maria:rw' 2_ejemplo.txt
getfacl 2_ejemplo.txt

# 3. Comprobar que las ACL permiten la lectura y escritura al usuario maria.
vim 2_ejemplo.txt

# 4. Comprobar que las ACL han añadido los permisos al fichero.
ls -l 2_ejemplo.txt

#########################################################################

# Ejemplo 3

# 1. Crear el fichero 3_ejemplo.txt con permisos de lectura y escritura para el propietario.
ls -l 3_ejemplo.txt

# 2. Asignar una ACL que solo permita al usuario gus la lectura del archivo. Verificar que se ha añadido correctamente la ACL.
setfacl -m 'u:gus:r' 3_ejemplo.txt
getfacl 3_ejemplo.txt

# 3. Comprobar que las ACL no actúa contra el propietario del fichero.
vim 3_ejemplo.txt










