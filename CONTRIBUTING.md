# Cómo trabajamos en equipo

Estas son las reglas del equipo. Son pocas y simples, y la IA también las sigue (ver [`AGENTS.md`](AGENTS.md)).

## Las 5 reglas de oro

0. **La spec manda.** Antes de programar acordamos qué construir en `specs/`. Si cambia la idea, primero cambia la spec. El flujo completo está en [docs/FLUJO-SDD.md](docs/FLUJO-SDD.md).
1. **`main` siempre funciona.** Nadie sube cambios directo a `main`. Si `main` se rompe, arreglarlo es la prioridad del equipo.
2. **Una tarea = un issue = una rama.** Antes de programar, crea (o tómate) un issue. Luego crea una rama solo para ese issue.
3. **Todo entra por pull request.** Cuando termines, abres un PR hacia `main` y una compañera lo revisa antes de fusionarlo.
4. **La IA propone, una persona decide.** La IA puede escribir código, issues y PRs, pero ninguna sugerencia de la IA entra a `main` sin que una persona la lea y la apruebe.

## El flujo, paso a paso

```
Issue #12  →  rama 12-formulario-registro  →  commits  →  Pull Request  →  revisión  →  merge a main
```

### 1. Crea o elige un issue

- Usa la plantilla **Tarea** o **Bug**. Cada tarea cita los requisitos (RF) de la spec que cumple.
- Asígnatelo para que el equipo sepa que lo estás trabajando.
- Una tarea debe poder terminarse en unas pocas horas. Si es más grande, divídela.

### 2. Crea tu rama

Nombre: `número-del-issue-descripcion-corta`, en minúsculas y con guiones.

```bash
git checkout main
git pull
git checkout -b 12-formulario-registro
```

Ejemplos: `7-pagina-inicio`, `15-arreglar-boton-enviar`, `21-conectar-base-de-datos`.

### 3. Haz commits pequeños y claros

Mensaje en español, en presente, que diga qué cambia:

```bash
git commit -m "Agrega validación de correo en el formulario"
```

Prefijos opcionales: `feat:` (algo nuevo), `fix:` (arreglo), `docs:` (documentación), `test:` (pruebas).

### 4. Abre un pull request

- Hacia `main`.
- Usa la plantilla de PR y escribe `Closes #12` para que el issue se cierre solo al fusionar.
- Pide revisión a **una compañera** (no a ti misma).

### 5. Revisa el trabajo de tus compañeras

Al revisar, pregúntate:

- ¿Entiendo qué hace este cambio?
- ¿Cumple los requisitos (RF) que dice cumplir, y cada uno tiene su prueba?
- ¿La CI está en verde?
- ¿Rompe algo que ya funcionaba?
- Si lo escribió la IA, ¿alguien lo leyó línea por línea?

Comenta con amabilidad y concreción. "Esto podría fallar si el campo está vacío" ayuda más que "está mal".

### 6. Fusiona y limpia

- Solo fusiona cuando haya **al menos una aprobación**.
- Borra la rama después del merge.
- Actualiza tu `main` local: `git checkout main && git pull`.

## Usar la IA con el MCP de GitHub

Con el MCP de GitHub puedes pedirle al agente cosas como:

- *"Crea un issue para el formulario de registro con la plantilla de tarea y asígnamelo"*
- *"Crea la rama para el issue #12"*
- *"¿Qué cambió en la rama de Ana desde ayer?"*
- *"Resume los PRs abiertos y dime cuáles esperan mi revisión"*
- *"Abre un PR de mi rama hacia main que cierre el issue #12"*

El agente te pedirá confirmación antes de cada acción en GitHub. **Lee lo que va a hacer antes de aceptar.**

## Si algo sale mal

- **Conflicto al fusionar:** no entres en pánico. Pide ayuda a tu mentora o a una compañera, o pídele al agente que te explique el conflicto antes de resolverlo.
- **Subí algo a `main` por error:** avisa al equipo enseguida. Se revierte con un PR, no borrando historia.
- **Subí una contraseña o clave:** avisa de inmediato, cámbiala (rótala) en el servicio y luego se limpia del repo.

## Nunca subas

- Contraseñas, tokens o claves de API (usa un archivo `.env`, que ya está en `.gitignore`).
- Datos personales reales de personas beneficiarias.
- Carpetas pesadas como `node_modules/`.
