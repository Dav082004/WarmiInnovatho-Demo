---
name: recibir-revision
description: Cómo responder a los comentarios de una revisión de código con criterio técnico. Úsala cuando lleguen comentarios en un PR, antes de aplicar cualquier sugerencia.
---

# Recibir una revisión

Una revisión se evalúa, no se obedece a ciegas ni se discute por orgullo.

## Proceso

1. **Lee todos los comentarios** antes de cambiar nada.
2. **Entiende.** Reformula cada pedido con tus palabras. Si alguno no está claro, pregunta antes de implementar cualquiera: pueden estar relacionados.
3. **Verifica** contra el código y contra la spec: ¿lo que piden es correcto aquí?, ¿rompe algo?, ¿está dentro del alcance?
4. **Responde** a cada comentario: lo que vas a cambiar, o por qué no conviene, con razones técnicas.
5. **Implementa de uno en uno** y ejecuta las pruebas después de cada cambio. Primero lo que bloquea, luego lo simple, luego lo complejo.

## Cuándo no aplicar una sugerencia

- Rompe algo que funciona o contradice la spec.
- Agrega algo que nadie usa todavía y que está fuera de alcance. En ese caso propone un issue aparte.
- Quien revisa no tenía todo el contexto: explícalo con amabilidad.

Si la sugerencia cambia lo que hace el producto, **primero se actualiza la spec**.

## Tono

- Sin halagos vacíos ("¡excelente observación!"). Di qué cambiaste: "Corregido: ahora valida el campo vacío".
- Si tenías razón, explica con datos. Si te equivocaste, dilo en una línea y corrige.

Adaptada de `receiving-code-review` (obra/superpowers, MIT).
