# Plantilla de Proyecto LaTeX

Esta estructura corresponde a una plantilla base para la elaboración de documentos académicos y técnicos en **LaTeX**.

El objetivo del proyecto es proporcionar una organización reutilizable para futuros trabajos. La estructura general puede mantenerse, mientras que el contenido de cada proyecto deberá adaptarse según sus necesidades específicas.

La fase principal de trabajo consiste en la **modificación y personalización del contenido**, incluyendo capítulos, metadatos, portada, bibliografía, imágenes y demás recursos necesarios.

---

## Estructura del proyecto

```text
├── README.md
├── assets
│   ├── images
│   │   └── logo_ucompensar-2022.jpg
│   └── tables
│       ├── table-01.tex
│       └── table-02.tex
├── bibliography
│   └── references.bib
├── build
│   ├── main.log
│   └── main.pdf
├── config
│   ├── metadata.tex
│   ├── packages.tex
│   └── settings.tex
├── content
│   ├── 01-introduccion.tex
│   ├── 02-marco-teorico.tex
│   ├── 03-desarrollo.tex
│   └── 04-conclusiones.tex
├── frontmatter
│   ├── abstract.tex
│   ├── acknowledgments.tex
│   └── cover.tex
├── main.pdf
├── main.tex
└── scripts
    └── create-content.sh
    
```

**9 directorios, 22 archivos**

---

# Descripción general

El proyecto está dividido por responsabilidades para evitar concentrar toda la configuración y el contenido en un único archivo.

La estructura permite:

- Separar la configuración del documento.
- Mantener los metadatos centralizados.
- Dividir el contenido en capítulos o secciones independientes.
- Gestionar la bibliografía de forma separada.
- Organizar imágenes y tablas.
- Personalizar la portada y las secciones preliminares.
- Mantener los archivos generados separados del código fuente.
- Reutilizar la estructura en futuros proyectos.

---

# Punto de entrada

## `main.tex`

Este es el archivo principal del proyecto.

Desde este archivo se integran los diferentes componentes del documento, tales como:

- Configuración.
- Metadatos.
- Portada.
- Resumen.
- Agradecimientos.
- Contenido principal.
- Bibliografía.

Un flujo típico puede ser:

```latex
\documentclass[12pt]{apa7}

% Configuración
\input{config/packages.tex}
\input{config/settings.tex}
\input{config/metadata.tex}

\begin{document}

% Portada
\input{frontmatter/cover.tex}

% Secciones preliminares
\input{frontmatter/abstract.tex}
\input{frontmatter/acknowledgments.tex}

% Contenido principal
\input{content/01-introduccion.tex}
\input{content/02-marco-teorico.tex}
\input{content/03-desarrollo.tex}
\input{content/04-conclusiones.tex}

% Bibliografía
\printbibliography

\end{document}
```

La organización exacta puede cambiar según las necesidades del proyecto.

---

# Directorios

## `assets/`

Contiene los recursos visuales y complementarios utilizados en el documento.

### `assets/images/`

Almacena imágenes, logotipos, diagramas y otros recursos gráficos.

Ejemplo:

```text
assets/images/logo_ucompensar-2022.jpg
```

Para incluir una imagen:

```latex
\includegraphics[width=0.5\textwidth]{assets/images/nombre-imagen}
```

### `assets/tables/`

Destinado a recursos relacionados con tablas.

Puede utilizarse para:

- Tablas externas.
- Archivos CSV.
- Datos procesados.
- Fragmentos de tablas reutilizables.

---

## `bibliography/`

Contiene las referencias bibliográficas utilizadas por el documento.

### `references.bib`

Archivo de bibliografía en formato **BibTeX/Biber**.

Estructura de cualquier entrada:
```bibtex
@tipo{clave-unica,
    campo1 = {valor},
    campo2 = {valor},
    campo3 = {valor}
}
```

Ejemplo:

```bibtex
@book{ejemplo2026,
    author    = {Apellido, Nombre},
    title     = {Título del libro},
    year      = {2026},
    publisher = {Editorial}
}
```

La configuración del proyecto puede utilizar:

```latex
\addbibresource{bibliography/references.bib}
```

Para citar una referencia:

