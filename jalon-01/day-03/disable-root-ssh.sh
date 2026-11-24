#!/usr/bin/env bash
# Désactive la connexion SSH directe en root et applique le changement.
# Usage : sudo ./disable-root-ssh.sh
set -euo pipefail

CONFIG=/etc/ssh/sshd_config

cp "$CONFIG" "${CONFIG}.bak.$(date +%F-%H%M%S)"

if grep -qE '^#?PermitRootLogin' "$CONFIG"; then
  sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' "$CONFIG"
else
  echo 'PermitRootLogin no' >> "$CONFIG"
fi

sshd -t
systemctl restart sshd

sshd -T | grep -i '^permitrootlogin'
