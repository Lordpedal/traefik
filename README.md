# docker Traefik v1.7x  - [Overclock Server](https://lordpedal.github.io)

**Dependencias necesarias:** ``sudo apt-get -y install apache2-utils``

**Generar clave cifrada:** ``htpasswd -nb lordpedal lordpedal``

**Crear red Traefik:** ``docker network create -d bridge traefik``

**Permisos lectura certificados:** ``touch acme.json && chmod 600 acme.json``

**Permisos ejecución bash:** ``chmod +x traefik.sh``

> ... la culminación de un fin es el comienzo de una realidad.
