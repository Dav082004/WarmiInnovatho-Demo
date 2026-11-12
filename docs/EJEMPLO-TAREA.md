# Ejemplo: una tarea dividida por áreas

Este ejemplo recorre **una tarea completa**, desde el requisito de la spec hasta la tarjeta en *Hecho*. Usa la idea de ejemplo de la demo ([Warmi Mentoras](https://github.com/Dav082004/WarmiInnovatho-Demo), un directorio de mentoras en tecnología). Tu idea será distinta; el recorrido es el mismo.

> ¿Quieres ver una **funcionalidad entera** dividida por áreas, con olas en paralelo y reparto entre 4 personas? Mira [`specs/002-mi-match/tasks.md`](https://github.com/Dav082004/WarmiInnovatho-Demo/blob/main/specs/002-mi-match/tasks.md) en la demo.

## 1. De dónde sale: el requisito en la spec

En `specs/001-directorio-mentoras/spec.md`:

> **RF-7:** CUANDO la aprendiz pulsa "Compartir" en una mentora, EL SISTEMA abre WhatsApp con un mensaje que incluye el nombre de la mentora, su área y el enlace de la página.

## 2. La tarea en `tasks.md`

```markdown
- [ ] T7. Botón "Compartir" por WhatsApp. (RF-7) · Issue: #20
      Hecho cuando: la prueba del mensaje (nombre, área y enlace bien codificado)
      pasa y el botón abre WhatsApp en un celular.
```

T7 toca **varias áreas** (el botón se ve, hay lógica, hay que probarlo y que funcione desplegado). Una persona sola puede hacerlo todo, pero dividirlo permite que **tres personas avancen en paralelo** y que cada una se concentre en lo suyo.

## 3. Se divide por áreas

El issue **#20** es la tarea "madre". Sus sub-issues, uno por área:

| Issue | Área | Qué se hace | Hecho cuando | Depende de |
| --- | --- | --- | --- | --- |
| **#21** | Diseño | Diseñar el botón "Compartir": texto, ícono, estados (normal, hover, foco) y su lugar en la ficha | Mockup o boceto aprobado en el issue; contraste 4.5:1 | |
| **#22** | Backend y datos | Función `armarEnlaceWhatsApp(mentora, urlPagina)` en `js/mentoras.js` que devuelve `https://wa.me/?text=...` bien codificado | La función devuelve el enlace con nombre, área y URL | |
| **#23** | Pruebas | Prueba `RF-7: el enlace incluye nombre, área y URL, y codifica tildes y espacios` | La prueba existe, falla sin el código y pasa con él | |
| **#24** | Frontend | Poner el botón en cada ficha de `js/app.js` y `css/estilos.css`, usando el diseño de #21 y la función de #22 | El botón aparece en cada ficha y abre WhatsApp | #21, #22 |
| **#25** | Despliegue | Comprobar en la demo publicada que el enlace compartido apunta a la URL pública y funciona desde un celular | Probado en el celular con el enlace público | #24 |
| **#26** | Docs y pitch | Marcar RF-7 en el README y sumarlo al guion del pitch | README y `docs/pitch.md` actualizados | #24 |

**Orden de trabajo:** #21, #22 y #23 arrancan **a la vez** (tres personas distintas). Cuando terminan, #24 los junta. Después #25 y #26.

```
#21 Diseño ──────┐
                 ├──► #24 Frontend ──┬──► #25 Despliegue
#22 Lógica ──────┤                   └──► #26 Docs y pitch
#23 Pruebas ─────┘
```

## 4. Así se ve el issue #22

```markdown
Título:  [Tarea] T7 · Armar el enlace de WhatsApp de una mentora
Etiquetas: tarea, área: backend-datos
Proyecto: Warmi Mentoras · Status: Por hacer · Área: Backend y datos · RF: RF-7 · Tarea: T7

## ¿Qué hay que hacer?
Agregar a `js/mentoras.js` una función `armarEnlaceWhatsApp(mentora, urlPagina)`
que devuelva un enlace `https://wa.me/?text=...` con el nombre de la mentora,
su área y la URL, bien codificado.

## Requisitos de la spec que cumple
RF-7 (tarea T7 de specs/001-directorio-mentoras/tasks.md). Parte de #20.

## Hecho cuando
- [ ] La función existe y no toca la página (solo lógica)
- [ ] Las pruebas pasan (#23)
```

## 5. Se reparte (decide el equipo)

En la reunión frente al tablero:

| Issue | Se lo asigna |
| --- | --- |
| #21 Diseño | Ana |
| #22 Backend y datos | Lucía |
| #23 Pruebas | Sumaq |
| #24 Frontend | Ana (cuando termine #21) |
| #25 Despliegue y #26 Docs | Lucía |

Reparto de ejemplo (nombres inventados): lo importante es que **todas aportan**, nadie carga con todo y las dependencias están a la vista.

## 6. Una persona, un issue: el recorrido

Lo que hace **Lucía** con el issue **#22**:

1. **Toma el issue.** Se asigna #22 y pasa la tarjeta a *En progreso*.
2. **Agente Desarrollador:** *"Tomé el issue #22. Implementa solo esa tarea, pruebas primero."* El agente crea la rama `22-enlace-whatsapp`, escribe la prueba, la ve fallar, escribe la función y corre las pruebas.
3. **Commit pequeño y claro:** `Agrega la función que arma el enlace de WhatsApp`.
4. **Pull request:** *"Ya terminé. Abre el PR."* El agente lo redacta con `Closes #22` y `RF-7`, y la tarjeta pasa a *En revisión*. La CI corre las pruebas sola.
5. **Revisión:** Sumaq revisa con ayuda de QA (*"Ayúdame a revisar el PR #27"*). Comprueba que cumple RF-7 y que el PR no hace nada extra.
6. **Merge:** Sumaq lo fusiona. La tarjeta pasa sola a *Hecho* y el issue #22 se cierra.
7. Cuando **todos** los sub-issues están cerrados, se cierra #20 y se marca T7 en `tasks.md`.

## 7. Cómo se ve el tablero a mitad de camino

| Por hacer | En progreso | En revisión | Hecho |
| --- | --- | --- | --- |
| #24 Frontend `Ana` | #21 Diseño `Ana` | #22 Lógica `Lucía` | #10 Inicio |
| #25 Despliegue | #23 Pruebas `Sumaq` | | #11 Lista |
| #26 Docs y pitch | | | |

## 8. Cómo pedírselo al agente

| Quieres | Escribe |
| --- | --- |
| Crear la tarea dividida | *"Crea el issue de la tarea T7 y divídelo por áreas en sub-issues. Muéstrame la lista antes de crear nada."* |
| Ver quién tiene qué | *"Muéstrame los issues de T7, su área, su dueña y su columna."* |
| Tomar un issue | *"Tomé el issue #22. Implementa solo esa tarea, pruebas primero."* |
| Abrir el PR | *"Ya terminé. Abre el PR."* |
| Saber qué sigue | *"¿Qué issues de T7 están bloqueados y por cuál?"* |

## 9. Las áreas de desarrollo

Se usan las mismas áreas para cualquier proyecto. Pueden borrar las que no apliquen:

| Área | Etiqueta | Trabajo típico |
| --- | --- | --- |
| Diseño | `área: diseño` | Mockups, paleta, tipografía, estados de la interfaz |
| Frontend | `área: frontend` | Páginas, componentes, interacción, que funcione en celular |
| Backend y datos | `área: backend-datos` | Lógica, base de datos o archivos de datos, servicios |
| Pruebas | `área: pruebas` | Pruebas automáticas, revisión de calidad, casos límite |
| Despliegue | `área: despliegue` | Publicar la demo, variables de entorno, la CI |
| Docs y pitch | `área: docs-pitch` | README, guía, presentación y guion |

**Consejo:** con 4 personas, cada una se hace cargo de una o dos áreas **como líder** (decide, revisa y apoya), pero **todas** abren al menos un PR de cualquier área. Así nadie se queda sin aprender y el jurado ve colaboración real.
