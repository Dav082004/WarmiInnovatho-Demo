# Comandos de Git: qué hace cada uno y qué hacer cuando algo sale mal

El agente con el MCP de GitHub te ahorra mucho trabajo, pero **no reemplaza entender Git**. Hay dos razones:

1. El MCP trabaja con lo que está **en GitHub** (issues, ramas remotas, pull requests, tablero). Lo que pasa **en tu computadora** (guardar cambios, cambiar de rama, traer lo nuevo) se hace con comandos de Git. El agente de VS Code puede ejecutarlos por ti en la terminal, pero te pide permiso y tú tienes que leer qué va a correr.
2. Cuando algo sale mal (un conflicto, un push rechazado, un commit equivocado), necesitas saber qué está pasando para pedirle al agente lo correcto, o para arreglarlo tú.

Esta guía está pensada para tenerla abierta mientras trabajas. Si es tu primera vez con Git, lee primero [«El mapa»](#el-mapa-dónde-viven-tus-cambios) y [«Tu día de trabajo»](#tu-día-de-trabajo-el-flujo-con-comandos).

> En esta guía usamos `git switch` (cambiar de rama) y `git restore` (deshacer cambios en archivos). Si en otro tutorial ves `git checkout`, hace lo mismo y también funciona.

---

## El mapa: dónde viven tus cambios

Tus cambios pasan por cuatro lugares. Casi todos los comandos de Git mueven cambios de uno a otro:

```
  Tu carpeta        Zona de preparación      Tu repo local        GitHub
 (editas aquí)         (staging)            (commits)           (remoto)
      │                    │                    │                  │
      │ ── git add ──────▶ │                    │                  │
      │                    │ ── git commit ───▶ │                  │
      │                    │                    │ ── git push ───▶ │
      │                    │                    │ ◀── git pull ─── │
      │ ◀──────────────────── git switch / git restore ──          │
```

La idea de la caja: **`git add`** es meter cosas en la caja, **`git commit`** es cerrarla y ponerle una etiqueta, **`git push`** es mandarla al almacén (GitHub).

---

## Los comandos imprescindibles

Estos son los que usarás el 90 % del tiempo. La última columna es **lo que le pedirías al agente** si prefieres que lo haga él (siempre lee lo que va a ejecutar).

### Mirar (no cambian nada, úsalos siempre que dudes)

| Comando | Qué hace | Con el agente |
| --- | --- | --- |
| `git status` | Dice en qué rama estás, qué archivos cambiaste y cuáles están preparados | *«¿En qué rama estoy y qué cambié?»* |
| `git diff` | Muestra **línea por línea** lo que cambiaste y todavía no preparaste | *«Muéstrame los cambios que tengo»* |
| `git diff --staged` | Igual, pero de lo que ya preparaste con `git add` | *«¿Qué va a entrar en mi próximo commit?»* |
| `git log --oneline` | Lista corta de los últimos commits | *«Muéstrame los últimos commits»* |
| `git log --oneline --graph --all` | Lo mismo, dibujando las ramas | *«Dibújame el historial de ramas»* |
| `git branch` | Lista tus ramas locales (la actual lleva `*`) | *«¿Qué ramas tengo?»* |
| `git remote -v` | Muestra a qué repo de GitHub está conectada tu carpeta | *«¿A qué repo estoy conectada?»* |

### Empezar

| Comando | Qué hace | Con el agente |
| --- | --- | --- |
| `git clone <url>` | Copia un repo de GitHub a tu computadora (una sola vez) | *«Clona este repo»* |
| `git switch main` | Te mueve a la rama `main` | *«Cámbiame a main»* |
| `git pull` | Trae lo nuevo de GitHub a tu rama actual | *«Actualiza mi rama con lo de GitHub»* |
| `git switch -c 12-filtro-area` | **Crea** una rama nueva y te mueve a ella | *«Crea la rama para el issue #12»* |
| `git switch otra-rama` | Te mueve a una rama que ya existe | *«Cámbiame a la rama 9-otra»* |

### Guardar tu trabajo

| Comando | Qué hace | Con el agente |
| --- | --- | --- |
| `git add archivo.js` | Prepara **ese** archivo para el commit | *«Prepara solo archivo.js»* |
| `git add .` | Prepara **todos** los cambios de la carpeta. Mira antes con `git status` para no meter archivos de más | *«Prepara mis cambios»* |
| `git commit -m "Agrega el filtro por área"` | Guarda lo preparado como un commit, con su mensaje | *«Haz commit con un mensaje claro»* |
| `git push -u origin 12-filtro-area` | Sube tu rama a GitHub. El `-u` solo hace falta la **primera vez** de cada rama | *«Sube mi rama»* |
| `git push` | Sube nuevos commits de una rama que ya subiste | *«Sube mis commits»* |

### Combinar con lo de otras

| Comando | Qué hace | Con el agente |
| --- | --- | --- |
| `git fetch` | Descarga lo nuevo de GitHub **sin mezclarlo** con tu trabajo | *«Revisa si hay ramas o cambios nuevos»* |
| `git merge main` | Mezcla `main` dentro de la rama donde estás (para ponerte al día) | *«Actualiza mi rama con main»* |
| `git pull` | Es `git fetch` + `git merge` juntos | *«Trae lo nuevo»* |

> **Lo que NO hace falta por comando si usas el MCP:** crear el issue, abrir el pull request, pedir revisión, mover la tarjeta del tablero y hacer comentarios. Eso lo hace el agente en GitHub. El **merge del PR** lo hace una persona, nunca la IA (regla de oro del equipo).

---

## Tu día de trabajo: el flujo con comandos

Este es el flujo completo de **una tarea** (el mismo de [CONTRIBUTING.md](../CONTRIBUTING.md)), con cada comando en su lugar:

```bash
# 1. Ponte al día antes de empezar
git switch main
git pull

# 2. Crea tu rama (el número es el del issue)
git switch -c 12-filtro-area

# 3. Trabaja: edita archivos, prueba. Cuando tengas algo que funciona:
git status                      # ¿qué cambié?
git diff                        # ¿está bien lo que cambié?
git add .
git commit -m "Agrega el filtro por área"

# 4. Sube tu rama (la primera vez lleva -u)
git push -u origin 12-filtro-area

# 5. Abre el pull request (con el agente o desde la web)
#    «Abre el PR que cierra el issue #12»

# 6. Después del merge, limpia y vuelve a empezar
git switch main
git pull
git branch -d 12-filtro-area
```

Mientras trabajas puedes hacer varios `add` + `commit` antes del `push`. Commits pequeños son más fáciles de revisar y de deshacer.

---

## Casuísticas: «si pasa esto, haz esto»

### Me di cuenta de que estoy en `main` y ya cambié cosas

No pasa nada. Crea la rama **ahora**: tus cambios viajan con ella.

```bash
git switch -c 12-filtro-area
```

### Quiero ver qué cambié antes de guardar

```bash
git status
git diff
```

### Me equivoqué y quiero tirar los cambios de un archivo (que aún no guardé en un commit)

```bash
git restore archivo.js
```

⚠️ **Esos cambios se pierden para siempre.** Si no estás segura, usa `git stash` (más abajo).

### Preparé un archivo con `git add` por error

```bash
git restore --staged archivo.js
```

El archivo sigue con sus cambios, solo sale de la zona de preparación.

### Hice un commit y me faltó un archivo (o me equivoqué en el mensaje), **y todavía no hice push**

```bash
git add archivo-que-faltaba.js
git commit --amend --no-edit              # mismo mensaje
git commit --amend -m "Mensaje corregido" # o cambiando el mensaje
```

Si ya hiciste `push`, mejor haz un commit nuevo. No reescribas lo que ya subiste.

### Quiero deshacer mi último commit, **y todavía no hice push**, pero conservar los cambios

```bash
git reset --soft HEAD~1
```

Tus cambios quedan preparados, listos para volver a hacer commit.

### Quiero deshacer un commit **que ya subí o que ya está en `main`**

No borres historia: crea un commit que lo **revierta**.

```bash
git log --oneline          # busca el código del commit (por ejemplo 54c551c)
git revert 54c551c
git push
```

### Estoy a la mitad de algo y tengo que cambiar de tarea

Guarda tu trabajo a un lado sin hacer commit:

```bash
git stash                  # guarda los cambios y deja la carpeta limpia
git switch otra-rama       # ve a hacer lo urgente
# ...cuando vuelvas:
git switch mi-rama
git stash pop              # recupera lo que guardaste
```

### `git push` dice **rejected** («fetch first» o «non-fast-forward»)

Alguien subió cambios a esa rama antes que tú. Trae lo nuevo y vuelve a subir:

```bash
git pull
git push
```

Si `git pull` te muestra un conflicto, mira la siguiente casuística.

### Mi rama quedó atrás de `main` (otras compañeras ya fusionaron cosas)

```bash
git switch main
git pull
git switch mi-rama
git merge main
```

Hazlo seguido, sobre todo antes de abrir tu PR, para que los conflictos sean chicos.

### Salió un **conflicto de merge**

Pasa cuando dos personas cambian las mismas líneas. Git no sabe cuál conservar y te lo marca en el archivo:

```text
<<<<<<< HEAD
lo que tienes en tu rama
=======
lo que viene de main
>>>>>>> main
```

Para resolverlo:

1. Abre el archivo (VS Code muestra botones *Accept Current / Incoming / Both*).
2. Decide qué queda. **Borra las líneas** `<<<<<<<`, `=======` y `>>>>>>>`.
3. Guarda y cierra la resolución:

```bash
git add archivo-con-conflicto.js
git commit                  # Git ya trae un mensaje de merge; guárdalo
git push
```

**¿Te asustaste y quieres volver a antes del merge?** Funciona mientras no hayas hecho el commit:

```bash
git merge --abort
```

Si dos personas del equipo cambian el mismo archivo, hablen **antes** de resolver. Un conflicto es una conversación, no solo un problema técnico. Con el agente: *«Explícame este conflicto y qué opciones tengo, pero no resuelvas nada hasta que yo diga»*.

### Quiero traer la rama de una compañera para probarla

```bash
git fetch
git switch nombre-de-su-rama
```

### Subí por error `node_modules/`, `.env` u otro archivo que no debía

Primero, agrégalo a `.gitignore`. Luego sácalo del seguimiento de Git (el archivo no se borra de tu carpeta):

```bash
echo "node_modules/" >> .gitignore
git rm -r --cached node_modules
git add .gitignore
git commit -m "Deja de seguir node_modules"
```

### 🚨 Subí una contraseña, token o clave a GitHub

**Borrar el archivo no basta**: queda en el historial. Haz esto en orden:

1. **Cambia o revoca la clave ya.** Considérala comprometida.
2. Avisa al equipo.
3. Después limpia el historial (pide ayuda; no lo hagas a ciegas).

Para que no vuelva a pasar: nada de claves en el código; usa un archivo `.env` (ya está en `.gitignore`).

### Creo que perdí un commit o borré una rama

Git guarda un registro de todo a dónde fuiste:

```bash
git reflog
```

Busca el commit que perdiste, copia su código y recupéralo con `git switch -c rama-recuperada <código>`.

### No sé qué pasó en el proyecto

```bash
git log --oneline --graph --all     # el mapa de ramas y commits
git log -p nombre-archivo.js        # la historia de un archivo, con cambios
```

---

## Comandos peligrosos: pregunta antes de usarlos

Estos comandos **pueden borrar trabajo** de ti o de tus compañeras. Si el agente propone uno, **detente y pregunta al equipo**:

| Comando | Por qué es peligroso |
| --- | --- |
| `git push --force` | Pisa lo que hay en GitHub. Puede borrar el trabajo de otras. **Nunca en `main`** |
| `git reset --hard` | Tira todos tus cambios sin guardar, sin vuelta atrás |
| `git clean -fd` | Borra archivos que Git no conoce |
| `git checkout .` / `git restore .` | Descarta los cambios de **todos** los archivos |
| `git rebase` | Reescribe commits; si ya los subiste, genera líos. En este taller no hace falta |

Regla simple: **antes de ejecutar un comando que no entiendes, pídele al agente que te explique qué hace**.

---

## Tabla de rescate (para imprimir)

| Quiero… | Comando |
| --- | --- |
| Saber dónde estoy | `git status` |
| Crear mi rama | `git switch -c 12-descripcion` |
| Guardar mi trabajo | `git add .` y `git commit -m "Mensaje"` |
| Subir mi rama | `git push -u origin mi-rama` |
| Traer lo nuevo | `git pull` |
| Ponerme al día con main | `git switch main && git pull && git switch mi-rama && git merge main` |
| Tirar cambios de un archivo | `git restore archivo` |
| Quitar un archivo del `add` | `git restore --staged archivo` |
| Corregir mi último commit (sin push) | `git commit --amend` |
| Deshacer mi último commit (sin push) | `git reset --soft HEAD~1` |
| Deshacer un commit ya subido | `git revert <código>` |
| Guardar a un lado y seguir luego | `git stash` / `git stash pop` |
| Cancelar un merge con conflicto | `git merge --abort` |
| Encontrar algo perdido | `git reflog` |

Siguiente lectura: [FLUJO-SDD.md](FLUJO-SDD.md) (qué decirle al agente en cada fase) e [ISSUES-Y-TABLERO.md](ISSUES-Y-TABLERO.md) (issues y tablero).
