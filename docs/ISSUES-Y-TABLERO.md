# Issues y tablero de GitHub Projects, paso a paso

Los **issues** son las tareas. El **tablero** (GitHub Projects) las muestra en columnas para ver quién hace qué. El agente se conecta con ambos por el MCP de GitHub, y todo se puede hacer también desde la web.

```
tasks.md (T1, T2…)  →  un issue por tarea  →  una tarjeta en el tablero  →  rama  →  PR  →  Hecho
```

## 1. Crea las etiquetas (una vez, una persona)

Las etiquetas indican el **área** de cada issue. Con GitHub CLI y la sesión iniciada (`gh auth login`), dentro de la carpeta del repo:

```bash
bash setup/crear-etiquetas.sh                                        # Mac o Linux
powershell -ExecutionPolicy Bypass -File setup\crear-etiquetas.ps1   # Windows
```

Crea: `tarea`, `bug`, `bloqueada` y una por área: `área: diseño`, `área: frontend`, `área: backend-datos`, `área: pruebas`, `área: despliegue` y `área: docs-pitch`. **Sin `gh`:** *Issues → Labels → New label* en la web.

## 2. Crea el tablero (una vez, una persona)

1. En tu repo o en tu perfil: pestaña **Projects → New project**.
2. Elige la plantilla **Board** y ponle el nombre del proyecto.
3. Renombra las columnas del campo **Status**: *Por hacer*, *En progreso*, *En revisión*, *Hecho*. (Menú `⋯` del campo → *Edit field*.)
4. Agrega estos campos con **+** en la cabecera de la tabla:

| Campo | Tipo | Valores |
| --- | --- | --- |
| **Área** | Single select | Diseño, Frontend, Backend y datos, Pruebas, Despliegue, Docs y pitch |
| **RF** | Texto | Los requisitos de la spec, por ejemplo `RF-7` |
| **Tarea** | Texto | La tarea de `tasks.md`, por ejemplo `T7` |

5. Vincula el tablero al repo: en el tablero, `⋯` → **Settings → Manage access / Linked repositories** (o desde el repo, *Projects → Link a project*).
6. Activa los flujos automáticos: `⋯` → **Workflows**:
   - **Item added to project** → Status: *Por hacer*.
   - **Item closed** → Status: *Hecho*.
   - **Pull request merged** → Status: *Hecho*.
   - **Auto-add to project** → con el filtro `is:issue`, para que cada issue nuevo llegue solo.
7. Crea las vistas que más van a usar con **+ New view**:
   - **Tablero** (*Board*), agrupado por *Status*.
   - **Por persona** (*Table*), agrupada por *Assignees*: para ver cuánto lleva cada una.
   - **Por área** (*Table*), agrupada por *Área*.

> **Con un solo comando (opcional).** `bash setup/crear-tablero.sh "Nombre del proyecto"` (Mac o Linux) o `powershell -ExecutionPolicy Bypass -File setup\crear-tablero.ps1 "Nombre del proyecto"` (Windows) crea el tablero, le agrega los campos **Área** y **RF** y lo enlaza con el repo. Antes, una sola vez: `gh auth refresh -s project`. Las columnas y la vista de tablero se ajustan desde la web, como dice este paso. Si el script falla, haz todo desde la web.

## 3. Convierte las tareas en issues

Cada tarea de `tasks.md` se vuelve **uno o más issues**. La regla:

> **Un issue = una tarea = una persona = una rama = un área.**

Si una tarea toca varias áreas (diseño, frontend, pruebas…), se **divide en un issue por área**, y los issues se agrupan bajo una tarea "madre". Mira el ejemplo completo en [EJEMPLO-TAREA.md](EJEMPLO-TAREA.md).

### Con el agente (MCP de GitHub)

Elige el **Planificador** y escribe:

> Crea los issues de specs/001-.../tasks.md. Si una tarea toca varias áreas, divídela en un issue por área, agrúpalos con sub-issues, ponles su etiqueta de área y agrégalos al tablero en Por hacer. Muéstrame la lista antes de crear nada.

