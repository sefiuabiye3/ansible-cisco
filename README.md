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

docker run -it \
  --network host \
  --name ansible-cisco \
  -v $(pwd):/ansible \
  rhel8-ansible-cisco
