FROM rockylinux:8

RUN dnf -y install epel-release && \
    dnf -y install qpid-dispatch-console qpid-dispatch-router qpid-dispatch-tools

ENTRYPOINT [ "/usr/sbin/qdrouterd", "-c", "/opt/qdrouterd.conf" ]
