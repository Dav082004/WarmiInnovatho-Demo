# Plan: Spec 001

## Stack y decisiones

| Decisión | Elegimos | Por qué | Alternativa descartada |
| --- | --- | --- | --- |
| Frontend | HTML, CSS y JavaScript (módulos ES) | Sin instalación ni compilación; cualquiera del equipo lo entiende | React: más piezas de las que la spec necesita |
| Datos | `data/mentoras.json` | La coordinadora puede editarlo desde la web de GitHub | Supabase: no hay login ni escritura en esta entrega |
| Pruebas | `node --test` (incluido en Node) | Cero dependencias | Jest o Vitest: habría que instalarlos |
| Despliegue | GitHub Pages con GitHub Actions | Gratis, vive en el mismo repo y se publica en cada merge | Vercel: funciona igual, pero suma una cuenta más |
| Diseño | Fraunces para títulos, Atkinson Hyperlegible para texto; papel crema, tinta berenjena, magenta y ocre | Cálido y cercano, con una tipografía hecha para leerse bien | La tipografía y los degradados por defecto |

## Estructura

| Archivo | Qué hace | RF |
| --- | --- | --- |
| `js/mentoras.js` | Lógica pura: normalizar, ordenar, filtrar, contar | RF-1, 2, 3, 4, 6 (y RF-7 cuando se haga) |
| `js/app.js` | Carga los datos, pinta la lista y escucha los filtros | RF-1, 5, 6 |
| `index.html`, `css/estilos.css` | Página y estilos | RF-1, 5 y los no funcionales |
| `data/mentoras.json` | Mentoras ficticias | RF-1 |
| `tests/mentoras.test.js` | Una prueba o más por RF | todos |

## Modelo de datos

```json
{
  "id": "m01",
  "nombre": "Killa Mamani",
  "area": "Datos",
  "temas": ["Python", "análisis de datos"],
  "disponibilidad": "Sábados por la mañana",
  "presentacion": "Una o dos frases en primera persona."
}
```

## Estrategia de pruebas

- **Automáticas:** toda la lógica de `js/mentoras.js`, con el nombre del RF en cada prueba. Una prueba adicional valida que el JSON tenga todos los campos.
- **A mano, en la revisión del PR:** la interfaz en 360 px, el uso con teclado y el mensaje de lista vacía (RF-5).

## Despliegue

`.github/workflows/pages.yml` corre las pruebas y publica el sitio en GitHub Pages en cada push a `main`. Se activa una sola vez en **Settings → Pages → Source: GitHub Actions**.
