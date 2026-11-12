---
name: abrir-pr
description: Prepara y abre un pull request hacia main que cierra su issue y cita los requisitos que cumple. Úsala cuando digan "abre el PR", "ya terminé" o "sube mis cambios".
---

# Abrir un pull request

1. **Rama.** Debe tener el formato `número-descripcion` y no ser `main`. El número es el del issue.
2. **Verifica primero.** Sigue la skill `verificar-antes-de-terminar`: pruebas ejecutadas y en verde.
3. **Revisa el diff.** Avisa si ves contraseñas, tokens, datos personales reales, archivos pesados (`node_modules/`, `.env`) o cambios que no pertenecen a esta tarea.
4. **Commits.** Si hay cambios sin commit, propone un mensaje en español y en presente.
5. **Redacta el PR** con `.github/pull_request_template.md`:
   - ¿Qué cambia? En 1 a 3 líneas.
   - `Closes #N` y los RF de la spec que cumple.
   - ¿Cómo lo pruebo? Pasos concretos.
6. **Muestra el borrador y espera confirmación.** Luego haz push y abre el PR hacia `main` con el MCP de GitHub.
7. **Tablero.** Mueve el issue a **En revisión** y marca la tarea en `tasks.md`.
8. Sugiere pedir revisión a una compañera (nunca a la autora). **No hagas merge.**

Sin el MCP de GitHub: entrega el título y la descripción listos para pegar en la web.
