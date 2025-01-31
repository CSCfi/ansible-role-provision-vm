FROM centos:centos8
MAINTAINER Jukka Tuunanen <jukka.tuunanen@csc.fi>

# Update repositories and install required system packages
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    dnf -y update && \
    dnf -y install acl sudo && \
    dnf -y install python39 epel-release && \
    dnf -y update libmodulemd && \
    dnf -y groupinstall "Development Tools" && \
    dnf -y install python3-pyyaml python3-jinja2 python3-setuptools && \
    dnf -y install crontabs gem hg svn tree && \
    dnf -y autoremove

# Create a non-root user
RUN useradd -m -s /bin/bash ansibleuser && \
    echo "ansibleuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansibleuser && \
    chmod 0440 /etc/sudoers.d/ansibleuser

# Switch to the non-root user
USER ansibleuser
WORKDIR /home/ansibleuser

# Upgrade pip and install Python packages in user space
RUN python3 -m pip install --user --upgrade pip && \
    /home/ansibleuser/.local/bin/pip3 install pbr debtcollector==0.5.0 stevedore==1.5.0 && \
    /home/ansibleuser/.local/bin/pip3 install pysphere boto boto3 passlib && \
    /home/ansibleuser/.local/bin/pip3 install ansible==2.9.27

# Set PATH so that the locally installed pip packages are accessible
ENV PATH="/home/ansibleuser/.local/bin:${PATH}"

# Switch back to root to reinstall dnf-related dependencies (if needed)
USER root
RUN dnf reinstall -y python3-dnf dnf libselinux-python

# Verify that the dnf module is importable
RUN /usr/bin/python3 -c "import dnf; print(dnf)"

# Switch back to the non-root user
USER ansibleuser

CMD ["/bin/bash"]