# Latest version of centos
FROM centos:centos7
MAINTAINER James Cuzella <james.cuzella@lyraphase.com>
RUN echo -e "[global]\nindex-url=https://pypi.org/simple" > /etc/pip.conf
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum clean all && \
    yum -y install epel-release && \
    yum -y groupinstall "Development tools" && \
    yum -y install python3-devel MySQL-python sshpass && \
    yum -y install acl sudo && \
    sed -i -e 's/^Defaults.*requiretty/Defaults    !requiretty/' -e 's/^%wheel.*ALL$/%wheel    ALL=(ALL)    NOPASSWD: ALL/' /etc/sudoers && \
    yum -y install python3-setuptools python36-PyYAML python36-jinja2 python3-httplib2 python-keyczar python36-paramiko python34-pip  && \
    pip3 install pbr debtcollector==0.5.0 stevedore==1.5.0 && \
    pip3 install pysphere boto boto3 passlib && \
    yum -y remove $(rpm -qa "*-devel") && \
    yum -y groupremove "Development tools" && \
    yum -y autoremove && \
    yum -y install bzip2 crontabs file findutils gem git gzip hg procps-ng svn sudo tar tree which unzip xz zip && \
    yum -y install ansible-2.9.27

CMD ["/bin/bash"]
