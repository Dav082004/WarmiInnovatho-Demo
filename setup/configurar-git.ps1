# Configura Git para trabajar en equipo (Windows).
# Uso, desde PowerShell en la carpeta del repo:
#   powershell -ExecutionPolicy Bypass -File setup\configurar-git.ps1

Write-Host "== Configuracion de Git para la Warmi Innovathon =="

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git no esta instalado. Descargalo de https://git-scm.com y vuelve a correr este script."
    exit 1
}

$actualNombre = git config --global user.name
$actualCorreo = git config --global user.email

$nombre = Read-Host "Tu nombre [$actualNombre]"
$correo = Read-Host "El correo de tu cuenta de GitHub [$actualCorreo]"
if ([string]::IsNullOrWhiteSpace($nombre)) { $nombre = $actualNombre }
if ([string]::IsNullOrWhiteSpace($correo)) { $correo = $actualCorreo }

if ([string]::IsNullOrWhiteSpace($nombre) -or [string]::IsNullOrWhiteSpace($correo)) {
    Write-Host "Hacen falta el nombre y el correo. No se cambio nada."
    exit 1
}

git config --global user.name "$nombre"
git config --global user.email "$correo"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf true

Write-Host ""
Write-Host "Listo. Tu configuracion:"
git config --global --get-regexp "^(user\.|init\.defaultbranch|pull\.rebase|core\.autocrlf)"

Write-Host ""
Write-Host "Probando la conexion con GitHub..."
git ls-remote https://github.com/github/gitignore.git HEAD *> $null
if ($LASTEXITCODE -eq 0) {
    Write-Host "Conexion con GitHub: OK"
} else {
    Write-Host "No se pudo conectar con GitHub. Revisa tu internet."
}
