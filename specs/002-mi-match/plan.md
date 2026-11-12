# Plan: Spec 002

> Escrito por el agente **Planificador** a partir de la spec 002 aprobada.

## Stack y decisiones

| Decisión | Elegimos | Por qué | Alternativa descartada |
| --- | --- | --- | --- |
| Cómo sugerir | Reglas de puntaje fijas en `js/match.js` | Se explican en una línea, se prueban y la ONG las entiende | Un modelo de IA: no se puede explicar ni probar en una semana, y pediría enviar datos a un servicio |
| Dónde se calcula | En el navegador | Las respuestas no salen del celular (privacidad) | Un servidor: más costo y datos personales que cuidar |
| Catálogo | `data/catalogo.json` con áreas (y su frase) y objetivos | La ONG agrega un área u objetivo sin tocar código | Escribirlos en el HTML: habría que programar para cambiarlos |
| Disponibilidad | `dias` y `momento` por separado; el texto se arma con `textoDisponibilidad()` | Se puede comparar, y no se repite la información | Mantener el texto libre de la spec 001: no se puede comparar |
| Archivos de la interfaz | `js/vista-match.js` aparte de `js/app.js` | Frontend del match y la tarea T7 (que toca `app.js`) avanzan en paralelo sin conflictos | Todo en `app.js`: dos personas tocando el mismo archivo |

## Estructura

| Archivo | Qué hace | RF |
| --- | --- | --- |
| `js/match.js` | Lógica pura: `calcularMatch()` y `recomendar()` | RF-8, 9, 10, 11 |
| `js/vista-match.js` | Pinta las preguntas y el resultado | RF-8, 11, 12 |
| `js/mentoras.js` | Suma `textoDisponibilidad()` | RF-1 (spec 001) |
| `js/app.js` | Carga los dos JSON y llama a `iniciarMatch()` | |
| `index.html`, `css/estilos.css` | Sección "Mi match" encima del directorio | RF-8, 12 y no funcionales |
| `data/catalogo.json` | Áreas con su frase, y objetivos | RF-9 |
| `data/mentoras.json` | Suma `ayudaCon`, `dias` y `momento`; quita `disponibilidad` | RF-9 |
| `tests/match.test.js` | Una prueba o más por RF | RF-8 a RF-12 |
| `tests/datos.test.js` | Que los datos usen solo valores del catálogo | Integridad |

## Modelo de datos

**Cambio respecto de la spec 001** (también anotado en `specs/001-directorio-mentoras/plan.md`):

```json
{
  "id": "m06",
  "nombre": "Lucía Paredes",
  "area": "Datos",
  "temas": ["SQL", "visualización", "becas"],
  "ayudaCon": ["becas", "primer-paso"],
  "dias": ["lunes"],
  "momento": "noche",
  "presentacion": "Científica de datos. Estudié con becas y te cuento cómo postular."
}
```

`data/catalogo.json`:

```json
{
  "areas": [{ "nombre": "Datos", "descripcion": "Encontrar respuestas en los números" }],
  "objetivos": [{ "id": "becas", "texto": "Postular a una beca" }]
}
```

## Estrategia de pruebas

- **Automáticas:** `tests/match.test.js` con el nombre del RF en cada prueba, sobre datos de ejemplo pequeños (no sobre el JSON real, para que la prueba no se rompa si la ONG agrega una mentora). `tests/datos.test.js` revisa el JSON real: si la ONG escribe un área o un día que no existe, la CI lo marca en el PR.
- **A mano, en la revisión del PR:** las preguntas en 360 px, recorrer todo con teclado y que el foco llegue al resultado.

## Despliegue

Sin cambios: `pages.yml` publica en cada merge a `main`.
