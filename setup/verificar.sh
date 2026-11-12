#!/usr/bin/env bash
# Revisa que tu computadora está lista para el taller y te dice qué falta.
# Uso, dentro de la carpeta del repo: bash setup/verificar.sh
FALTAN=0
ok()    { echo "  OK      $1"; }
falta() { echo "  FALTA   $1"; echo "          -> $2"; FALTAN=$((FALTAN+1)); }
aviso() { echo "  AVISO   $1"; echo "          -> $2"; }
tiene() { command -v "$1" >/dev/null 2>&1; }

echo "== Herramientas =="
tiene git  && ok "Git ($(git --version | cut -d' ' -f3))" || falta "Git" "bash setup/instalar.sh"
tiene code && ok "VS Code"                                || aviso "VS Code (comando code)" "Instálalo o usa el editor que prefieras"
tiene node && ok "Node.js ($(node --version))"            || aviso "Node.js" "Hace falta para OpenCode y para muchas pruebas web"
tiene gh   && ok "GitHub CLI"                             || falta "GitHub CLI (gh)" "bash setup/instalar.sh"
tiene opencode && ok "OpenCode"                           || aviso "OpenCode" "Es el respaldo si se acaba Copilot: npm install -g @opencode/cli"

echo "== Git =="
if tiene git; then
  [ -n "$(git config --global user.name)" ]  && ok "Nombre: $(git config --global user.name)"  || falta "Tu nombre en Git" "bash setup/configurar-git.sh"
  [ -n "$(git config --global user.email)" ] && ok "Correo: $(git config --global user.email)" || falta "Tu correo en Git" "bash setup/configurar-git.sh"
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    RAMA="$(git branch --show-current)"
    [ "$RAMA" = "main" ] && aviso "Estás en main" "Para trabajar crea una rama: git switch -c tipo/numero-descripcion" || ok "Rama actual: $RAMA"
  else
    aviso "Esta carpeta no es un repo" "Corre el script dentro de la carpeta del repo"
  fi
fi

echo "== GitHub =="
if tiene gh; then
  if gh auth status >/dev/null 2>&1; then
    ok "Sesión iniciada en GitHub CLI"
    gh auth status 2>&1 | grep -q "project" && ok "Permiso de proyectos (tablero)" || aviso "Sin permiso de proyectos" "Para crear el tablero por comandos: gh auth refresh -s project"
  else
    falta "Sesión en GitHub CLI" "gh auth login"
  fi
fi
[ -n "$GITHUB_TOKEN" ] && ok "GITHUB_TOKEN definido (para OpenCode)" || aviso "GITHUB_TOKEN no definido" "Solo hace falta si usas OpenCode con el MCP: mira docs/INSTALACION.md"

echo "== Repo =="
for f in AGENTS.md .vscode/mcp.json opencode.json .agents/skills docs/constitution.md; do
  [ -e "$f" ] && ok "$f" || falta "$f" "Falta en esta carpeta: ¿estás en la raíz del repo?"
done

echo
if [ "$FALTAN" -eq 0 ]; then echo "Todo listo. Sigue con docs/GUIA-INICIO.md"; else echo "Pendientes: $FALTAN. Resuélvelos y corre este script otra vez."; fi
