---
name: escribir-plan
description: Convierte una spec aprobada en plan.md y tasks.md, y crea un issue por tarea en el tablero de GitHub Projects. Úsala cuando la spec esté aprobada y pidan planificar, dividir el trabajo o crear las tareas.
---

# De la spec al plan y a los issues

**No escribas código en esta fase.**

## 1. Plan (`specs/NNN-nombre/plan.md`)

Lee `docs/constitution.md` y la spec. Con la plantilla `specs/000-plantilla/plan.md`, escribe:

- Stack y decisiones, cada una con su porqué y la alternativa descartada. Si el equipo aún no eligió stack, propone el más simple que cumpla la spec y espera su decisión.
- Estructura de carpetas y qué RF cubre cada parte.
- Modelo de datos (solo datos ficticios).
- Estrategia de pruebas: qué prueba cubre cada RF.
- Dónde se desplegará la demo.

Muestra el plan y espera aprobación.

## 2. Tareas (`specs/NNN-nombre/tasks.md`)

Divide el plan en tareas:

- Pequeñas: menos de una hora cada una.
- Ordenadas por dependencia, y pensadas para que **varias personas trabajen en paralelo** sin tocar los mismos archivos.
- Cada una con sus RF y una línea `Hecho cuando:` que se pueda comprobar.
- La primera tarea deja el proyecto ejecutable y la CI en verde. Una de las primeras despliega la demo, aunque esté casi vacía.

## 3. Issues en el tablero

Muestra la lista de issues que vas a crear y espera confirmación. Luego, con el MCP de GitHub, por cada tarea:

1. Crea un issue con la estructura de la plantilla **Tarea**: título `[Tarea] T2. Filtro por área`, qué hay que hacer, RF que cumple, `Hecho cuando` y su **área**.
2. **Una tarea que toca varias áreas se divide en un issue por área** (Diseño, Frontend, Backend y datos, Pruebas, Despliegue, Docs y pitch), agrupados como sub-issues de un issue madre. Indica de cuál depende cada uno para que se pueda trabajar en paralelo. Ver `docs/EJEMPLO-TAREA.md`.
3. Ponle la etiqueta de su área y agrégalo al tablero del equipo en **Por hacer**, completando los campos Área, RF y Tarea.
4. Anota el número del issue junto a la tarea en `tasks.md`.

**No asignes los issues a nadie.** Repartir el trabajo lo decide el equipo en su reunión.

Si no tienes el MCP de GitHub, entrega los issues redactados para que el equipo los cree desde la web.

Adaptada de `writing-plans` (obra/superpowers, MIT).
