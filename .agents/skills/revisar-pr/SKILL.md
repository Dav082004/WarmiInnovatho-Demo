---
name: revisar-pr
description: Revisa un pull request contra su issue, los requisitos de la spec y las pruebas. Úsala cuando pidan revisar un PR o ayudar a una compañera a revisarlo.
---

# Revisar un pull request

Se revisa contra **la spec**, no contra gustos personales.

## Proceso

1. Lee el PR, su issue y los RF que dice cumplir. Con el MCP de GitHub, mira también el resultado de la CI.
2. Revisa en este orden:
   - **Spec:** ¿cumple cada RF citado? ¿Hace algo que la spec no pide?
   - **Pruebas:** ¿cada RF tiene su prueba? ¿La CI está en verde?
   - **Riesgos:** ¿rompe algo de `main`? ¿Hay secretos o datos personales reales?
   - **Claridad:** ¿se entiende sin que la autora lo explique?
   - **Interfaz** (si aplica): ¿funciona en celular?, ¿se puede leer y usar con teclado?
3. Clasifica cada hallazgo:
   - **Bloquea:** incumple la spec, rompe algo o expone datos.
   - **Importante:** conviene arreglarlo antes del merge.
   - **Sugerencia:** mejora opcional.
4. Escribe comentarios amables y concretos: "Si el campo llega vacío, esto falla en la línea 20" ayuda más que "está mal".
5. Entrega un resumen con una recomendación: **aprobar** o **pedir cambios**.

## Límites

- **No apruebes ni hagas merge.** Tu revisión ayuda a la compañera que revisa; la decisión es de ella.
- No reescribas el PR por tu cuenta.

Adaptada de `requesting-code-review` (obra/superpowers, MIT).
