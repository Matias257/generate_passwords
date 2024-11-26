#!/bin/bash

echo -e "\e[1;33m
╔══╗──────────────╔═╗──╔═╦═╗───────╔╦═╗
║╔═╬═╦═╦╦═╦╦╦═╗╔╦╗║╬╠═╗║═╣═╬╦╦╦═╦╦╦╝║═╣
║╚╗║╩╣║║║╩╣╔╣╬╚╣╔╝║╔╣╬╚╬═╠═║║║║╬║╔╣╬╠═║
╚══╩═╩╩═╩═╩╝╚══╩╝─╚╝╚══╩═╩═╩══╩═╩╝╚═╩═╝\e[0m"

echo -e "\e[32mGENERADOR DE PASSWORDS\e[0m"

# Directorio donde se guardarán las contraseñas
SAVE_DIR="/sdcard/passwords"

# Asegurarse de que el directorio exista
mkdir -p "$SAVE_DIR"

# Función para generar contraseñas
generate_password() {
    local length=$1
    local charset="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(_+=-"
    local password=$(tr -dc "$charset" </dev/urandom | head -c "$length")
    echo "$password"
}

# Solicitar al usuario la cantidad de contraseñas a generar
read -p "¿Cuántas contraseñas desea generar? " num_passwords

# Nombres latinos
latin_names=("Alejandro" "Sofía" "Joaquín" "Lucía" "Mateo" "Valentina" "Diego" "Isabela" "Santiago" "Gabriela")

# Generar y guardar las contraseñas
for ((i=1; i<=num_passwords; i++)); do
    random_index=$(( RANDOM % ${#latin_names[@]} ))
    name="${latin_names[$random_index]}"
    password=$(generate_password 16)
    filename="${name}_password_$i.txt"
    filepath="$SAVE_DIR/$filename"
    echo "$password" > "$filepath"
    echo "Contraseña generada para $name: $password (guardada en $filepath)"
done