```latex
\parencite{ejemplo2026}
```
#### Resumen práctico para tu proyecto

Para documentos académicos, probablemente utilizarás principalmente:
```
@book           → Libros
@article        → Artículos científicos o académicos
@online         → Páginas web y recursos en Internet
@incollection   → Capítulos de libros
@inproceedings  → Conferencias y congresos
@report         → Informes técnicos o institucionales
@thesis         → Tesis o trabajos de grado
@manual         → Manuales y documentación técnica
@misc           → Otros recursos
```
Esto ya se encuentra en *`references.bib`*

---

## `build/`

Contiene los archivos generados durante el proceso de compilación.

Entre ellos pueden encontrarse:

```text
main.log
main.bcf
main.bbl
main.pdf
```

Este directorio permite separar los archivos temporales y de compilación del código fuente del proyecto.

Los archivos como:

```text
main.bbl-SAVE-ERROR
main.bcf-SAVE-ERROR
```

pueden corresponder a archivos temporales o generados durante errores de guardado o compilación.

En un proyecto controlado con Git, normalmente, y de manera recomendable el directorio `build` y todo su contenido puede incluirse en `.gitignore`, dependiendo de si se desea versionar el PDF generado.

```
/build
/build/*
```

---

## `config/`

Centraliza la configuración del documento.

### `metadata.tex`

Contiene la información variable del proyecto.

Por ejemplo:

```latex
\title{Título del proyecto}
\author{Nombre del autor}
\shorttitle{Título corto}
\authorsaffiliations{Institución}
```

Este archivo es uno de los principales puntos de modificación al reutilizar la plantilla.

### `packages.tex`

Contiene los paquetes utilizados por el documento.

Ejemplo:

```latex
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[spanish]{babel}
\usepackage{graphicx}
\usepackage{booktabs}
\usepackage{amsmath}
\usepackage{tikz}
\usepackage{hyperref}
```

También puede incluir la configuración de `biblatex`:

```latex
\usepackage[
    backend=biber,
    style=apa
]{biblatex}
```

### `settings.tex`

Contiene configuraciones generales del documento.

Por ejemplo:

- Colores institucionales.
- Configuración de enlaces.
- Márgenes adicionales.
- Estilos personalizados.
- Configuración de TikZ.
- Comandos reutilizables.
- Tipografías.

Ejemplo:

```latex
\definecolor{compensarOrange}{RGB}{255,102,22}
\definecolor{compensarLight}{RGB}{255,210,180}
```

---

## `content/`

Contiene el cuerpo principal del documento.

Actualmente está dividido en:

```text
01-introduccion.tex
02-marco-teorico.tex
03-desarrollo.tex
04-conclusiones.tex
```

La numeración permite mantener un orden explícito entre los archivos.

Ejemplo:

```latex
% content/01-introduccion.tex

\section{Introducción}

Contenido de la introducción.
```

### Adaptación para futuros proyectos

La estructura puede modificarse según el tipo de documento.

Por ejemplo:

```text
content/
├── 01-introduccion.tex
├── 02-planteamiento-del-problema.tex
├── 03-objetivos.tex
├── 04-marco-teorico.tex
├── 05-metodologia.tex
├── 06-desarrollo.tex
├── 07-resultados.tex
└── 08-conclusiones.tex
```

También pueden agregarse o eliminarse archivos según los requerimientos académicos o técnicos.

---

## `frontmatter/`

Contiene las secciones preliminares del documento.

### `cover.tex`

Contiene el diseño y contenido de la portada.

Puede incluir:

- Logotipo institucional.
- Título.
- Nombre del autor.
- Programa académico.
- Asignatura.
- Docente.
- Fecha.
- Elementos gráficos con TikZ.

### `abstract.tex`

Contiene el resumen del documento.

### `acknowledgments.tex`

Contiene los agradecimientos.

Estas secciones pueden utilizarse, modificarse o eliminarse dependiendo de los requisitos del proyecto.

---

## `scripts/`

Contiene scripts auxiliares para automatizar tareas del proyecto.

### `create-content.sh`

Script para crear automáticamente archivos de contenido.

Ejemplo:

