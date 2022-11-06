docker build . -t ubuntu-server:latest
# Todo build reemplaza al anterior, ya que reusamos la etiqueta ubuntu-server:latest
# Le ponemos nombre a la imagen para tenerla en todo momento identificada,
# de lo contrario, Docker elegiría como nombre el hash de la imagen,
# y un nombre al azar para los contenedores. Esto complicaría bastante el uso
# de comandos automáticos.

# Al reemplazar la imagen, la imagen vieja no se destruye, queda "destageada" (untagged).
# A continuación limpiamos de nuestra máquina TODAS las imágenes que no tienen tag.
docker image ls | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox} "^<none>" | tr -s " " | cut -d" " -f3 | xargs -I{} docker image rm {} -f | echo "\n* Clean up old images."

# Este script tiene una posible mejora:
# En vez de eliminar TODAS las imágenes sin tag, eliminar sólo las imágenes residuales
# que han sido exclusivamente generadas por este script.
# Para hacerlo:
# (1) Localizar antes del build el identificador de la actual imagen ubuntu-server:latest,
# (2) hacer el build, que reemplazará la imagen ubuntu-server:latest por una nueva versión.
# (3) Y por último, eliminar sólo la imagen que ha quedado colgada (dangling), usando el ID
# que rescatamos en el primer paso.

# ¿Por qué deberíamos hacer esto?
# Estamos limpiando de forma indiscriminada TODAS las imágenes del usuario, incluídas
# imágenes que no tienen nada que ver con este proyecto.
# Desconocemos si el usuario necesita esas imágenes para algo (posible backups, restores...)
# Lo correcto es no ser intrusivos y no llevar a cabo acciones fuera del ámbito
# de este proyecto.