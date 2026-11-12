# Instala las herramientas del taller en Windows 10/11 con winget.
# Uso, desde PowerShell en la carpeta del repo:
#   powershell -ExecutionPolicy Bypass -File setup\instalar.ps1
# Es seguro correrlo más de una vez: omite lo que ya está instalado.

Write-Host "== Instalador de herramientas para la Warmi Innovathon =="

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "No encontré winget. Actualiza 'Instalador de aplicación' desde Microsoft Store"
    Write-Host "o instala a mano: Git (git-scm.com), VS Code (code.visualstudio.com) y Node (nodejs.org)."
    exit 1
}

$programas = @(
    @{ nombre = "Git";            id = "Git.Git";                comando = "git" },
    @{ nombre = "Visual Studio Code"; id = "Microsoft.VisualStudioCode"; comando = "code" },
    @{ nombre = "Node.js (LTS)";  id = "OpenJS.NodeJS.LTS";      comando = "node" },
    @{ nombre = "GitHub CLI";     id = "GitHub.cli";             comando = "gh" }
)

foreach ($p in $programas) {
    if (Get-Command $p.comando -ErrorAction SilentlyContinue) {
        Write-Host "[ya instalado] $($p.nombre)"
    } else {
        Write-Host "[instalando]   $($p.nombre)..."
        winget install --id $p.id -e --accept-source-agreements --accept-package-agreements
    }
}

# winget actualiza el PATH solo para ventanas nuevas: lo refrescamos para seguir en esta.
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("Path", "User")

# OpenCode (agente de respaldo si se acaban los tokens de Copilot)
if (Get-Command opencode -ErrorAction SilentlyContinue) {
    Write-Host "[ya instalado] OpenCode"
} elseif (Get-Command npm -ErrorAction SilentlyContinue) {
    Write-Host "[instalando]   OpenCode..."
    npm install -g "@opencode/cli"
} else {
    Write-Host "[pendiente]    OpenCode: cierra y abre PowerShell, y corre este script otra vez."
}

# Extensiones de VS Code
if (Get-Command code -ErrorAction SilentlyContinue) {
    foreach ($ext in @("GitHub.copilot", "GitHub.copilot-chat", "GitHub.vscode-pull-request-github")) {
        Write-Host "[extension]    $ext"
        code --install-extension $ext --force | Out-Null
    }
} else {
    Write-Host "[pendiente]    Extensiones de VS Code: cierra y abre PowerShell, y corre este script otra vez."
}

Write-Host ""
Write-Host "== Resumen =="
foreach ($c in @("git", "code", "node", "npm", "gh", "opencode")) {
    if (Get-Command $c -ErrorAction SilentlyContinue) { Write-Host "  OK       $c" }
    else { Write-Host "  FALTA    $c  (cierra y abre PowerShell, y corre el script otra vez)" }
}

Write-Host ""
Write-Host "Siguientes pasos:"
Write-Host "  1. powershell -ExecutionPolicy Bypass -File setup\configurar-git.ps1"
Write-Host "  2. gh auth login          (inicia sesion en GitHub)"
Write-Host "  3. Abre VS Code e inicia sesion con tu cuenta de GitHub (icono de cuenta, abajo a la izquierda)"
Write-Host "  4. powershell -ExecutionPolicy Bypass -File setup\verificar.ps1   (revisa que todo quedo listo)"
Write-Host "  5. Sigue docs\GUIA-INICIO.md"
