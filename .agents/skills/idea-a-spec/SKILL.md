---
name: idea-a-spec
description: Convierte una idea en una especificación acordada (spec.md) mediante una entrevista corta. Úsala cuando pidan crear, redactar o revisar una spec, o cuando alguien quiera construir algo nuevo que aún no está especificado.
---

# De la idea a la spec

La spec es el contrato del equipo: si algo no está aquí, no se construye.
**No escribas código ni propongas tecnología en esta fase.**

## Proceso

1. **Lee el contexto.** `docs/constitution.md`, el `README.md` y las specs que ya existan en `specs/`.
2. **Entrevista.** Haz preguntas de **una en una** (máximo 6) y espera cada respuesta. Prioriza las que cambian lo que hay que construir:
   - ¿Quién es la usuaria y qué problema concreto tiene hoy?
   - ¿Qué hace distinta a esta idea? (la propuesta de valor que defenderán en el pitch)
   - ¿Qué es lo mínimo que tiene que funcionar en la demo?
   - ¿Qué pasa cuando algo sale mal o no hay datos?
   - ¿Qué queda fuera para esta entrega?
3. **Propón 2 o 3 enfoques** con sus ventajas y costos, recomienda uno y espera la decisión del equipo.
4. **Elige el número.** Usa el siguiente libre con tres dígitos: `specs/NNN-nombre-en-kebab-case/spec.md`.
5. **Redacta** con la plantilla `specs/000-plantilla/spec.md`, sin saltarte secciones. Requisitos numerados (RF-1, RF-2…) en notación EARS.
6. **Marca lo que no sepas** como `[NECESITA ACLARACIÓN: pregunta concreta]`. Nunca rellenes un hueco inventando.
7. **Pide aprobación explícita.** No pases al plan hasta tenerla. La spec entra a `main` por pull request.

## Notación EARS

| Patrón | Forma | Cuándo |
| --- | --- | --- |
| Ubicuo | EL SISTEMA [hará] | siempre es cierto |
| Evento | CUANDO [disparador], EL SISTEMA [hará] | responde a algo |
| Estado | MIENTRAS [estado], EL SISTEMA [hará] | durante una condición |
| No deseado | SI [condición], ENTONCES EL SISTEMA [hará] | errores y casos límite |

Bien escrito: `RF-3: SI no hay mentoras para el área elegida, ENTONCES EL SISTEMA muestra el mensaje "Aún no hay mentoras en esta área" y un botón para ver todas.`

## Reglas

- Solo el **QUÉ** y el **POR QUÉ**. Stack, archivos y datos van en el plan.
- Un requisito, una frase. Si necesitas una "y" para unir dos comportamientos, son dos requisitos.
- Sin adjetivos que no se puedan medir ("rápido", "intuitivo"). Escribe el umbral o no lo escribas.
- La sección **Fuera de alcance** es obligatoria.
- Tamaño de hackatón: entre 5 y 10 requisitos. Si salen más, propone qué dejar fuera.

Adaptada de `brainstorming` (obra/superpowers, MIT) y `spec-generator` (mouredev/hello-sdd, Apache 2.0).
