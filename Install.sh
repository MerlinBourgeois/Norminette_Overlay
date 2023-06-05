#!/bin/bash

# Chemin vers le script à installer
script_path="overlay.sh"

# Répertoire où sera installé le script
install_dir="$HOME/bin"

# Nom du lien symbolique pour exécuter le script
symlink_name="overlinette"

# Vérifier si le script existe
if [ ! -f "$script_path" ]; then
    echo "Erreur : Le script $script_path n'existe pas."
    exit 1
fi

# Vérifier si le répertoire d'installation existe, sinon le créer
if [ ! -d "$install_dir" ]; then
    mkdir -p "$install_dir"
fi

# Copier le script vers le répertoire d'installation
cp "$script_path" "$install_dir"

# Créer le lien symbolique dans le répertoire local
ln -s "$install_dir/$(basename "$script_path")" "$install_dir/$symlink_name"

# Ajouter le fichier de manuel
man_dir="$HOME/man/man1"
man_filename="overlinette.1"

# Vérifier si le répertoire des fichiers de manuel existe, sinon le créer
if [ ! -d "$man_dir" ]; then
    mkdir -p "$man_dir"
fi

# Copier le fichier de manuel vers le répertoire des fichiers de manuel
cp "$man_filename" "$man_dir"

# Afficher un message d'installation réussie
echo "Le script a été installé avec succès."
echo "Vous pouvez maintenant exécuter le script en utilisant la commande '$symlink_name'."