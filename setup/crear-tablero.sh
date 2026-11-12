#!/usr/bin/env bash
# Crea el tablero de GitHub Projects del equipo, con los campos Área y RF, y lo enlaza con este repo.
# Antes, una sola vez: gh auth refresh -s project
# Uso, dentro de la carpeta del repo: bash setup/crear-tablero.sh "Nombre del proyecto"
set -e
command -v gh >/dev/null 2>&1 || { echo "Falta GitHub CLI (gh). Corre primero setup/instalar.sh"; exit 1; }

TITULO="${1:-Tablero del equipo}"
REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
DUENO="${REPO%%/*}"

echo "Creando el tablero \"$TITULO\" para $DUENO..."
NUMERO="$(gh project create --owner "$DUENO" --title "$TITULO" --format json -q .number)" || {
  echo "No se pudo crear. Corre: gh auth refresh -s project   y vuelve a intentar, o créalo desde la web."
  exit 1
}

gh project field-create "$NUMERO" --owner "$DUENO" --name "Área" --data-type SINGLE_SELECT \
  --single-select-options "Diseño,Frontend,Backend y datos,Pruebas,Despliegue,Docs y pitch" >/dev/null \
  && echo "  campo: Área"
gh project field-create "$NUMERO" --owner "$DUENO" --name "RF" --data-type TEXT >/dev/null \
  && echo "  campo: RF"
gh project link "$NUMERO" --owner "$DUENO" --repo "$REPO" >/dev/null \
  && echo "  enlazado con $REPO"

echo "Listo. Tablero número $NUMERO:"
gh project view "$NUMERO" --owner "$DUENO" --format json -q .url
echo "Ahora abre ese enlace y sigue el paso 2 de docs/ISSUES-Y-TABLERO.md para la vista de tablero."
