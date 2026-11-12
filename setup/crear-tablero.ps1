# Crea el tablero de GitHub Projects del equipo, con los campos Área y RF, y lo enlaza con este repo.
# Antes, una sola vez: gh auth refresh -s project
# Uso, dentro de la carpeta del repo:
#   powershell -ExecutionPolicy Bypass -File setup\crear-tablero.ps1 "Nombre del proyecto"
param([string]$Titulo = "Tablero del equipo")

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "Falta GitHub CLI (gh). Corre primero setup\instalar.ps1"
    exit 1
}

$repo = gh repo view --json nameWithOwner -q .nameWithOwner
if ($LASTEXITCODE -ne 0 -or -not $repo) {
    Write-Host "No encuentro el repo. Corre este script dentro de la carpeta del repo, con la sesión iniciada (gh auth login)."
    exit 1
}
$dueno = $repo.Split("/")[0]

Write-Host "Creando el tablero '$Titulo' para $dueno..."
$numero = gh project create --owner $dueno --title $Titulo --format json -q .number
if ($LASTEXITCODE -ne 0 -or -not $numero) {
    Write-Host "No se pudo crear. Corre: gh auth refresh -s project   y vuelve a intentar, o créalo desde la web."
    exit 1
}

gh project field-create $numero --owner $dueno --name "Área" --data-type SINGLE_SELECT --single-select-options "Diseño,Frontend,Backend y datos,Pruebas,Despliegue,Docs y pitch" | Out-Null
if ($LASTEXITCODE -eq 0) { Write-Host "  campo: Área" }
gh project field-create $numero --owner $dueno --name "RF" --data-type TEXT | Out-Null
if ($LASTEXITCODE -eq 0) { Write-Host "  campo: RF" }
gh project link $numero --owner $dueno --repo $repo | Out-Null
if ($LASTEXITCODE -eq 0) { Write-Host "  enlazado con $repo" }

Write-Host "Listo. Tablero número ${numero}:"
gh project view $numero --owner $dueno --format json -q .url
Write-Host "Ahora abre ese enlace y sigue el paso 2 de docs\ISSUES-Y-TABLERO.md para la vista de tablero."
