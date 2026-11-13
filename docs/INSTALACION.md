# Instalar todo lo que necesitas

Una persona del equipo con ganas de ayudar puede dejar a todas listas en 15 minutos. Hay dos caminos: **con script** (recomendado) o **a mano**.

## Qué se instala y para qué

| Herramienta | Para qué | Obligatoria |
| --- | --- | --- |
| **Git** | Guardar y compartir los cambios del código | Sí |
| **VS Code** | Editor donde corre el agente de Copilot | Sí (o el editor que prefieras) |
| **Node.js** | Ejecutar pruebas y servidores de muchas tecnologías web, e instalar OpenCode | Recomendada |
| **GitHub CLI (`gh`)** | Crear etiquetas y el tablero desde la terminal, y iniciar sesión en GitHub | Recomendada |
| **GitHub Copilot** (extensión de VS Code) | El agente principal. Con GitHub Education tienes Copilot Student; si aún no se activa, sirve Copilot Free | Una de las dos opciones de agente |
| **OpenCode** | Agente de respaldo en la terminal, por si se acaban los tokens de Copilot | Una de las dos opciones de agente |

Las herramientas son de libre elección: si tu equipo prefiere otro editor, otro lenguaje u otro agente, las reglas de `AGENTS.md` y la spec siguen valiendo.

## Camino 1: con script

### Windows

Abre PowerShell dentro de la carpeta del repo y corre:

```powershell
powershell -ExecutionPolicy Bypass -File setup\instalar.ps1
```

Usa `winget` (viene con Windows 10 y 11) para instalar Git, VS Code, Node y GitHub CLI; luego instala OpenCode y las extensiones de VS Code. Si algo queda como **FALTA**, cierra y abre PowerShell y corre el script otra vez: Windows solo actualiza el PATH en ventanas nuevas.

### Mac o Linux

```bash
bash setup/instalar.sh
```

