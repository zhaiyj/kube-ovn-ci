# syntax = docker/dockerfile:experimental
FROM etcdnecx/kube-ovn-base:ecx-v1.8.0

COPY kube-ovn/dist/images/*.sh /kube-ovn/
COPY kube-ovn/dist/images/01-kube-ovn.conflist /kube-ovn/01-kube-ovn.conflist
COPY kube-ovn/dist/images/logrotate/* /etc/logrotate.d/
COPY kube-ovn/dist/images/grace_stop_ovn_controller /usr/share/ovn/scripts/grace_stop_ovn_controller

WORKDIR /kube-ovn

COPY kube-ovn/dist/images/kube-ovn /kube-ovn/kube-ovn
COPY kube-ovn/dist/images/kube-ovn-cmd /kube-ovn/kube-ovn-cmd
RUN ln -s /kube-ovn/kube-ovn-cmd /kube-ovn/kube-ovn-controller && \
    ln -s /kube-ovn/kube-ovn-cmd /kube-ovn/kube-ovn-daemon && \
    ln -s /kube-ovn/kube-ovn-cmd /kube-ovn/kube-ovn-monitor && \
    ln -s /kube-ovn/kube-ovn-cmd /kube-ovn/kube-ovn-pinger && \
    ln -s /kube-ovn/kube-ovn-cmd /kube-ovn/kube-ovn-speaker && \
    ln -s /kube-ovn/kube-ovn-cmd /kube-ovn/kube-ovn-webhook
