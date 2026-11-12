# Instrucciones para GitHub Copilot

Las reglas completas de este repositorio están en [`AGENTS.md`](../AGENTS.md). Léelas y síguelas siempre. Resumen:

- Responde en español, claro y amable.
- Trabajamos con Spec-Driven Development: lee `docs/constitution.md` y la spec activa en `specs/` antes de tocar código. Si algo no está en la spec, detente y pregunta.
- Cada tarea, issue y PR cita los requisitos (RF) que cumple, y cada RF tiene su prueba.
- Nunca cambies `main`: una tarea = un issue = una rama (`12-descripcion-corta`). Todo entra por pull request con `Closes #N`.
- Antes de crear o cambiar algo en GitHub con el MCP, di qué vas a hacer y espera confirmación.
- La IA propone, una persona decide: nunca hagas merge, ni apruebes PRs, ni repartas tareas.
- Las skills del equipo están en `.agents/skills/`.
