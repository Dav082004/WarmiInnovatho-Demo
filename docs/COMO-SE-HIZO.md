# Cómo se hizo esta demo

Este documento recorre el flujo completo sobre una idea de ejemplo. Sirve como guion para el taller y como referencia para los equipos.

## 0. Preparar

1. En la plantilla: **Use this template** → repositorio nuevo.
2. Tablero en **Projects** con las columnas *Por hacer*, *En progreso*, *En revisión* y *Hecho*.
3. Clonar, correr `setup/configurar-git` y encender el MCP de GitHub en `.vscode/mcp.json`.

## 1. Constitución (agente Especificador)

> Ayúdanos a completar docs/constitution.md. Queremos una web muy simple, sin frameworks, que cualquiera del equipo pueda entender.

Resultado: [constitution.md](constitution.md), con 7 principios. El más importante para el código: la lógica va separada de la interfaz, para poder probarla.

## 2. Requisitos (agente Especificador)

> Queremos un directorio de mentoras para mujeres que empiezan en tecnología. Entrevístanos y escribe la spec.

El agente preguntó, de una en una: quién es la usuaria, qué ve primero, cómo busca, qué pasa si no hay resultados, cómo contacta a la mentora y qué queda fuera. Resultado: [spec.md](../specs/001-directorio-mentoras/spec.md), con 7 requisitos en notación EARS.

## 3. Clarificación (agente QA)

> Revisa la spec 001 como QA. Solo detecta, no resuelvas.

Encontró dos dudas: si la búsqueda miraba también la presentación, y cómo se contacta a la mentora. Las respuestas del equipo quedaron en la sección "Dudas abiertas" de la spec. Recién entonces la spec entró a `main` por pull request.

## 4. Diseño y plan (agente Planificador)

> La spec 001 está aprobada. Escribe el plan y las tareas.

Resultado: [plan.md](../specs/001-directorio-mentoras/plan.md), con cada decisión y la alternativa descartada, y [tasks.md](../specs/001-directorio-mentoras/tasks.md), con 7 tareas, cada una con sus RF y su "Hecho cuando".

> Crea los issues de tasks.md y agrégalos al tablero.

El agente muestra la lista, espera el sí y crea un issue por tarea en *Por hacer*. **El equipo se reparte los issues**: eso no lo decide la IA.

## 5. Desarrollo y pruebas (agente Desarrollador)

Por cada tarea, la persona que la tomó escribe:

> Tomé el issue #N. Implementa solo esa tarea, pruebas primero.

El agente crea la rama `N-descripcion`, escribe la prueba con el nombre del requisito, la ve fallar, escribe el código mínimo y corre `npm test`. Así se llegó a [mentoras.js](../js/mentoras.js) y a las 13 pruebas de [mentoras.test.js](../tests/mentoras.test.js).

Para la interfaz se siguió la skill `diseno`: una tipografía con carácter para los títulos y otra muy legible para el texto, filas en lugar de tarjetas y una paleta propia.

## 6. Pull request y revisión

> Ya terminé. Abre el PR.

El agente revisa el diff, redacta el PR con `Closes #N` y los RF, y mueve el issue a *En revisión*. La CI corre las pruebas sola. Una compañera revisa con ayuda del agente QA (*"Ayúdame a revisar el PR #N"*) y **ella** hace el merge.

## 7. Despliegue (agente Desplegador)

> Publica la demo y deja el enlace en el README.

El equipo eligió GitHub Pages. El agente escribió [pages.yml](../.github/workflows/pages.yml), que corre las pruebas y publica en cada merge a `main`. Lo único manual, una sola vez: **Settings → Pages → Source: GitHub Actions**.

## 8. Entrega (agente QA)

> ¿Qué nos falta para la entrega?

Recorre la spec RF por RF y el checklist. Hoy diría: RF-1 a RF-6 cumplidos y con prueba; falta RF-7.

## Para hacer en vivo: la tarea T7

La tarea T7 (RF-7, compartir por WhatsApp) quedó pendiente a propósito. Es pequeña y recorre todo el flujo en unos 10 minutos:

1. **Issue.** Al Planificador: *"Crea el issue de la tarea T7 y agrégalo al tablero."* Asignárselo y pasarlo a *En progreso*.
2. **Rama y código.** Al Desarrollador: *"Tomé el issue #N. Implementa solo la tarea T7, pruebas primero."* Debería agregar a `js/mentoras.js` una función que arme el enlace `https://wa.me/?text=...` con el nombre, el área y la URL, su prueba `RF-7: ...`, y el botón en `js/app.js`.
3. **PR.** *"Abre el PR."* Mostrar la CI corriendo.
4. **Revisión y merge.** Al QA: *"Ayúdame a revisar el PR."* Aprobar y fusionar a mano.
5. **Despliegue.** Mostrar cómo Pages publica solo y probar el botón desde el celular.

## Un cambio de idea, bien hecho

Si alguien propone "que también se pueda filtrar por disponibilidad":

> Nuevo requisito: filtrar por disponibilidad. No toques código: actualiza primero la spec y muéstranos el cambio.

Primero la spec (RF-8), luego una tarea nueva y su issue, y recién después el código.
