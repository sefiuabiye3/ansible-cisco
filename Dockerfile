FROM registry.access.redhat.com/ubi8/ubi:8.10

USER root

RUN dnf install -y \
    python3 \
    python3-pip \
    openssh-clients \
    sshpass \
    git \
    iputils \
    vim \
    tar \
    which \
    && dnf clean all

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Install Ansible and networking libraries
RUN pip3 install \
    ansible==3.* \
    ansible-pylibssh \
    paramiko \
    netmiko

# Install Cisco collections
RUN ansible-galaxy collection install \
    cisco.ios \
    cisco.nxos \
    cisco.asa \
    ansible.netcommon

WORKDIR /ansible

CMD ["/bin/bash"]