```bash
# Número inicial.
start=0

# Nombres de las secciones.
names=(
    introduccion
    marco-teorico
    desarrollo
    conclusiones
)

# Recorre los nombres.
for ((i=0; i<${#names[@]}; i++)); do

    # Genera la numeración.
    if (( start == 0 )); then
        # Con 0, comienza desde 01.
        number=$(printf "%02d" $((i + 1)))
    else
        # Con otro valor, comienza desde start + 1. Ej: start=3 → "04-archivo".tex.
        number=$(printf "%02d" $((start + $((i + 1)))))
    fi

    # Crea el archivo.
    touch "$PROJECT_ROOT/content/${number}-${names[$i]}.tex"
done
```

Para ejecutarlo en una terminal Linux:

```bash
chmod +x scripts/create-content.sh
./scripts/create-content.sh
```

El script puede adaptarse para crear nuevas estructuras de capítulos, solo debe cambiarse los nombres y agregar los que desee, generándose como `i-[names].tex`. Además, si se desea usar en otros directorios ir a la línea:

```bash
    touch "content/${number}-${names[$i]}.tex"
```
Y cambiar `content` por otra carpeta que se requiera.

### `create-content.ps1`
Para Windows es igual, pero con el archivo `.ps1`. Ingresar y editar el archivo según su conveniencia entre nombre y orden del valor del archivo, después de ejecutarlo de manera gráfica (clic derecho>Run Whit PowerShell) o por la terminal de PowerShell.

Para ejecutar en PowerShell por CLI, ingresar a la carpeta `/scripts` y ejecutar:

```powershell
.\create-content.ps1
```

---

# Flujo de trabajo para nuevos proyectos

Para reutilizar esta plantilla, se recomienda seguir el siguiente proceso.

## 1. Crear una copia de la plantilla

Mantener el proyecto original como base y crear una copia para el nuevo trabajo.

```bash
cp -r plantilla-latex nuevo-proyecto
```

Luego acceder al nuevo proyecto:

```bash
cd nuevo-proyecto
```

---

## 2. Modificar los metadatos

Actualizar:

```text
config/metadata.tex
```

Con la información correspondiente al nuevo proyecto.

Por ejemplo:

- Título.
- Autor.
- Título corto.
- Institución.
- Información académica.

---

## 3. Adaptar la portada

Modificar:

```text
frontmatter/cover.tex
```

Según los requisitos del trabajo.

La estructura visual puede conservarse, mientras se actualizan los datos necesarios.

---

## 4. Definir la estructura del contenido

Modificar los archivos dentro de:

```text
content/
```

Agregar, eliminar o reorganizar capítulos según el proyecto.

Si se modifica la estructura, también se debe actualizar:

```text
main.tex
```

para incluir los nuevos archivos mediante:

```latex
\input{content/nombre-del-archivo.tex}
```

---

## 5. Agregar recursos

Incorporar las imágenes necesarias en:

```text
assets/images/
```

Y otros recursos relacionados con tablas en:

```text
assets/tables/
```

---

## 6. Actualizar la bibliografía

Agregar las referencias utilizadas en:

```text
bibliography/references.bib
```

---

## 7. Compilar el documento

Dependiendo del entorno utilizado, la compilación puede realizarse mediante:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

También puede utilizarse una herramienta como `latexmk`:

```bash
latexmk -pdf main.tex
```

Si se utiliza `biblatex` con `biber`, es importante que el sistema de compilación esté configurado para utilizar **Biber**.

---

### Visual Studio Code

En caso de usar Visual Studio Code, tener las herramientas de compilación `StrawBerry Perl` y administración de paquetes `Miktek Console` e instalar las extensiones de `LaTeX Workshop` y el soporte de lenguaje de `Latex`

En `settings.json` a nivel de usuario desde cualquier parte, respetando la sintaxis de JSON que no afecte otras extensiones evitando el punto anterior para la compilación manual.

Agregar la siguiente configuración para un compilado optimo, personal y sin limitaciones:

