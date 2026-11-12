---
name: verificar-antes-de-terminar
description: Exige evidencia antes de decir que algo está listo, arreglado o que pasa las pruebas. Úsala antes de hacer commit, abrir un PR o decirle a la persona que terminaste.
---

# Verificar antes de terminar

**Regla: evidencia antes que afirmaciones.** Decir "listo" sin haberlo comprobado es faltar a la verdad, aunque sea sin querer.

Antes de afirmar que algo funciona:

1. **Identifica** qué comando lo demuestra (las pruebas, ejecutar la app, abrir la página).
2. **Ejecútalo** completo, ahora. No vale un resultado anterior.
3. **Lee** la salida entera: cuántas pruebas pasaron, cuántas fallaron, qué errores hay.
4. **Compara** con los RF de la tarea, uno por uno. Que las pruebas pasen no significa que la tarea cumpla la spec.
5. **Recién entonces** dilo, mostrando la evidencia.

| Para afirmar… | Necesitas… | No alcanza con… |
| --- | --- | --- |
| "Las pruebas pasan" | La salida del comando con 0 fallos | "Debería pasar" |
| "El bug está arreglado" | Reproducir el caso original y verlo funcionar | Haber cambiado el código |
| "La tarea está hecha" | Cada RF comprobado | Que las pruebas pasen |
| "Está desplegado" | Abrir el enlace y probar el flujo | Que el despliegue no diera error |

Si te descubres escribiendo "debería funcionar", "probablemente" o "parece que", detente y verifica.

Si algo no se pudo verificar, dilo tal cual: qué falta y por qué.

Adaptada de `verification-before-completion` (obra/superpowers, MIT).