El agente te muestra la lista, **espera tu confirmación** y crea los issues. Anota los números en `tasks.md` (por PR). **No asigna a nadie.**

### Con la web

1. **Issues → New issue → 📋 Tarea.** Completa el formulario:
   - **¿Qué hay que hacer?** En 2 o 3 líneas.
   - **Requisitos de la spec:** los RF y la tarea (`RF-7, T7`).
   - **Hecho cuando:** lo comprobable (idealmente una prueba en verde).
   - **Área:** una sola.
2. En el panel derecho: agrega la etiqueta del área y el proyecto.
3. En el tablero, completa **RF**, **Tarea** y **Área** si no se llenaron solos.

### Un buen issue

| Debe tener | Ejemplo |
| --- | --- |
| Título con verbo | `[Tarea] T7 · Armar el enlace de WhatsApp de una mentora` |
| Los RF que cumple | `RF-7` |
| Un "Hecho cuando" comprobable | `La prueba RF-7 pasa y el enlace abre WhatsApp con nombre, área y URL` |
| Una sola área y una sola persona | `área: backend-datos` |
| Tamaño de menos de una hora | Si es más grande, se divide |

## 4. Repártanse el trabajo (solo el equipo)

Esto lo decide el equipo, **no la IA**. Una reunión de 10 minutos frente al tablero:

1. Revisen las tarjetas en *Por hacer* por área.
2. Cada persona se **asigna** los issues que va a tomar (panel derecho → *Assignees*), y se reparten de modo que todas aporten commits y PRs.
3. Revisen las dependencias: si un issue necesita a otro, ponle `bloqueada` y anótalo en el issue.
4. Si alguien tiene demasiado o muy poco, rebalanceen con la vista **Por persona**.

## 5. Mueve las tarjetas mientras trabajas

| Momento | Columna | Quién la mueve |
| --- | --- | --- |
| El issue se crea | Por hacer | Automático |
| Empiezas la rama | **En progreso** | Tú (o el agente, si se lo pides) |
| Abres el PR | **En revisión** | Tú, o el agente al usar `abrir-pr` |
| Se fusiona el PR | **Hecho** | Automático, y el issue se cierra con `Closes #N` |

Con el agente: *"Mueve el issue #12 a En progreso."* · *"¿Qué tengo asignado y en qué estado está?"* · *"Resume qué tarjetas están en En revisión y esperan revisión."*

## 6. Cada día, 5 minutos

1. Abran el tablero. ¿Hay algo en *En progreso* hace más de un día sin avance? Pregunten qué lo bloquea.
2. ¿Hay PRs esperando revisión? Prioricen revisarlos.
3. ¿Quedan issues en *Por hacer* que no caben antes del domingo? Muévanlos a *Fuera de alcance* en la spec (por PR).

## Cómo se comunica el agente con el tablero

El archivo `.vscode/mcp.json` (y `opencode.json`) conecta el agente con GitHub y activa las herramientas de **issues**, **pull requests**, **projects** y **actions**. Con ellas el agente puede leer y crear issues, agregarlos al tablero, cambiar sus campos, abrir PRs y ver el resultado de la CI. Todo lo que cambia algo en GitHub **pide tu confirmación antes**: léela antes de aceptar.

Qué hace cada agente:

| Agente | Con el tablero |
| --- | --- |
| Planificador | Crea los issues y los agrega a *Por hacer* |
| Desarrollador | Mueve su issue a *En progreso* y a *En revisión* al abrir el PR |
| QA | Lee los PRs y la CI para revisar; no mueve ni cierra nada |
| Desplegador | Lee el estado de las Actions del despliegue |

Si el MCP no ve el tablero (los permisos de proyectos a veces hay que aceptarlos de nuevo), trabaja el tablero a mano desde la web: los issues y los PRs funcionan igual.
