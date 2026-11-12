# Revisa que tu computadora está lista para el taller y te dice qué falta.
# Uso, dentro de la carpeta del repo:
#   powershell -ExecutionPolicy Bypass -File setup\verificar.ps1
$script:faltan = 0
function Ok($texto)            { Write-Host "  OK      $texto" }
function Falta($texto, $como)  { Write-Host "  FALTA   $texto"; Write-Host "          -> $como"; $script:faltan++ }
function Aviso($texto, $como)  { Write-Host "  AVISO   $texto"; Write-Host "          -> $como" }
function Tiene($comando)       { [bool](Get-Command $comando -ErrorAction SilentlyContinue) }

Write-Host "== Herramientas =="
if (Tiene git)  { Ok "Git ($((git --version) -replace 'git version ', ''))" } else { Falta "Git" "powershell -ExecutionPolicy Bypass -File setup\instalar.ps1" }
if (Tiene code) { Ok "VS Code" } else { Aviso "VS Code (comando code)" "Instálalo o usa el editor que prefieras" }
if (Tiene node) { Ok "Node.js ($(node --version))" } else { Aviso "Node.js" "Hace falta para OpenCode y para muchas pruebas web" }
if (Tiene gh)   { Ok "GitHub CLI" } else { Falta "GitHub CLI (gh)" "powershell -ExecutionPolicy Bypass -File setup\instalar.ps1" }
if (Tiene opencode) { Ok "OpenCode" } else { Aviso "OpenCode" "Es el respaldo si se acaba Copilot: npm install -g @opencode/cli" }

Write-Host "== Git =="
if (Tiene git) {
    $nombre = git config --global user.name
    $correo = git config --global user.email
    if ($nombre) { Ok "Nombre: $nombre" } else { Falta "Tu nombre en Git" "powershell -ExecutionPolicy Bypass -File setup\configurar-git.ps1" }
    if ($correo) { Ok "Correo: $correo" } else { Falta "Tu correo en Git" "powershell -ExecutionPolicy Bypass -File setup\configurar-git.ps1" }
    $rama = git branch --show-current 2>$null
    if ($LASTEXITCODE -ne 0) { Aviso "Esta carpeta no es un repo" "Corre el script dentro de la carpeta del repo" }
    elseif ($rama -eq "main") { Aviso "Estás en main" "Para trabajar crea una rama: git switch -c tipo/numero-descripcion" }
    else { Ok "Rama actual: $rama" }
}

Write-Host "== GitHub =="
if (Tiene gh) {
    $estado = (gh auth status 2>&1 | Out-String)
    if ($LASTEXITCODE -eq 0) {
        Ok "Sesión iniciada en GitHub CLI"
        if ($estado -match "project") { Ok "Permiso de proyectos (tablero)" }
        else { Aviso "Sin permiso de proyectos" "Para crear el tablero por comandos: gh auth refresh -s project" }
    } else {
        Falta "Sesión en GitHub CLI" "gh auth login"
    }
}
if ($env:GITHUB_TOKEN) { Ok "GITHUB_TOKEN definido (para OpenCode)" }
else { Aviso "GITHUB_TOKEN no definido" "Solo hace falta si usas OpenCode con el MCP: mira docs\INSTALACION.md" }

Write-Host "== Repo =="
foreach ($f in @("AGENTS.md", ".vscode\mcp.json", "opencode.json", ".agents\skills", "docs\constitution.md")) {
    if (Test-Path $f) { Ok $f } else { Falta $f "Falta en esta carpeta: revisa que estás en la raíz del repo" }
}

Write-Host ""
if ($script:faltan -eq 0) { Write-Host "Todo listo. Sigue con docs\GUIA-INICIO.md" }
else { Write-Host "Pendientes: $($script:faltan). Resuélvelos y corre este script otra vez." }
