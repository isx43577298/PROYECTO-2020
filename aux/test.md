# COMPROBACIÓN DE ACCESO A LA MÁQUINA VIRTUAL DESDE MI HOST LOCAL

## Estructura

- IP máquina virtual: 192.168.122.112
- IP host local: 192.168.0.12

### Comprobación

**1. Creo un fichero senzillo en la maquina virtual, solo para comprobar que al conectarnos via ssh estamos en ella**

![Fichero maquina](../img/fichero_maquina.png)

**2. Enciendo el servicio sshd para conectarme remotamente desde el host local**

![Encender sshd](../img/servicio_sshd.png)

**3. Me conecto via ssh desde el host local a la maquina virtual**

![Connexión a la máquina virtual](../img/comprobacion_acceso_mv.png)

**4. Compruebo que la máquina virtual tiene acceso al host local(anfitrión)**

![Connexión a mi host local](../img/comprobacion_acceso_hl.png)


