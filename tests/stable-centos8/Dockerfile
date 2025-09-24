FROM centos:centos8
MAINTAINER Jukka Tuunanen <jukka.tuunanen@csc.fi>
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    dnf -y install acl sudo && \
    dnf -y install python39 epel-release && \
    dnf -y update libmodulemd && \
    dnf -y groupinstall "Development Tools" && \
    dnf -y install python3-pyyaml python3-jinja2 python3-setuptools && \
    python3 -m pip install --upgrade pip && \
    pip3 -V && \
    pip3 install pbr debtcollector==0.5.0 stevedore==1.5.0 && \
    pip3 install pysphere boto boto3 passlib && \
    dnf -y remove $(rpm -qa "*-devel") && \
    dnf -y autoremove && \
    dnf -y install bzip2 crontabs file findutils gem git gzip hg procps-ng svn sudo tar tree which unzip xz zip && \
    pip3 install ansible==2.9.27

CMD ["/bin/bash"]