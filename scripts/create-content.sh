#!/usr/bin/env bash

# Obtiene la ruta absoluta de la raíz del proyecto.
# El script se encuentra dentro de /scripts, por lo que ".."
# corresponde al directorio raíz del proyecto.
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Define los nombres de las secciones que se crearán.
# El número de cada archivo se genera automáticamente
# según su posición dentro del arreglo.
names=(
    introduccion
    marco-teorico
    desarrollo
    conclusiones
)

# Crea el directorio "content" si todavía no existe.
mkdir -p "$PROJECT_ROOT/content"

# Recorre los índices del arreglo "names".
for i in "${!names[@]}"; do

    # Genera un número de dos dígitos basado en el índice.
    # Se suma 1 porque los índices del arreglo comienzan en 0.
    #
    # Ejemplo:
    # 0 -> 01
    # 1 -> 02
    number=$(printf "%02d" $((i + 1)))

    # Crea el archivo .tex utilizando la numeración generada
    # y el nombre correspondiente de la sección.
    touch "$PROJECT_ROOT/content/${number}-${names[$i]}.tex"
done