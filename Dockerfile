FROM ubuntu:latest

# Trabajo en root.
# Es el usuario principal de todos los contenedores de Docker
# En un VPS normal esto sería poco recomendable.
WORKDIR /root

RUN apt update && apt install openssh-server -y

# Contraseña maestra ssh: mypassword
RUN mkdir /var/run/sshd
RUN echo 'root:mypassword' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Opcional, incluímos claves personales para acceso ssh
RUN mkdir $HOME/.ssh
COPY id_rsa.pub ./.ssh/authorized_keys
RUN chmod 700 ./.ssh && chmod 600 ~/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
