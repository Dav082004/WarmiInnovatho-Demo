---
name: clarificar-spec
description: Revisa una spec como QA antes de planificar, buscando ambigüedades, contradicciones y casos límite que faltan. Úsala cuando pidan revisar la spec o justo después de escribirla.
---

# Clarificar la spec

Revisa la spec activa en `specs/` como lo haría una persona de QA. **Solo detecta; no resuelvas ni reescribas.**

Busca:

1. **Ambigüedades:** requisitos que dos personas entenderían distinto.
2. **Requisitos que no se pueden comprobar:** si no se te ocurre una prueba, está mal escrito.
3. **Contradicciones** entre requisitos, o con `docs/constitution.md`.
4. **Casos límite ausentes:** vacío, duplicado, muy largo, sin conexión, celular.
5. **Alcance que no cabe** antes de la fecha de entrega.

Responde con una lista numerada, cada punto con el RF afectado y una pregunta concreta para el equipo. Termina con un veredicto: **lista para planificar** o **necesita cambios**.

Las respuestas del equipo se llevan a la spec (por PR) antes de seguir.

Basada en la fase de clarificación de mouredev/hello-sdd (Apache 2.0).
