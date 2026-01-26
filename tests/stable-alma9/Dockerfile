FROM almalinux:9.4
MAINTAINER Jukka Tuunanen <jukka.tuunanen@csc.fi>
RUN dnf -y install acl sudo epel-release python39 && \
    dnf -y groupinstall "Development Tools" && \
    dnf -y install python3-pyyaml python3-jinja2 python3-setuptools python3-pip && \
    dnf -y install python3-libselinux python3-libsemanage python3-policycoreutils && \
    pip3 -V && \
    pip3 install pbr debtcollector stevedore && \
    pip3 install pysphere boto boto3 passlib && \
    dnf -y remove $(rpm -qa "*-devel") && \
    dnf -y autoremove && \
    dnf -y install bzip2 crontabs file findutils gem git gzip hg procps-ng svn sudo tar tree which unzip xz zip && \
    dnf -y install libvirt openssh-server python3-libvirt qemu-kvm qemu-img virt-install virt-top && \
    pip3 install ansible==2.9.27 && \
    dnf clean all
CMD ["/bin/bash"]