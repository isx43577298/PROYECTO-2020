# INSTALACIÓN Y CONFIGURACIÓN DE LDAP

## PASOS A SEGUIR

**1. Instalar los paquetes necesarios**

```
dnf -y install openldap-servers openldap-clients
```

**2. Crear los archivos necesarios para la configuración personalizada de LDAP**

[DB_CONFIG](./DB_CONFIG)  
[edt.org.ldif](./edt.org.ldif)  
[ldap.conf](ldap.conf)  
[slapd.conf](slapd.conf)  

**3. Reemplazar los archivos de configuración por defecto por los archivos de configuración personalizados y realizar inyección de datos a bajo nivel**

```
rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/ldap/*
cp /opt/docker/DB_CONFIG /var/lib/ldap/.
slaptest -f /opt/docker/slapd.conf -F /etc/openldap/slapd.d
slapadd -F /etc/openldap/slapd.d -l /opt/docker/edt.org.ldif
chown -R ldap.ldap /etc/openldap/slapd.d
chown -R ldap.ldap /var/lib/ldap
cp /opt/docker/ldap.conf /etc/openldap/.
```

**4. Encender el servicio slapd**

```
systemctl start slapd
```

**5. Comprobar que funciona correctamente**

![](../../img/5_ejemplo/ldpasearch.png)


