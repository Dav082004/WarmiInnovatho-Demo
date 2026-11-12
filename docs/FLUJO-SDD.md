# El flujo: SDLC guiado por la spec (SDD)

Seguimos las fases clásicas de un proyecto de software, pero con una regla: **la spec manda**. Los agentes hacen el trabajo repetitivo de cada fase; el equipo decide.

```
Constitución → Spec → Clarificación → Plan → Tareas e issues → Desarrollo + pruebas → Despliegue → Entrega y pitch
                 ↑                                                                        │
                 └──────────── ¿cambió algo? primero se actualiza la spec ────────────────┘
```

## Fase por fase

| Fase | Qué decide el equipo | Agente | Skills | Queda en |
| --- | --- | --- | --- | --- |
| 0. Constitución | Los principios del proyecto | Especificador | | `docs/constitution.md` |
| 1. Requisitos | El problema, la usuaria y el valor de la idea | Especificador | `idea-a-spec` | `specs/001-.../spec.md` |
| 1b. Clarificación | Las respuestas a las dudas | QA | `clarificar-spec` | la spec corregida |
| 2. Diseño y plan | Stack, alcance y **quién toma qué** | Planificador | `escribir-plan` | `plan.md`, `tasks.md`, issues en el tablero |
| 3. Desarrollo | Qué issue toma cada persona | Desarrollador | `probar`, `diseno`, `depurar-con-metodo` | ramas y commits |
| 4. Pruebas y revisión | Si el PR se aprueba y se fusiona | Desarrollador y QA | `verificar-antes-de-terminar`, `abrir-pr`, `revisar-pr`, `recibir-revision` | `tests/`, CI, pull requests |
| 5. Despliegue | Dónde vive la demo | Desplegador | `desplegar` | enlace en el README |
| 6. Entrega y pitch | Cómo se cuenta el valor de la idea | QA | `revisar-entrega` | `docs/pitch.md`, checklist del README |

**Lo que es solo del equipo:** dividir el trabajo, mantener el tablero al día, revisar y fusionar los PRs, y defender la idea.

Guías detalladas: [USAR-SPEC.md](USAR-SPEC.md) (fases 0 a 1b), [ISSUES-Y-TABLERO.md](ISSUES-Y-TABLERO.md) (fases 2 a 4) y [EJEMPLO-TAREA.md](EJEMPLO-TAREA.md) (una tarea de punta a punta).

## Qué decirle al agente en cada fase

Comandos de Git que acompañan cada fase: [COMANDOS-GIT.md](COMANDOS-GIT.md).

Elige el agente en el selector del chat (Copilot en modo Agent, o `/agents` en OpenCode) y escribe:

| Fase | Agente | Mensaje |
| --- | --- | --- |
| Constitución | Especificador | "Ayúdanos a completar docs/constitution.md. Somos 4, tenemos hasta el domingo y queremos hacer [idea en una línea]." |
| Spec | Especificador | "Queremos construir [idea]. Entrevístanos y escribe la spec." |
| Clarificación | QA | "Revisa la spec 001 como QA. Solo detecta, no resuelvas." |
| Plan | Planificador | "La spec 001 está aprobada. Escribe el plan y las tareas." |
| Issues | Planificador | "Crea los issues de tasks.md y agrégalos al tablero." |
| Desarrollo | Desarrollador | "Tomé el issue #7. Implementa solo esa tarea, pruebas primero." |
| PR | Desarrollador | "Ya terminé. Abre el PR." |
| Revisión | QA | "Ayúdame a revisar el PR #9." |
| Despliegue | Desplegador | "Publica la demo y deja el enlace en el README." |
| Entrega | QA | "¿Qué nos falta para la entrega?" |
| Cambio | Especificador | "Nuevo requisito: [X]. No toques código: actualiza primero la spec y muéstranos el cambio." |

## Por qué así

- **La IA no recuerda nada entre conversaciones.** Lo que no está escrito en el repo, para ella no existe. La spec, el plan y las tareas son su memoria.
- **Cada cosa se rastrea:** requisito (RF-3) → tarea (T2) → issue (#7) → rama (`7-filtro`) → PR → prueba. Si el jurado pregunta "¿dónde está esto?", hay respuesta.
- **Una tarea a la vez** mantiene los PRs pequeños y fáciles de revisar.

El formato de la spec (requisitos RF en notación EARS) y los prompts por fase están adaptados del curso [hello-sdd de MoureDev](https://github.com/mouredev/hello-sdd).
