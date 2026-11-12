# AGENTS.md

Instrucciones para cualquier agente de IA que trabaje en este repositorio (GitHub Copilot, OpenCode u otro).
Las personas del equipo tienen las mismas reglas, explicadas paso a paso, en [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Proyecto

- Equipo de la **Warmi Innovathon 2026**. Entrega: **domingo 15 de noviembre, 11:59 p. m.** Final: lunes 16.
- Qué es: **Warmi Mentoras**, un sitio para que mujeres que empiezan en tecnología encuentren una mentora voluntaria. Tiene un directorio con filtros (spec `specs/001-directorio-mentoras/`) y *Mi match*, que sugiere hasta 3 mentoras en 3 preguntas y explica por qué (spec `specs/002-mi-match/`). Los RF se numeran de forma continua entre specs (001: RF-1 a RF-7; 002: RF-8 a RF-12).
- Stack: HTML, CSS y JavaScript sin dependencias. La lógica vive en `js/mentoras.js` y `js/match.js` (se prueban sin navegador); `js/app.js` y `js/vista-match.js` solo pintan. Datos en `data/mentoras.json` y `data/catalogo.json`.

## Comandos

- Ejecutar: `npm start` (sirve la carpeta en http://localhost:3000)
- Pruebas: `npm test`

## Trabajamos con Spec-Driven Development (SDD)

La spec es el contrato. El orden siempre es:

```
docs/constitution.md → specs/NNN-nombre/spec.md → plan.md → tasks.md → issues → código + pruebas → despliegue
```

1. **Sin spec no hay código.** Antes de tocar código, lee `docs/constitution.md` y la spec activa en `specs/`. Si lo que te piden no está en la spec, detente y dilo.
2. **Todo se rastrea a la spec.** Cada tarea e issue cita sus requisitos (RF-1, RF-2…). Cada PR cita su issue y sus RF.
3. **Las pruebas salen de la spec.** Cada RF tiene al menos una prueba. Una tarea no está hecha si sus pruebas no pasan.
4. **Si cambia la idea, cambia primero la spec.** Actualiza `spec.md`, muestra el cambio y espera aprobación. Luego se ajustan plan, tareas e issues. El código nunca se adelanta a la spec.
5. **No rellenes huecos inventando.** Si falta una decisión, márcala como `[NECESITA ACLARACIÓN: pregunta]` y pregunta.

## Reglas de Git y GitHub

1. **Nunca cambies `main` directamente.** Si estás en `main`, propone crear una rama.
2. **Una tarea = un issue = una rama.** Rama: `número-del-issue-descripcion-corta` (ej.: `12-filtro-por-area`).
3. **Commits** pequeños, en español y en presente: `Agrega el filtro por área`. Prefijos opcionales: `feat:`, `fix:`, `docs:`, `test:`.
4. **PRs** hacia `main`, con la plantilla y `Closes #N`. Sugiere como revisora a una compañera, nunca a la autora.
5. **La IA propone, una persona decide.** Nunca hagas merge, ni apruebes PRs, ni asignes tareas a personas, ni cierres issues ajenos. Repartir el trabajo es decisión del equipo.

## Con el MCP de GitHub

- Antes de crear, editar o cerrar algo en GitHub, **di exactamente qué vas a hacer** y espera confirmación.
- Los issues nuevos van al tablero del equipo en **Por hacer**, con su etiqueta de **área** (`área: diseño`, `área: frontend`, `área: backend-datos`, `área: pruebas`, `área: despliegue` o `área: docs-pitch`). Un issue es de una sola área: si una tarea toca varias, divídela en un sub-issue por área. Al empezar uno pasa a **En progreso**; con PR abierto, a **En revisión**; fusionado, a **Hecho**.
- Si dos ramas tocan los mismos archivos, avisa del posible conflicto.
- **Comandos de Git que borran o reescriben trabajo** (`push --force`, `reset --hard`, `clean -fd`, `restore .`, `rebase`): nunca los ejecutes sin explicar antes qué hacen y esperar confirmación. Si algo sale mal, usa los pasos de `docs/COMANDOS-GIT.md`.
- Cuando ejecutes un comando de Git, di en una frase qué hace: las personas del equipo están aprendiendo.

## Código

- Simple y legible antes que ingenioso: es una hackatón.
- Nada de contraseñas, tokens ni claves en el código: usa `.env` (ya está en `.gitignore`).
- Nada de datos personales reales: usa datos ficticios.
- Si un cambio puede romper algo que funciona en `main`, dilo.

## Idioma

Responde siempre en **español**, claro y amable, y explica el porqué en una o dos frases. Spec, issues, PRs, commits y mensajes a la usuaria van en español.

## Skills y agentes

- Las skills están en [`.agents/skills/`](.agents/skills/). Si la tarea coincide con una, síguela.
- Hay cinco agentes con rol fijo (Especificador, Planificador, Desarrollador, QA y Desplegador). Respeta los límites de tu rol.

## Al terminar cualquier tarea

1. Ejecuta las pruebas y muestra el resultado real. No digas "listo" sin evidencia.
2. Marca la tarea en `tasks.md` y **detente**: una tarea a la vez.
