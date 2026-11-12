# Spec 002: Mi match

Estado: **aprobada** · RF-8 a RF-12 implementados · Depende de la spec 001 (usa sus datos y su directorio)

> La numeración de los RF **continúa** la de la spec 001 (que llega a RF-7). Así ningún RF se repite en el repo y un issue que diga "RF-9" no deja dudas.

## Contexto y objetivo

El directorio de la spec 001 funciona si la aprendiz sabe qué buscar. En la prueba con usuarias apareció el problema: quien recién empieza no conoce las palabras ("¿qué es UX?", "¿backend?") y no sabe qué escribir en el buscador. Se va sin contactar a nadie.

Queremos que, respondiendo **3 preguntas en lenguaje simple**, la aprendiz reciba hasta 3 mentoras sugeridas, cada una con el porqué.

## Propuesta de valor

- **No te pedimos que busques: te preguntamos qué necesitas.** Las áreas se explican con una frase, sin jerga.
- **Cada sugerencia dice por qué.** Nada de "caja negra": las reglas son cuatro, se muestran en la página y la ONG puede leerlas y ajustarlas.
- **Privacidad por diseño.** Sin cuenta y sin servidor: las respuestas se calculan en el celular y no se guardan ni se envían.

## Usuarias / actores

- **Aprendiz:** la misma de la spec 001. No conoce la jerga del sector.
- **Coordinadora de la ONG:** mantiene, además de las mentoras, el catálogo de áreas y objetivos.

## Historias de usuaria

- H5: Como aprendiz que no sabe por dónde empezar, quiero responder unas preguntas simples para que me sugieran con quién hablar.
- H6: Como aprendiz, quiero saber por qué me sugieren a una mentora para confiar en la sugerencia.
- H7: Como coordinadora, quiero entender y ajustar las reglas de la sugerencia sin depender de una programadora.

## Requisitos funcionales (criterios de aceptación en EARS)

Las tres preguntas son: **área** (una de las del catálogo, o "Aún no lo sé"), **objetivo** (uno del catálogo) y **cuándo puede** (días: entre semana, fines de semana o cualquier día; momento: mañana, tarde, noche o cualquier momento).

- RF-8: CUANDO la aprendiz responde las preguntas y pulsa "Ver mi match", EL SISTEMA muestra hasta 3 mentoras que sumen al menos 1 punto, de mayor a menor puntaje.
- RF-9: EL SISTEMA suma 3 puntos si el área de la mentora es la elegida, 2 si la mentora ayuda con el objetivo elegido, 1 si tiene al menos un día disponible dentro de los días elegidos y 1 si su momento del día es el elegido.
- RF-10: CUANDO dos mentoras suman los mismos puntos, EL SISTEMA las ordena alfabéticamente por nombre.
- RF-11: EL SISTEMA muestra junto a cada mentora sugerida una razón por cada criterio que sumó puntos (por ejemplo "Trabaja en Datos" o "Te puede ayudar a postular a una beca").
- RF-12: SI ninguna mentora suma puntos, ENTONCES EL SISTEMA muestra el mensaje "Todavía no tenemos una mentora para eso" y un enlace al directorio completo.

## Requisitos no funcionales

- Las respuestas no se guardan ni se envían a ningún lado: todo se calcula en el navegador.
- Cada área se explica en una frase sin jerga.
- La página muestra cómo se calcula el puntaje.
- Lo mismo que la spec 001: 360 px sin scroll horizontal, uso con teclado y contraste 4.5:1. Al mostrar el resultado, el foco pasa al resultado.

## Casos límite

- "Aún no lo sé", "Cualquier día" y "Cualquier momento" no suman puntos a nadie (no son un comodín que favorece a todas).
- Mentora con varios días (por ejemplo viernes y sábado): basta un día en común para sumar.
- El área se compara sin distinguir mayúsculas ni tildes.
- Un objetivo del catálogo que todavía no tiene mentoras: se aplica RF-12 si nada más suma.
- Si falta responder el área o el objetivo, el navegador pide completarlo antes de calcular.

## Fuera de alcance

- Inteligencia artificial o aprendizaje automático: las reglas son fijas y explicables a propósito.
- Guardar las respuestas o el historial de la aprendiz.
- Contactar a la mentora desde la página (sigue siendo trabajo de la ONG).
- Ajustar los puntos desde la página: se cambian en `js/match.js` por pull request.

## Criterios de finalización

RF-8 a RF-12 con su prueba en verde, prueba de integridad de los datos en verde, demo publicada y el recorrido "Datos + beca + entre semana por la noche" hecho en un celular.

## Dudas abiertas

Ninguna. Resueltas en la clarificación con QA:

- ¿"Aún no lo sé" suma a todas? No: no suma a nadie, para que no distorsione el orden.
- ¿Mostramos el puntaje en números? No: mostramos las razones, que se entienden mejor, y una línea con la regla.
- ¿Los días y el momento se cruzan (por ejemplo "sábado por la noche")? No: se comparan por separado. Es más simple y suficiente para orientar.
