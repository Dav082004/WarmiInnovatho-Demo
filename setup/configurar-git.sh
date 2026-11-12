#!/usr/bin/env bash
# Configura Git para trabajar en equipo (Mac y Linux).
# Uso: bash setup/configurar-git.sh
set -e

echo "== Configuración de Git para la Warmi Innovathon =="

if ! command -v git >/dev/null 2>&1; then
  echo "Git no está instalado. Descárgalo de https://git-scm.com y vuelve a correr este script."
  exit 1
fi

actual_nombre=$(git config --global user.name || true)
actual_correo=$(git config --global user.email || true)

read -r -p "Tu nombre [${actual_nombre}]: " nombre
read -r -p "El correo de tu cuenta de GitHub [${actual_correo}]: " correo
nombre=${nombre:-$actual_nombre}
correo=${correo:-$actual_correo}

if [ -z "$nombre" ] || [ -z "$correo" ]; then
  echo "Hacen falta el nombre y el correo. No se cambió nada."
  exit 1
fi

git config --global user.name "$nombre"
git config --global user.email "$correo"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf input

echo
echo "Listo. Tu configuración:"
git config --global --get-regexp '^(user\.|init\.defaultbranch|pull\.rebase|core\.autocrlf)'

echo
echo "Probando la conexión con GitHub..."
if git ls-remote https://github.com/github/gitignore.git HEAD >/dev/null 2>&1; then
  echo "Conexión con GitHub: OK"
else
  echo "No se pudo conectar con GitHub. Revisa tu internet."
fi
