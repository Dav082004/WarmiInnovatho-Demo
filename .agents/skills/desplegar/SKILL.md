---
name: desplegar
description: Publica la demo del proyecto en la plataforma que elija el equipo y deja el enlace en el README. Úsala cuando pidan desplegar, publicar, "subir la demo" o conseguir un enlace para el jurado.
---

# Desplegar la demo

La plataforma es de **libre elección**. Revisa en `plan.md` cuál decidió el equipo. Si no hay decisión, propone la más simple para su stack y espera respuesta:

| Si el proyecto es… | Opción simple | ¿Tiene MCP? |
| --- | --- | --- |
| Web estática (HTML, CSS, JS) | GitHub Pages | Se configura con GitHub Actions |
| React, Next u otro framework web | Vercel o Netlify | Sí (se agrega a `.vscode/mcp.json`) |
| Con base de datos o login | Supabase o Firebase | Supabase sí |
| Python (Streamlit, Flask) | Streamlit Cloud o Render | No hace falta |

## Proceso

1. **Verifica antes.** `main` con pruebas en verde. Se despliega `main`, no una rama a medias.
2. **Secretos.** Las claves van en las variables de entorno de la plataforma, nunca en el repo. Revisa que `.env` no esté en el historial.
3. **Di qué vas a hacer** (plataforma, proyecto, rama) y espera confirmación. No crees cuentas ni proyectos de pago.
4. **Despliega** con el MCP de la plataforma si está conectado. Si no, entrega los pasos exactos para hacerlo desde la web.
5. **Comprueba.** Abre el enlace y recorre el flujo principal de la spec, también en tamaño de celular.
6. **Deja el enlace** en la sección Demo del `README.md`, por PR.

Despliega desde el primer avance que funcione, no el domingo en la noche. Una demo simple publicada vale más que una completa que solo corre en una laptop.
