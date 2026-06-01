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
    sudo \
    && dnf clean all

RUN python3 -m pip install --upgrade pip

RUN pip3 install \
    ansible==3.* \
    ansible-pylibssh \
    paramiko \
    netmiko

RUN ansible-galaxy collection install \
    cisco.ios \
    cisco.nxos \
    cisco.asa \
    ansible.netcommon

# Create sabioye user
RUN useradd -m -s /bin/bash sabioye && \
    echo "sabioye ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/sabioye

# Create workspace
RUN mkdir -p /ansible && \
    chown -R sabioye:sabioye /ansible

WORKDIR /ansible

USER sabioye

CMD ["/bin/bash"]