En Mac necesitas [Homebrew](https://brew.sh). En Linux (Ubuntu o Debian) usa `apt` y te pedirá tu contraseña (`sudo`). El script es seguro de correr varias veces: se salta lo que ya tienes.

### Después del script (todas, en este orden)

1. **Configura Git** con tu nombre y tu correo de GitHub:
   - Windows: `powershell -ExecutionPolicy Bypass -File setup\configurar-git.ps1`
   - Mac o Linux: `bash setup/configurar-git.sh`
2. **Inicia sesión en GitHub CLI:** `gh auth login` (elige GitHub.com, HTTPS y el navegador).
3. **Abre VS Code** e inicia sesión con tu cuenta de GitHub (icono de cuenta, abajo a la izquierda). Así se activa Copilot.
4. **Comprueba** que todo responde:

```bash
git --version
node --version
gh --version
opencode --version
```

## Camino 2: a mano

El paso a paso de cada herramienta, con su documentación oficial, está en la [Parte 1 del README del kit](https://github.com/Dav082004/WarmiInnovathon-#parte-1--configura-tu-computadora-paso-a-paso). Resumen:

| Herramienta | Dónde se descarga | Documentación oficial |
| --- | --- | --- |
| Git | https://git-scm.com/downloads | [Pro Git en español](https://git-scm.com/book/es/v2) |
| VS Code | https://code.visualstudio.com/download | [Instalar VS Code](https://code.visualstudio.com/docs/setup/setup-overview) |
| Node.js (LTS) | https://nodejs.org/es/download | [Node.js](https://nodejs.org/es/download) |
| GitHub CLI | https://cli.github.com | [Manual de `gh`](https://cli.github.com/manual/) |
| Extensiones de VS Code | Busca **GitHub Copilot**, **GitHub Copilot Chat** y **GitHub Pull Requests** en el panel de extensiones, o deja que VS Code las sugiera al abrir este repo | [Copilot en VS Code](https://code.visualstudio.com/docs/copilot/setup) |
| OpenCode | `npm install -g @opencode/cli` (versión 2). En Windows también puedes bajar el `.zip` desde https://opencode.ai. Si ya tienes la versión 1 (`opencode-ai`), también sirve con este repo | [Documentación de OpenCode](https://opencode.ai/docs/) |

## Conectar el agente con GitHub (MCP)

El MCP es lo que permite que el agente cree issues, mueva tarjetas del tablero y abra pull requests por ti. Ya está configurado en el repo.

**Con Copilot en VS Code**

1. Abre la carpeta del repo en VS Code.
2. Abre `.vscode/mcp.json` y pulsa **Start** sobre el servidor `github`. Autoriza con tu cuenta. Si no ves **Start**, abre la paleta de comandos (`Ctrl+Shift+P`) y busca **MCP: List Servers**.
3. En el chat de Copilot cambia el modo a **Agent**. Pulsa el icono de herramientas y confirma que aparecen las de GitHub.
4. Prueba: *"¿Qué issues abiertos hay en este repo?"*

**Configuración global de Copilot (`mcp-config.json`)**

`.vscode/mcp.json` (en el repo) lo usa el chat de Copilot en VS Code; este archivo, `mcp-config.json` (en tu carpeta de usuario), lo usa Copilot en la terminal (Copilot CLI) en cualquier carpeta. Tener los dos no choca.

Hazlo una vez por computadora, desde **tu cuenta principal de Windows** (o tu usuario de Mac/Linux), porque el archivo vive en tu carpeta de usuario y no en el repo.

| Sistema | Ruta del archivo |
| --- | --- |
| Windows | `C:\Users\<tu-usuario>\.copilot\mcp-config.json` (`$env:USERPROFILE\.copilot\mcp-config.json`) |
| Mac o Linux | `~/.copilot/mcp-config.json` |

1. Crea la carpeta y abre el archivo: en Windows, `New-Item -ItemType Directory -Force "$env:USERPROFILE\.copilot"` y luego `notepad "$env:USERPROFILE\.copilot\mcp-config.json"`; en Mac o Linux, `mkdir -p ~/.copilot && code ~/.copilot/mcp-config.json`.
2. Pega este contenido y guarda (si ya hay otros servidores, agrega solo el bloque `github` dentro de `mcpServers`):

   ```json
   {
     "mcpServers": {
       "github": {
         "type": "http",
         "url": "https://api.githubcopilot.com/mcp/",
         "tools": ["*"]
       }
     }
   }
   ```

3. Ve a configurarlo: cierra y abre Copilot otra vez, confirma que `github` aparece en la lista de servidores MCP y autoriza con tu cuenta de GitHub.

Nunca pongas un token en este archivo ni lo copies dentro del repo.

**Con OpenCode**

1. En GitHub: **Settings → Developer settings → Personal access tokens**. Crea un token con permisos de `repo` y `project`.
2. Guárdalo en una variable de entorno, nunca en un archivo del repo:
   - Windows (PowerShell): `[Environment]::SetEnvironmentVariable("GITHUB_MCP_TOKEN", "pega-tu-token", "User")` y abre una terminal nueva.
   - Mac o Linux: agrega `export GITHUB_MCP_TOKEN=pega-tu-token` a `~/.zshrc` o `~/.bashrc`.
   - **No uses el nombre `GITHUB_TOKEN`**: OpenCode lo toma también para entrar a GitHub Copilot, y Copilot rechaza los tokens personales.
3. En la carpeta del repo corre `opencode`. La primera vez escribe `/connect` para elegir tu proveedor de modelos (por ejemplo **GitHub Copilot**, que entra con tu cuenta de GitHub).
4. Elige el agente con `/agents` (o `Shift+Tab` para pasar al siguiente; en la versión 1 es `Tab`).
5. Revisa que el MCP conectó: `opencode mcp list` en la terminal. Debe aparecer `github`.

## Si algo falla

| Problema | Qué hacer |
| --- | --- |
| `winget` no existe | Actualiza **Instalador de aplicación** en Microsoft Store, o instala a mano |
| `git`, `node` o `opencode` "no se reconoce" | Cierra y abre la terminal; el PATH se actualiza en ventanas nuevas |
| `npm install -g` da error de permisos | Mac o Linux: `sudo npm install -g @opencode/cli` |
| No sé qué me falta | Corre `setup/verificar.sh` o `setup\verificar.ps1`: revisa cada herramienta y te dice el siguiente paso |
| Las etiquetas salen con letras raras (`Ã¡rea`) | Vuelve a descargar el repo y corre el script otra vez; los `.ps1` deben conservar su codificación UTF-8 con BOM |
| OpenCode no conecta con GitHub | Revisa que `GITHUB_MCP_TOKEN` exista en una terminal **nueva** y que el token tenga permisos de `repo` y `project` |
| `opencode mcp list` dice `Authorization header is badly formatted` aunque ya creaste la variable | Quedó abierto un proceso de OpenCode de antes. Ciérralo (`Stop-Process -Name opencode -Force` en Windows, `pkill opencode` en Mac o Linux), abre una terminal nueva y vuelve a probar |
| `opencode mcp list` dice `No MCP servers configured` | Si acabas de abrir OpenCode, todavía está cargando: corre el comando otra vez |
| `Personal Access Tokens are not supported for this endpoint` | Tienes el token en la variable `GITHUB_TOKEN` y Copilot lo está usando. Bórrala (`[Environment]::SetEnvironmentVariable("GITHUB_TOKEN", $null, "User")`), usa `GITHUB_MCP_TOKEN` y cierra los procesos de OpenCode |
| VS Code no muestra las herramientas de GitHub | Revisa que `.vscode/mcp.json` esté en la carpeta abierta y pulsa **Start** |
| Copilot no ve el servidor de `mcp-config.json` | Revisa que el archivo esté en **tu** carpeta de usuario (`$env:USERPROFILE\.copilot\` en Windows, `~/.copilot/` en Mac o Linux), que el JSON sea válido (sin comas de más) y reinicia Copilot |
| El MCP no ve el tablero de Projects | Cierra sesión y vuelve a entrar para aceptar el permiso de proyectos, o usa el tablero desde la web |
| Copilot dice que no hay cuota | Pasa a OpenCode, o a Copilot Free |

> Los comandos de `gh`, la configuración del MCP y la de OpenCode se revisaron contra la documentación oficial el 12 de noviembre de 2026. Las herramientas cambian con el tiempo: si un comando falla, instala esa herramienta a mano y sigue.
