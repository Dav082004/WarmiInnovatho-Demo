# Cómo usar la spec, paso a paso

La spec es el documento que dice **qué** construye el equipo y **por qué**. Todo lo demás (plan, tareas, issues, código y pruebas) sale de ella. Si algo no está en la spec, no se construye.

## Dónde vive cada cosa

```
docs/constitution.md              Los principios del proyecto (se acuerdan una vez)
specs/001-nombre-corto/
├── spec.md                       QUÉ y POR QUÉ     ← la escribe el Especificador
├── plan.md                       CÓMO              ← la escribe el Planificador
└── tasks.md                      Las tareas        ← el Planificador, y se vuelven issues
specs/000-plantilla/              Plantillas vacías: se copian, no se editan
```

## Paso a paso

### 1. Acuerden la constitución (15 minutos, todo el equipo)

Abre `docs/constitution.md`. Son 6 principios; complétalos y ajústalos juntas: qué stack usan, qué idioma, qué reglas no se negocian. Entra a `main` por pull request. Después **no se cambia a mitad de semana**.

Con el agente: *"Ayúdanos a completar docs/constitution.md. Somos [N], tenemos hasta el domingo y queremos hacer [idea en una línea]."*

### 2. Escriban la idea en 3 o 4 líneas

Antes de abrir el agente, conversen y escriban: ¿quién es la usuaria?, ¿qué problema tiene?, ¿qué haría tu solución? No hace falta que esté perfecta: la entrevista del agente la afina.

### 3. Dejen que el Especificador las entreviste

Elige el agente **Especificador** y escribe:

> Queremos construir [idea]. Entrevístanos y escribe la spec.

El agente hace hasta 6 preguntas, **una a la vez**, sobre casos límite, errores y qué queda fuera. Responde juntas, en equipo. Al final escribe `specs/001-nombre-corto/spec.md` con la plantilla.

### 4. Revisen cada parte de la spec

| Sección | Qué debe tener | Pregúntense |
| --- | --- | --- |
| Contexto y objetivo | El problema y por qué importa | ¿Lo entendería alguien del jurado en 20 segundos? |
| Propuesta de valor | Qué la hace distinta y por qué le sirve a Ubuntu | ¿Es lo que defenderemos en el pitch? |
| Usuarias | Quién la usa y desde qué dispositivo | ¿Pensamos en una persona concreta? |
| Requisitos (RF) | Frases en notación EARS, numeradas | ¿Se puede comprobar con una prueba? |
| Casos límite | Vacío, error, sin conexión… | ¿Qué pasa cuando sale mal? |
| **Fuera de alcance** | Lo que NO harán esta semana | ¿Cabe todo lo demás antes del domingo? |

### 5. Escriban bien los requisitos (RF)

Cada requisito es **una frase** que se puede comprobar. Usa uno de estos moldes:

| Patrón | Molde | Ejemplo |
| --- | --- | --- |
| Siempre cierto | EL SISTEMA [hace] | RF-6: EL SISTEMA muestra cuántas mentoras hay en el resultado. |
| Evento | CUANDO [pasa algo], EL SISTEMA [hace] | RF-2: CUANDO la aprendiz elige un área, EL SISTEMA muestra solo las mentoras de esa área. |
| Estado | MIENTRAS [estado], EL SISTEMA [hace] | RF-4: MIENTRAS haya un área elegida y un texto escrito, EL SISTEMA aplica ambos filtros. |
| Error o caso límite | SI [condición], ENTONCES EL SISTEMA [hace] | RF-5: SI ninguna mentora cumple los filtros, ENTONCES EL SISTEMA muestra un mensaje y un botón para limpiarlos. |

Evita palabras que no se pueden medir: "rápido", "intuitivo", "bonito". Si necesitas una "y" para unir dos comportamientos, son dos requisitos. Para una hackatón, **entre 5 y 10 requisitos** es lo realista.

### 6. Clarifiquen con QA

Elige el agente **QA** y escribe: *"Revisa la spec 001 como QA. Solo detecta, no resuelvas."* Responde sus dudas y actualiza la spec. Lo que no sepan queda marcado como `[NECESITA ACLARACIÓN: pregunta]`: un hueco visible es mejor que una suposición escondida.

### 7. Aprueben la spec por pull request

Una persona abre el PR con la spec, otra la revisa y la fusiona. Desde ese momento **la spec está aprobada** y es el contrato del equipo.

### 8. Pasen al plan y a las tareas

Elige el **Planificador**: *"La spec 001 está aprobada. Escribe el plan y las tareas."* Luego sigue con [ISSUES-Y-TABLERO.md](ISSUES-Y-TABLERO.md) para convertir las tareas en issues.

## Cuando cambia la idea

Pasa siempre. La regla es **primero la spec, después el código**:

1. Al Especificador: *"Nuevo requisito: [X]. No toques código: actualiza primero la spec y muéstranos el cambio."*
2. Revisen el cambio y fusiónenlo por PR.
3. Al Planificador: *"La spec cambió. Ajusta el plan y las tareas, y dime qué issues hay que crear o cerrar."*
4. Recién ahí se programa.

## Señales de que la spec está bien

- Cada requisito tiene un número (RF-n) y se puede escribir una prueba para él.
- Cada issue cita los RF que cumple.
- Si alguien del equipo pregunta "¿esto entra?", la respuesta está en la spec y no en la memoria de alguien.
- Hay una sección **Fuera de alcance** con cosas reales que quedaron fuera.
