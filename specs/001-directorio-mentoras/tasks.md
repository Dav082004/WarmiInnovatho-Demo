# Tareas: Spec 001

Cada tarea es un issue del tablero. Los números de issue se anotan al crearlos.

- [x] T1. Esqueleto del proyecto: `package.json`, carpeta `tests/` y CI. (RF: ninguno) · Issue: #
      Hecho cuando: `npm test` corre sin errores y la CI pasa en un PR.
- [x] T2. Datos de ejemplo y orden alfabético. (RF-1) · Issue: #
      Hecho cuando: pruebas de orden (con tildes) y de formato del JSON en verde.
- [x] T3. Filtro por área. (RF-2) · Issue: #
      Hecho cuando: pruebas de filtro por área y de lista de áreas en verde.
- [x] T4. Búsqueda por nombre o tema, combinada con el área. (RF-3, RF-4) · Issue: #
      Hecho cuando: pruebas de mayúsculas, tildes, espacios y combinación en verde.
- [x] T5. Interfaz: lista, filtros, contador y mensaje de lista vacía. (RF-1, RF-5, RF-6) · Issue: #
      Hecho cuando: prueba del contador en verde y revisión manual en 360 px y con teclado.
- [x] T6. Despliegue en GitHub Pages. (Criterios de finalización) · Issue: #
      Hecho cuando: el enlace público abre y el flujo principal funciona en un celular.
- [ ] T7. Botón "Compartir" por WhatsApp. (RF-7) · Issue: #
      Hecho cuando: prueba del mensaje (nombre, área y enlace, bien codificado) en verde y el botón abre WhatsApp.

T2, T3 y T4 tocan `js/mentoras.js`, así que conviene hacerlas en orden. T5 y T6 se pueden trabajar en paralelo con ellas.

## Reparto (lo decidió el equipo)

Equipo ficticio, para el ejemplo. La IA no asigna: cada persona se asignó sus issues en la reunión frente al tablero.

| Tarea | Área | Persona |
| --- | --- | --- |
| T1 | Despliegue (esqueleto y CI) | Sumaq |
| T2, T3 | Backend y datos | Lucía |
| T4 | Backend y datos | Mayu |
| T5 | Frontend | Ana |
| T6 | Despliegue | Sumaq |
| T7 | Varias áreas: se divide en sub-issues **en vivo** en el taller | *por decidir* |

Cómo se divide T7 por áreas, issue por issue: [docs/EJEMPLO-TAREA.md](../../docs/EJEMPLO-TAREA.md). Una funcionalidad entera dividida por áreas: [spec 002](../002-mi-match/tasks.md).
