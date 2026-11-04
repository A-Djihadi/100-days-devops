# Day 02 — Utilisateur temporaire avec date d'expiration

## 🎯 Objectif

Créer l'utilisateur `james` sur **App Server 1** (Stratos Datacenter) avec une expiration au **2027-02-17**, pour un accès temporaire au projet Nautilus.

## 🛠️ Étapes

```bash
# 1. Connexion à App Server 1 depuis le jump host
ssh tony@stapp01

# 2. Création de l'utilisateur avec une date d'expiration
sudo useradd -e 2027-02-17 james

# 3. Vérification
sudo chage -l james
# Account expires : Feb 17, 2027
```

## 💡 Ce que j'ai appris

- L'expiration du compte est stockée dans le 8e champ de `/etc/shadow`, en jours depuis le 1er janvier 1970.
- `useradd -e` à la création, `chage -E` ou `usermod -e` pour un compte existant.
- Expiration du **compte** (`-E`) ≠ expiration du **mot de passe** (`-M`).

📚 Fiche complète : [`fiches/02-utilisateur-temporaire.md`](../../fiches/02-utilisateur-temporaire.md)
