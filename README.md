# Epitest Docker Script

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

> ⚠️ Testé uniquement sur macOS Sonoma 15.3 - Les autres environnements sont listés à titre indicatif mais n'ont pas été vérifiés

## Prérequis

- Docker installé sur votre système
  - [Guide d'installation de Docker](https://docs.docker.com/get-docker/)

## Installation

### Linux

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

1. Installer [Docker Desktop pour Windows](https://docs.docker.com/desktop/windows/install/)
2. Installer [Git Bash](https://gitforwindows.org/) ou WSL2 (recommandé)

Avec Git Bash :
```bash
# Créer le dossier bin s'il n'existe pas
mkdir -p ~/bin

# Télécharger le script
curl -o ~/bin/epitest https://raw.githubusercontent.com/WilliamJlvt/epitest-docker-script/main/epitest
chmod +x ~/bin/epitest

# Ajouter au PATH (à ajouter dans ~/.bashrc)
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Avec WSL2 (Ubuntu) :
```bash
# Installation de Docker si non installé
sudo apt update
sudo apt install docker.io

# Installation du script
sudo wget -O /usr/local/bin/epitest https://raw.githubusercontent.com/WilliamJlvt/epitest-docker-script/main/epitest
sudo chmod +x /usr/local/bin/epitest
```

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
