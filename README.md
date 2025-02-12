# ![ultracube](https://avatars.githubusercontent.com/u/7068904?s=50 "logo") Epitest Docker Script

```bash
$ epitest make
[CC] src/main.c
[CC] src/utils.c
[BIN] my_program

$ epitest ./my_program
Hello from Epitech environment!

$ epitest bash
root@f45d75a42:/home/epitech# ls
Makefile  includes/  src/  tests/
```

Un script shell permettant d'exécuter facilement l'environnement Epitech dans un conteneur Docker.

> ⚠️ Testé uniquement sur Fedora, macOS Sequoia 15.3 et Windows 10 - Les autres environnements sont listés à titre indicatif mais n'ont pas été vérifiés

## Prérequis

- Docker installé sur votre système
  - [Guide d'installation de Docker](https://docs.docker.com/get-docker/)

## Installation

> ⚠️ La première utilisation peut prendre plusieurs minutes car l'image Docker ([epitechcontent/epitest-docker](https://hub.docker.com/r/epitechcontent/epitest-docker)) doit être téléchargée (environ 2GB). Vous devrez peut-être vous connecter à Docker Hub avec vos identifiants (`docker login`) pour pouvoir télécharger l'image.

> ℹ️ Le script lance toujours l'environnement en mode linux/amd64, même sur les architectures ARM (comme les Mac M1->M4). Cela garantit une compatibilité maximale avec l'environnement Epitech, mais peut impacter légèrement les performances sur les processeurs ARM.

### Linux
![Fedora Example](https://github.com/WilliamJlvt/epitest-docker-script/blob/main/screenshots/fedora_example.png?raw=true)

#### Ubuntu/Debian
```bash
# Installation de Docker si non installé
sudo apt update
sudo apt install docker.io

# Installation du script
sudo wget -O /usr/local/bin/epitest https://raw.githubusercontent.com/WilliamJlvt/epitest-docker-script/main/epitest
sudo chmod +x /usr/local/bin/epitest
```

#### Arch Linux
```bash
# Installation de Docker si non installé
sudo pacman -S docker

# Installation du script
sudo wget -O /usr/local/bin/epitest https://raw.githubusercontent.com/WilliamJlvt/epitest-docker-script/main/epitest
sudo chmod +x /usr/local/bin/epitest
```

#### Fedora
```bash
# Installation de Docker si non installé
sudo dnf install docker

# Installation du script
sudo wget -O /usr/local/bin/epitest https://raw.githubusercontent.com/WilliamJlvt/epitest-docker-script/main/epitest
sudo chmod +x /usr/local/bin/epitest
```

### macOS
![macOS Example](https://github.com/WilliamJlvt/epitest-docker-script/blob/main/screenshots/macos_example.png?raw=true)
```bash
# Installation de Docker si non installé
brew install --cask docker

# Installation du script
sudo curl -o /usr/local/bin/epitest https://raw.githubusercontent.com/WilliamJlvt/epitest-docker-script/main/epitest
sudo chmod +x /usr/local/bin/epitest
```

Alternative pour macOS (si problème de permissions) :
```bash
# Créer un dossier bin dans votre home
mkdir -p ~/bin

# Installation du script
curl -o ~/bin/epitest https://raw.githubusercontent.com/WilliamJlvt/epitest-docker-script/main/epitest
chmod +x ~/bin/epitest

# Ajouter le chemin à votre PATH (à ajouter dans ~/.zshrc ou ~/.bash_profile)
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Windows
![Windows Example](https://github.com/WilliamJlvt/epitest-docker-script/blob/main/screenshots/windows_example.png?raw=true)
Deux options sont disponibles :

#### Option 1 : Script Batch (.bat) - Solution Native
1. Installer [Docker Desktop pour Windows](https://docs.docker.com/desktop/windows/install/)
2. Créer un fichier `epitest.bat` dans `C:\Windows` avec le contenu suivant :
```batch
@echo off
docker rm -f valgrind-env 2>nul
docker run -it --rm --platform linux/amd64 --name valgrind-env -v %cd%:/home/epitech -w /home/epitech epitechcontent/epitest-docker:latest %*
```

#### Option 2 : WSL2 (recommandé pour les développeurs)
1. Installer [WSL2](https://docs.microsoft.com/fr-fr/windows/wsl/install)
2. Installer [Docker Desktop pour Windows](https://docs.docker.com/desktop/windows/install/)
3. Dans votre distribution Linux WSL2 :
```bash
# Installation du script
sudo wget -O /usr/local/bin/epitest https://raw.githubusercontent.com/WilliamJlvt/epitest-docker-script/main/epitest
sudo chmod +x /usr/local/bin/epitest
```

> Note: Si vous utilisez WSL2, assurez-vous d'activer l'intégration Docker dans les paramètres de Docker Desktop

## Utilisation

Le script peut être utilisé comme suit :

```bash
# Se placer dans le répertoire de votre projet
cd /chemin/vers/votre/projet

# Exécuter une commande dans l'environnement Epitech
epitest make
epitest ls
epitest ./my_program

# Lancer un shell interactif
epitest bash
```

## Dépannage

### Docker n'est pas lancé
```bash
# Linux
sudo systemctl start docker

# macOS & Windows
Lancer Docker Desktop
```

### Permissions Docker (Linux)
```bash
# Ajouter votre utilisateur au groupe docker
sudo usermod -aG docker $USER

# Redémarrer votre session ou exécuter
newgrp docker
```
