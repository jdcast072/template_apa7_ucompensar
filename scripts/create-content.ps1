#!/usr/bin/env pwsh

# Obtiene la raíz del proyecto.
$PROJECT_ROOT = Split-Path -Parent $PSScriptRoot

# Número inicial.
$start = 5

# Nombres de las secciones.
$names = @(
    "hola mundo"
)

# Crea el directorio si no existe.
New-Item -ItemType Directory -Force -Path "$PROJECT_ROOT/content" | Out-Null

# Recorre los nombres.
for ($i = 0; $i -lt $names.Count; $i++) {

    # Genera la numeración.
    if ($start -eq 0) {
        # Con 0, comienza desde 01.
        $number = "{0:D2}" -f ($i + 1)
    }
    else {
        # Con otro valor, comienza desde start + 1.
        $number = "{0:D2}" -f ($start + $i + 1)
    }

    # Crea el archivo.
    New-Item -ItemType File -Force `
        -Path "$PROJECT_ROOT/content/${number}-$($names[$i]).tex" | Out-Null
}