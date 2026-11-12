# Más skills y herramientas (opcionales)

Este repo trae las skills que acompañan el flujo. Si su proyecto necesita algo más, estas colecciones sirven como plantilla. Revisen la licencia de cada una antes de copiarla y tradúzcanlas o adáptenlas a sus reglas.

| Colección | Skill o agente | Fase | Para qué |
| --- | --- | --- | --- |
| [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | `impeccable` | Diseño | Vocabulario de diseño y detector de interfaces "hechas por IA". Ver `.agents/skills/diseno/`. |
| [anthropics/skills](https://github.com/anthropics/skills) | `frontend-design` | Diseño | Dirección visual con intención. |
| anthropics/skills | `webapp-testing` | Pruebas | Probar la web en el navegador con Playwright. |
| anthropics/skills | `skill-creator` | Cualquiera | Crear sus propias skills. |
| [github/awesome-copilot](https://github.com/github/awesome-copilot) | `create-specification`, `prd` | Requisitos | Otras formas de escribir la spec. |
| github/awesome-copilot | `create-implementation-plan` | Plan | Otra plantilla de plan. |
| github/awesome-copilot | `breakdown-test`, `playwright-generate-test` | Pruebas | Estrategia de pruebas y pruebas generadas con el MCP de Playwright. |
| github/awesome-copilot | `create-readme`, `git-commit` | Entrega | README y commits ordenados. |
| [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | `deploy-to-vercel`, `react-best-practices` | Despliegue | Si eligen Vercel o React. |
| [obra/superpowers](https://github.com/obra/superpowers) | (varias) | Todas | El origen de varias skills de este repo, en inglés y más completas. |
| [mouredev/hello-sdd](https://github.com/mouredev/hello-sdd) | curso y ejemplo | Todas | Curso en español de Spec-Driven Development. |

## Conectar más herramientas por MCP

El MCP de GitHub ya está configurado. Otras herramientas se suman en `.vscode/mcp.json` (y en `opencode.json`) siguiendo la documentación de cada una. Son opcionales y cada equipo usa la tecnología que mejor le sirva:

- **Despliegue:** Vercel, Netlify.
- **Datos:** Supabase.
- **Diseño:** Figma.
- **Pruebas en navegador:** Playwright.

## Diseñar sin código

También pueden hacer sus mockups en Figma, generar pantallas con Google Stitch o dibujarlas a mano. Lo importante es que respondan a la spec.
