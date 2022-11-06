# Wordpress con Ansible

En este proyecto estoy intentando crear un playbook de Ansible que automatice la preparación e instalación de Wordpress en un servidor Linux.

Este proyecto es una mera práctica de Ansible.

## Ansible

Es una plataforma de aprovisionamiento. Mediante plantillas (playbooks) definimos los requisitos que debe satisfacer una máquina para ser aprovisionada: qué configuración debe tener el servidor, qué paquetes deben estar instalados, etc.

De forma resumida, una plantilla que asegura de que una máquina está aprovisionada con todos los elementos necesarios para su finalidad.

## Playbooks

Fichero YAML donde definimos los requisitos que debe satisfacer la máquina.

El objetivo del playbook es ejecutarse de la misma forma en todas las máquina, y que todas ellas terminen teniendo exactamente los mismos requisitos satisfechos. Por esa razón, el playbook es agnóstico a la máquina en cuestión. El modo en que instalará cada paquete dependerá del sistema operativo / distribución y el gestor de paquetes que disponga la máquina en cuestión, pero de eso se encargará Ansible. Nosotros sólo definimos en el playbook el "qué", no el "cómo".

## Inventory

El inventario es un listado de servidores en formato YAML (también disponible en formato INI, deprecado) sobre los cuales se debe ejecutar el playbook. Cada servidor puede tener unas características de acceso diferentes (usuarios, contraseñas, puertos SSH...), que Ansible necesita para poder acceder a la máquina y realizar su trabajo.

El inventory define el "dónde", qué máquinas son el objetivo, y cómo se accede a ellas.

## Objetivo

Este es un proyecto personal con fines prácticos. Al finalizar podría considerar si se puede utilizar de forma estandarizada. Por tanto, si lo clonas, que sea a tu riesgo.

Antes de comenzar, el script build creará una máquina en Docker con la distribución Ubuntu Server con acceso SSH.

En tu máquina local deberás tener instalado Ansible. Si eres usuario de Windows te recomendaría que usases WSL.

El inventario de este proyecto localiza la máquina creada en Docker por el puerto 23, para que no entre en conflicto con un posible servidor SSH que ya tengas en tu máquina host.

Para construir la máquina en Docker, ejecuta el comando ```./build.sh```.

Para levantar la máquina de Docker, después del build, ejecuta el comando ```up.sh```.

Si haces mal el playbook y la máquina queda sucia, puedes reiniciarla y aprovechar la magia de Docker, volverá a su estado inicial.

Si deseas reconstruir la imagen de Docker y volver a levantarla desde cero, sólo tienes que volver a ejecutar el ```build``` y el ```up```.

El playbook de este proyecto deberá aprovisionar y configurar una máquina de Linux para que tenga todo el software necesario para levantar Wordpress:

* Apache Server
* PHP
* MySQL
* Wordpress
* Configuración de Apache
* Configuración de MySQL
* Configuración de permisos y conectividad
* Opcional: PHPMyAdmin

Este playbook automatizaría la instalación y configuración de todos estos pasos para no tener que hacerlos manualmente en una máquina VPS.