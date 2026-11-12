# Crea las etiquetas del equipo en el repo (necesita GitHub CLI con sesión iniciada: gh auth login).
# Uso, dentro de la carpeta del repo: powershell -ExecutionPolicy Bypass -File setup\crear-etiquetas.ps1
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "Falta GitHub CLI (gh). Corre primero setup\instalar.ps1"
    exit 1
}

function Crear($nombre, $color, $descripcion) {
    gh label create $nombre --color $color --description $descripcion --force | Out-Null
    Write-Host "  etiqueta: $nombre"
}

Write-Host "Creando etiquetas..."
Crear "tarea"                "0e8a16" "Algo que hay que construir o hacer"
Crear "bug"                  "d73a4a" "Algo no funciona como debería"
Crear "área: diseño"         "d876e3" "Diseño de interfaz, mockups y estilos"
Crear "área: frontend"       "1d76db" "Páginas, componentes e interacción"
Crear "área: backend-datos"  "5319e7" "Lógica, datos y servicios"
Crear "área: pruebas"        "fbca04" "Pruebas automáticas y revisión de calidad"
Crear "área: despliegue"     "0052cc" "Publicar la demo y configurar el entorno"
Crear "área: docs-pitch"     "c5def5" "README, guía y presentación"
Crear "bloqueada"            "b60205" "No se puede avanzar hasta resolver otra cosa"
Write-Host "Listo."
