---
name: probar
description: Escribe las pruebas de una tarea a partir de los requisitos (RF) de la spec. Úsala al implementar cualquier tarea o arreglar un bug, antes de escribir el código.
---

# Probar lo que importa

En una hackatón no se prueba todo: se prueba **lo que la spec promete** y lo que se mostrará en la demo.

## Proceso

1. **Lee los RF de la tarea** en la spec. Cada RF necesita al menos una prueba.
2. **Escribe la prueba primero** y nómbrala con su requisito: `RF-2: si no hay resultados, devuelve lista vacía`.
3. **Mira cómo falla.** Si pasa sin haber escrito el código, la prueba no está probando nada.
4. **Escribe el código mínimo** para que pase.
5. **Ejecuta todas las pruebas**, no solo la nueva.

## Qué probar

- La **lógica**: filtros, cálculos, validaciones, transformaciones de datos. Sepárala de la interfaz para poder probarla sin navegador.
- Los **casos límite** de la spec: vacío, duplicado, mayúsculas y tildes, datos faltantes.

## Qué no probar automáticamente

- Colores, posiciones y textos de la interfaz: se revisan a mano y en la revisión del PR.
- Librerías de terceros.

## Reglas

- Una prueba, un comportamiento.
- Datos ficticios siempre.
- Nunca borres, saltes ni desactives una prueba para que la CI pase. Si la prueba está mal, se corrige; si el código está mal, se arregla.
- Al arreglar un bug: primero una prueba que lo reproduzca.

Versión ligera de `test-driven-development` (obra/superpowers, MIT).
