FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y openssh-server
#RUN systemctl enable ssh --now
COPY init-server.sh init-server.sh
RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd
RUN cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original

CMD [ "bash", "/init-server.sh" ]
#CMD ["/usr/sbin/sshd", "-D"]