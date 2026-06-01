# ansible-cisco

# Ansible Cisco Automation Container

RHEL 8.10 container with Ansible and Cisco collections installed.

## Features

- RHEL 8.10 / UBI8
- Ansible 3.*
- Cisco collections
- root user
- Shared `/ansible` workspace

---

## Build Image

```bash
docker build -t rhel8-ansible-cisco .

---
## Run Container

docker run -it --rm \
  -v /home/sabioye/Project/ansible:/ansible:Z \
  -v /home/sabioye/.ssh:/home/sabioye/.ssh:ro,Z \
  rhel8-ansible-cisco
=====================================================================
for network switch inventory

[cisco_ios]
10.0.0.131
10.0.0.132

[cisco_ios:vars]
ansible_connection=network_cli
ansible_network_os=cisco.ios.ios
ansible_user=sabioye
ansible_password=<password>
