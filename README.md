# 🔑 PS_password_generator — Générateur de mots de passe PowerShell

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue?style=for-the-badge)
![Windows](https://img.shields.io/badge/Windows-10%2F11-0078D6?style=for-the-badge)
![Licence](https://img.shields.io/badge/Licence-MIT-green?style=for-the-badge)

Module PowerShell de génération de mots de passe aléatoires sécurisés. Le mot de passe généré est automatiquement copié dans le presse-papier pour une utilisation immédiate.

---

## Fonctionnalités

- Génération de mots de passe aléatoires et sécurisés
- Copie automatique dans le presse-papier
- Installable comme module PowerShell réutilisable
- Paramétrable : longueur, caractères spéciaux, chiffres, majuscules

---

## Prérequis

- Windows 10 / 11
- PowerShell 5.1 ou supérieur

---

## Installation

Lancer le fichier batch fourni (en tant qu'administrateur si nécessaire) :

```
RandomPasswordModule.bat
```

Ce script installe le module PowerShell dans le dossier `Documents\WindowsPowerShell\Modules\`.

> Accepter les demandes d'autorisation PowerShell lors de l'installation.

---

## Utilisation

Une fois le module installé, générer un mot de passe depuis PowerShell :

```powershell
Import-Module RandomPasswordModule
Get-RandomPassword
```

Le mot de passe est affiché dans la console **et copié dans le presse-papier**.

---

## Paramètres

| Paramètre | Défaut | Description |
|-----------|--------|-------------|
| `-Length` | 16 | Longueur du mot de passe |
| `-Uppercase` | `$true` | Inclure des majuscules |
| `-Digits` | `$true` | Inclure des chiffres |
| `-Symbols` | `$true` | Inclure des caractères spéciaux |

Exemple :

```powershell
Get-RandomPassword -Length 20 -Symbols $false
```

---

## Fichiers du projet

| Fichier | Description |
|---------|-------------|
| `RandomPasswordModule.bat` | Script d'installation du module |
| `RandomPasswordModule.psd1` | Manifeste du module PowerShell |
| `RandomPasswordModule.psm1` | Code source du module |

---

## Licence

MIT © Titithen00b
