#!/usr/bin/env bash
# Crea las etiquetas del equipo en el repo (necesita GitHub CLI con sesión iniciada: gh auth login).
# Uso, dentro de la carpeta del repo: bash setup/crear-etiquetas.sh
set -e
command -v gh >/dev/null 2>&1 || { echo "Falta GitHub CLI (gh). Corre primero setup/instalar.sh"; exit 1; }

crear() { gh label create "$1" --color "$2" --description "$3" --force >/dev/null && echo "  etiqueta: $1"; }

echo "Creando etiquetas..."
crear "tarea"          "0e8a16" "Algo que hay que construir o hacer"
crear "bug"            "d73a4a" "Algo no funciona como debería"
crear "área: diseño"       "d876e3" "Diseño de interfaz, mockups y estilos"
crear "área: frontend"     "1d76db" "Páginas, componentes e interacción"
crear "área: backend-datos" "5319e7" "Lógica, datos y servicios"
crear "área: pruebas"      "fbca04" "Pruebas automáticas y revisión de calidad"
crear "área: despliegue"   "0052cc" "Publicar la demo y configurar el entorno"
crear "área: docs-pitch"   "c5def5" "README, guía y presentación"
crear "bloqueada"      "b60205" "No se puede avanzar hasta resolver otra cosa"
echo "Listo."
