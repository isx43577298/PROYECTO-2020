# EJEMPLO 3

- Objetivo: Mostrar los errores log del servidor apache y cambiar el directorio por defecto "/var/www/html" por uno propio en modo Enforcing.

### Explicación

Como en los ejemplos 1 y 2 mostraremos los problemas que da el modo Enforcing a la hora de manipular servicios, en este caso usaremos el servicio Apache HTTP.

Además mostraremos los registros de log del servicio HTTPD de la carpeta /var/log/httpd y de los registros del sistema a través del servicio rsyslog que aloja a estos en el fichero /var/log/messages



## COMPROBACIONES

### Modo enforcing

**1.Verificamos que estamos en modo enforcing**

![](../img/3_ejemplo/enforcing.png)


**2. Creamos la carpeta apache en el directorio home del usuario gus y dentro el fichero de configuracón myconf.conf que simulará al fichero de configuración real del servicio apache /etc/httpd/conf/httpd.conf**

![](../img/3_ejemplo/carpeta_apache.png) 
![](../img/3_ejemplo/myconf.png) 


**3. Creamos la carpeta /www/html en el directorio home del usuario gus que será la nueva carpeta por defecto del servicio apache y dentro el fichero index.html**

![](../img/3_ejemplo/.png)
![](../img/3_ejemplo/.png)

**4. Editamos el fichero /etc/httpd/conf/httpd.conf y comentamos la ultima linea del fichero, después, añadimos Include /home/gus/apache/myconf.conf donde cargaremos nuestra propia configuración**

![](../img/3_ejemplo/.png)
![](../img/3_ejemplo/.png)

**5. Reiniciamos el servicio httpd y vemos que no nos lo permite ya que si SELinux está en modo enforcing no permite cambiar el directorio por defecto**

![](../img/3_ejemplo/.png)



