---
name: diseno
description: Guía para que la interfaz tenga intención y no se vea generada por IA. Úsala al diseñar, construir, revisar o pulir cualquier pantalla, página o componente.
---

# Diseño con intención

## Antes de escribir la interfaz

1. Lee la spec: ¿quién es la usuaria y desde qué dispositivo entra? Diseña primero para celular.
2. Define en una frase el carácter visual (por ejemplo: "cálido y cercano, como un cuaderno de apuntes"). Todo lo demás sale de ahí.
3. Elige **una** tipografía con personalidad para títulos y una legible para texto, un color principal, uno de acento y dos neutros. Escríbelo en el plan.

## Señales de que se ve "hecho por IA" (evítalas)

- La misma tipografía por defecto (Inter, Roboto) en todo.
- Degradados morado-azul sin motivo.
- Tarjetas dentro de tarjetas, todo con las mismas esquinas redondeadas y sombras.
- Un ícono en un cuadrito de color encima de cada título.
- Texto gris claro sobre fondos de color (bajo contraste).
- Todo centrado y con el mismo tamaño: sin jerarquía.
- Emojis como íconos y frases de relleno ("Potencia tu futuro").

## Lo mínimo que no se negocia

- Contraste suficiente (texto normal 4.5:1).
- Se puede usar con teclado y los botones dicen qué hacen.
- Funciona a 360 px de ancho sin scroll horizontal.
- Estados resueltos: cargando, vacío y error.
- Textos reales en español, no "Lorem ipsum".

## Con Impeccable (recomendado)

[Impeccable](https://github.com/pbakaus/impeccable) (Apache 2.0) le da al agente un vocabulario de diseño y un detector de estos problemas. Se instala una vez por proyecto con `npx impeccable install` (necesita Node) y funciona con Copilot y OpenCode. Los comandos están en inglés; el agente responde en español igual. Uso: `/impeccable <comando> <qué parte>`.

| Momento | Comando | Para qué |
| --- | --- | --- |
| Al empezar | `init` | Escribe `PRODUCT.md` a partir del proyecto. Dale la spec. |
| Antes de programar una pantalla | `shape` | Planea la experiencia. |
| Mientras construyes | `typeset`, `layout`, `colorize` | Tipografía, espaciado y color. |
| Si quedó plano o recargado | `bolder`, `quieter`, `distill` | Subir el tono, bajarlo o quitar lo que sobra. |
| Textos y primera visita | `clarify`, `onboard` | Textos claros y pantallas vacías. |
| En la revisión | `critique`, `audit` | Usabilidad con puntaje y reporte técnico por prioridad. |
| Celular y casos borde | `adapt`, `harden` | Pantallas chicas, errores, textos largos. |
| Antes de la demo | `polish` | La pasada final. |

No uses `live` en este proyecto: modifica el código desde el navegador y puede ejecutar agentes sin pedir permiso.

## Otras formas de diseñar

Cada equipo elige: Figma con su servidor MCP para pasar el diseño al código, Google Stitch para generar pantallas desde una descripción, o mockups a mano. Lo que no cambia: el diseño responde a la spec.
