#!/bin/bash

# Chemin vers le script à installer
script_path="overlay.sh"

# Répertoire où sera installé le script
install_dir="/usr/local/bin"

# Nom du lien symbolique pour exécuter le script
symlink_name="overlinette"

# Vérifier si le script existe
if [ ! -f "$script_path" ]; then
    echo "Erreur : Le script $script_path n'existe pas."
    exit 1
fi

# Vérifier si le répertoire d'installation existe
if [ ! -d "$install_dir" ]; then
    echo "Erreur : Le répertoire d'installation $install_dir n'existe pas."
    exit 1
fi

# Copier le script vers le répertoire d'installation
cp "$script_path" "$install_dir"

# Créer le lien symbolique dans /usr/local/bin
ln -s "$install_dir/$(basename "$script_path")" "$install_dir/$symlink_name"

# Ajouter le fichier de manuel
man_dir="/usr/local/share/man/man1"
man_filename="overlinette.1"

# Vérifier si le répertoire des fichiers de manuel existe
if [ ! -d "$man_dir" ]; then
    echo "Erreur : Le répertoire des fichiers de manuel $man_dir n'existe pas."
    exit 1
fi

# Copier le fichier de manuel vers le répertoire des fichiers de manuel
cp "$man_filename" "$man_dir"

echo "Le script a été installé avec succès."
echo "Vous pouvez maintenant exécuter le script en utilisant la commande 'overlinette'."
