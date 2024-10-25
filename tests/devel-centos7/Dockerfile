# Latest version of centos
FROM centos:centos7
MAINTAINER James Cuzella <james.cuzella@lyraphase.com>
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum clean all && \
    yum -y install epel-release && \
    yum makecache all && \
    yum -y groups mark convert && \
    yum -y groups mark install "Development Tools" && \
    yum -y groups mark convert "Development Tools" && \
    yum -y groupinstall "Development Tools" && \
    yum -y install libffi-devel openssl-devel && \
    yum -y install python3-devel MySQL-python sshpass && \
    yum -y install sudo && \
    sed -i -e 's/^Defaults.*requiretty/Defaults    !requiretty/' -e 's/^%wheel.*ALL$/%wheel    ALL=(ALL)    NOPASSWD: ALL/' /etc/sudoers && \
    yum -y install python36-PyYAML python36-jinja2 python3-httplib2 python-keyczar python36-paramiko python3-setuptools python34-pip && \
    pip3 install pbr debtcollector==0.5.0 stevedore==1.5.0 && \
    pip3 install pysphere boto boto3 passlib && \
    sh -c 'yum -y remove libffi-devel || yum -y --setopt=tsflags=noscripts remove libffi-devel' && \
    yum -y remove $(rpm -qa "*-devel") && \
    yum -y groupremove "Development tools" && \
    yum -y autoremove && \
    yum -y install bzip2 crontabs file findutils gem git gzip hg hostname procps-ng svn sudo tar tree which unzip xz zip && \
    yum -y install ansible-2.9.27 && \
    yum clean all && rm -rf /var/cache/yum

CMD /bin/bash
