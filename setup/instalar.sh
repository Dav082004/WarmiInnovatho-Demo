#!/usr/bin/env bash
# Instala las herramientas del taller en Mac (Homebrew) o Linux (apt).
# Uso: bash setup/instalar.sh
# Es seguro correrlo más de una vez: omite lo que ya está instalado.

echo "== Instalador de herramientas para la Warmi Innovathon =="

SO="$(uname -s)"
tiene() { command -v "$1" >/dev/null 2>&1; }

if [ "$SO" = "Darwin" ]; then
  if ! tiene brew; then
    echo "Falta Homebrew. Instálalo desde https://brew.sh y corre este script otra vez."
    exit 1
  fi
  instalar_git()  { brew install git; }
  instalar_node() { brew install node; }
  instalar_gh()   { brew install gh; }
  instalar_code() { brew install --cask visual-studio-code; }
elif [ "$SO" = "Linux" ] && tiene apt-get; then
  echo "Se usará sudo para instalar paquetes."
  instalar_git()  { sudo apt-get update -qq && sudo apt-get install -y git; }
  instalar_node() { sudo apt-get install -y nodejs npm; }
  instalar_gh()   { sudo apt-get install -y gh; }
  instalar_code() { echo "  VS Code en Linux: descárgalo de https://code.visualstudio.com y vuelve a correr el script."; }
else
  echo "Este script cubre Mac y Linux con apt. En otro sistema, instala a mano:"
  echo "Git (git-scm.com), VS Code (code.visualstudio.com) y Node (nodejs.org)."
  exit 1
fi

[ -n "$(command -v git)" ]  && echo "[ya instalado] Git"            || { echo "[instalando]   Git...";            instalar_git; }
[ -n "$(command -v code)" ] && echo "[ya instalado] VS Code"        || { echo "[instalando]   VS Code...";        instalar_code; }
[ -n "$(command -v node)" ] && echo "[ya instalado] Node.js"        || { echo "[instalando]   Node.js...";        instalar_node; }
[ -n "$(command -v gh)" ]   && echo "[ya instalado] GitHub CLI"     || { echo "[instalando]   GitHub CLI...";     instalar_gh; }

# OpenCode (agente de respaldo si se acaban los tokens de Copilot)
if tiene opencode; then
  echo "[ya instalado] OpenCode"
elif tiene npm; then
  echo "[instalando]   OpenCode..."
  npm install -g @opencode/cli || echo "  Si falla por permisos, usa: sudo npm install -g @opencode/cli"
else
  echo "[pendiente]    OpenCode: abre una terminal nueva y corre este script otra vez."
fi

# Extensiones de VS Code
if tiene code; then
  for ext in GitHub.copilot GitHub.copilot-chat GitHub.vscode-pull-request-github; do
    echo "[extensión]    $ext"
    code --install-extension "$ext" --force >/dev/null 2>&1
  done
else
  echo "[pendiente]    Extensiones de VS Code: instala VS Code y corre este script otra vez."
fi

echo
echo "== Resumen =="
for c in git code node npm gh opencode; do
  if tiene "$c"; then echo "  OK       $c"; else echo "  FALTA    $c"; fi
done

echo
echo "Siguientes pasos:"
echo "  1. bash setup/configurar-git.sh"
echo "  2. gh auth login          (inicia sesión en GitHub)"
echo "  3. Abre VS Code e inicia sesión con tu cuenta de GitHub"
echo "  4. Sigue docs/GUIA-INICIO.md"
