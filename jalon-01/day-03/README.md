# Day 03 — Désactiver la connexion SSH root

## 🎯 Objectif

Interdire la connexion SSH directe en `root` sur les 3 app servers (`stapp01`, `stapp02`, `stapp03`) du Stratos Datacenter, et appliquer le changement au service en cours d'exécution.

## 🛠️ Étapes (sur chaque serveur)

```bash
# 1. Connexion (tony@stapp01, steve@stapp02, banner@stapp03)
ssh tony@stapp01

# 2. Passage de PermitRootLogin à "no"
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

# 3. Test de syntaxe puis redémarrage
sudo sshd -t && sudo systemctl restart sshd

# 4. Vérification de la config effective
sudo sshd -T | grep -i permitrootlogin
# permitrootlogin no
```

Le script [`disable-root-ssh.sh`](./disable-root-ssh.sh) regroupe ces étapes.

## 💡 Ce que j'ai appris

- Modifier `sshd_config` ne suffit pas : il faut redémarrer (ou recharger) `sshd`.
- `sshd -t` valide la syntaxe, `sshd -T` affiche la config **effectivement** appliquée, drop-ins de `sshd_config.d/` compris.
- Répéter la même action sur N serveurs à la main, c'est le signal qu'il faut passer à Ansible.

📚 Fiche complète : [`fiches/03-desactiver-ssh-root.md`](../../fiches/03-desactiver-ssh-root.md)
