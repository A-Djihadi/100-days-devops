# Day 01 — Utilisateur avec shell non interactif

## 🎯 Objectif

Créer l'utilisateur `javed` avec un shell non interactif sur **App Server 1**, pour l'agent de backup de xFusionCorp Industries.

## 🛠️ Étapes

```bash
# 1. Connexion à App Server 1 depuis le jump host
ssh tony@stapp01

# 2. Création de l'utilisateur avec /sbin/nologin comme shell
sudo useradd -s /sbin/nologin javed

# 3. Vérification
grep javed /etc/passwd
# javed:x:1002:1002::/home/javed:/sbin/nologin

sudo su - javed
# This account is currently not available.
```

## 💡 Ce que j'ai appris

- Le shell de connexion est le 7e champ de `/etc/passwd`.
- `/sbin/nologin` bloque toute session interactive, mais le compte reste utilisable par un process (`sudo -u javed ...`). C'est exactement ce qu'il faut pour un compte de service.
- `useradd -s` à la création, `usermod -s` pour un compte existant.

📚 Fiche complète : [`fiches/01-shell-non-interactif.md`](../../fiches/01-shell-non-interactif.md)
