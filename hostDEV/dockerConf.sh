#!/usr/bin/env bash
# install_docker_ubuntu.sh - Ubuntu 22.04/24.04 Docker Engine + non-root usage
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Run as root: sudo $0"
  exit 1
fi

apt-get update
apt-get install -y ca-certificates curl gnupg

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

. /etc/os-release
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu ${VERSION_CODENAME} stable" \
  > /etc/apt/sources.list.d/docker.list

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable --now docker

# non-root docker for the invoking user (not root)
USER_NAME="${SUDO_USER:-}"
if [[ -n "${USER_NAME}" ]]; then
  groupadd -f docker
  usermod -aG docker "${USER_NAME}"
  echo "Docker installed. Log out/in (or run: newgrp docker) to use docker without sudo."
else
  echo "Docker installed. Add your user to docker group: sudo usermod -aG docker <user>"
fi

docker --version
docker compose version