```json
{
  "latex-workshop.latex.tools": [
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": [
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
        "-file-line-error",
        "-outdir=build",
        "%DOC%"
      ]
    },
    {
      "name": "copiar-pdf-raiz",
      "command": "cmd.exe",
      "args": [
        "/d",
        "/c",
        "copy",
        "/Y",
        "%DIR_W32%\\build\\%DOCFILE%.pdf",
        "%DIR_W32%\\%DOCFILE%.pdf"
      ]
    }
  ],
  "latex-workshop.latex.outDir": "%DIR%",
  "latex-workshop.latex.recipes": [
    {
      "name": "latexmk (biber)",
      "tools": [
        "latexmk",
        "copiar-pdf-raiz"
      ]
    }
  ],
  "latex-workshop.latex.autoBuild.run": "onSave",
  "[jsonc]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[latex]": {
    "editor.defaultFormatter": "mathematic.vscode-latex"
  },
  "latex-workshop.latex.clean.method": "glob",
  "latex-workshop.latex.clean.fileTypes": [
    "*.aux",
    "*.bbl",
    "*.bcf",
    "*.bbl*",
    "*.bcf*",
    "*.blg",
    "*.fdb_latexmk",
    "*.fls",
    "*.log",
    "*.out",
    "*.run.xml",
    "*.synctex.gz",
    "*.toc"
  ],
  "latex-workshop.latex.clean.subfolder.enabled": true,
  "latex-workshop.latex.autoClean.run": "onBuilt"
}

```
# Fase principal de modificación

Esta plantilla está diseñada para que la estructura técnica pueda reutilizarse.

En cada nuevo proyecto, la principal fase de trabajo consiste en adaptar el contenido según los requisitos específicos.

Las áreas que normalmente deberán modificarse son:

| Componente | Ubicación |
|---|---|
| Metadatos | `config/metadata.tex` |
| Configuración | `config/settings.tex` |
| Portada | `frontmatter/cover.tex` |
| Resumen | `frontmatter/abstract.tex` |
| Agradecimientos | `frontmatter/acknowledgments.tex` |
| Capítulos | `content/` |
| Bibliografía | `bibliography/references.bib` |
| Imágenes | `assets/images/` |
| Tablas y recursos | `assets/tables/` |

La estructura de directorios puede mantenerse como base, mientras que los archivos internos evolucionan de acuerdo con:

- El tipo de proyecto.
- Los requisitos académicos.
- La institución.
- La metodología utilizada.
- La cantidad de capítulos.
- Las normas de presentación.
- Los recursos visuales necesarios.

---

# Recomendaciones

## Mantener responsabilidades separadas

Evitar concentrar toda la configuración y contenido en `main.tex`.

Preferir:

```latex
\input{config/metadata.tex}
\input{config/packages.tex}
\input{config/settings.tex}
```

Y separar el contenido:

```latex
\input{content/01-introduccion.tex}
\input{content/02-marco-teorico.tex}
```

---

## Mantener nombres ordenados

Se recomienda utilizar una numeración de dos dígitos:

```text
01-introduccion.tex
02-marco-teorico.tex
03-metodologia.tex
04-desarrollo.tex
05-conclusiones.tex
```

Esto facilita el ordenamiento visual de los archivos.

---

## No editar directamente los archivos de compilación

Los archivos ubicados en:

```text
build/
```

Son generados durante la compilación y normalmente no deben editarse manualmente.

Las modificaciones deben realizarse en los archivos fuente:

```text
main.tex
config/
content/
frontmatter/
bibliography/
```

---

# Objetivo de la plantilla

El objetivo de esta estructura es proporcionar una base reutilizable para futuros documentos desarrollados en LaTeX.

La arquitectura del proyecto puede conservarse entre trabajos, mientras que el contenido, la organización de capítulos, los metadatos y los recursos se adaptan a las necesidades de cada nuevo proyecto.

```text
PLANTILLA
    │
    ├── Configuración reutilizable
    ├── Estructura de directorios
    ├── Automatización
    └── Diseño base
            │
            ▼
      NUEVO PROYECTO
            │
            ├── Modificación de metadatos
            ├── Adaptación de portada
            ├── Cambio de contenido
            ├── Nuevos capítulos
            ├── Nuevas referencias
            └── Nuevos recursos
```

De esta forma, el proyecto funciona como una **plantilla base reutilizable**, reduciendo la necesidad de reconstruir la estructura y configuración de LaTeX desde cero para cada nuevo trabajo.