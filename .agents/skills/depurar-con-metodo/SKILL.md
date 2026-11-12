---
name: depurar-con-metodo
description: Método para encontrar la causa de un error antes de intentar arreglarlo. Úsala ante cualquier bug, prueba que falla o comportamiento inesperado, antes de proponer un arreglo.
---

# Depurar con método

**Regla de hierro: no propongas un arreglo sin haber encontrado la causa.** Cambiar cosas al azar hace perder más tiempo del que ahorra.

## Fase 1: Entender

1. Lee el mensaje de error completo, con su traza. Suele decir exactamente qué pasa.
2. Reproduce el error con pasos exactos. Si no puedes reproducirlo, reúne más datos; no adivines.
3. Revisa qué cambió: `git diff`, `git log`, dependencias nuevas.
4. Si intervienen varias partes (página, lógica, datos), comprueba qué entra y qué sale de cada una para saber **dónde** se rompe.

## Fase 2: Comparar

Busca algo parecido que sí funcione en el proyecto y enumera las diferencias, por pequeñas que parezcan.

## Fase 3: Una hipótesis a la vez

1. Di con claridad: "Creo que la causa es X porque Y".
2. Haz el cambio **más pequeño** que la ponga a prueba. Una variable a la vez.
3. ¿No funcionó? Deshaz el cambio y formula otra hipótesis. No apiles arreglos.

## Fase 4: Arreglar

1. Escribe una prueba que falle por el bug.
2. Arregla la causa, no el síntoma.
3. Ejecuta todas las pruebas.

**Si tres intentos fallan, detente** y avisa a la persona: probablemente el problema está en el diseño y hay que conversarlo con el equipo o la mentora.

## Señales de alerta

Si te descubres pensando "probemos cambiar esto a ver", "seguro es esto" o "lo arreglo rápido y luego investigo", vuelve a la Fase 1.

Adaptada de `systematic-debugging` (obra/superpowers, MIT).
