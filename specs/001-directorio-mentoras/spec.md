# Spec 001: Directorio de mentoras

Estado: **aprobada** · RF-1 a RF-6 implementados · RF-7 pendiente (tarea T7)

## Contexto y objetivo

Muchas mujeres que quieren empezar en tecnología no conocen a ninguna otra mujer que trabaje en el rubro. Sin un referente cercano a quien preguntarle, es más fácil abandonar antes de empezar. Queremos que cualquier mujer encuentre en menos de un minuto a una mentora voluntaria del área que le interesa.

## Propuesta de valor

No es un curso más. Es el primer contacto humano: una persona real, con una historia parecida, que dice cuándo está disponible. Para la ONG es una herramienta que puede mantener sin programar, porque las mentoras se agregan editando un solo archivo.

## Usuarias / actores

- **Aprendiz:** mujer que quiere empezar en tecnología. Entra desde el celular, usa WhatsApp a diario y no necesariamente sabe programar.
- **Coordinadora de la ONG:** mantiene la lista de mentoras.

## Historias de usuaria

- H1: Como aprendiz quiero ver qué mentoras hay para saber que no estoy sola.
- H2: Como aprendiz quiero filtrar por el área que me interesa para no leer toda la lista.
- H3: Como aprendiz quiero buscar un tema concreto (por ejemplo "becas") para encontrar a quien sepa de eso.
- H4: Como aprendiz quiero compartir una mentora con una amiga por WhatsApp.

## Requisitos funcionales (criterios de aceptación en EARS)

- RF-1: CUANDO la aprendiz abre la página, EL SISTEMA muestra todas las mentoras ordenadas alfabéticamente por nombre, cada una con su nombre, área, presentación, temas y disponibilidad.
- RF-2: CUANDO la aprendiz elige un área, EL SISTEMA muestra solo las mentoras de esa área.
- RF-3: CUANDO la aprendiz escribe en el buscador, EL SISTEMA muestra solo las mentoras cuyo nombre o temas contienen ese texto, sin distinguir mayúsculas ni tildes.
- RF-4: MIENTRAS haya un área elegida y un texto escrito, EL SISTEMA muestra solo las mentoras que cumplen ambas condiciones.
- RF-5: SI ninguna mentora cumple los filtros, ENTONCES EL SISTEMA muestra el mensaje "Aún no hay mentoras para esa búsqueda" y un botón que limpia los filtros.
- RF-6: EL SISTEMA muestra cuántas mentoras hay en el resultado ("1 mentora", "5 mentoras" o "Sin resultados").
- RF-7: CUANDO la aprendiz pulsa "Compartir" en una mentora, EL SISTEMA abre WhatsApp con un mensaje que incluye el nombre de la mentora, su área y el enlace de la página.

## Requisitos no funcionales

- Se usa sin scroll horizontal en una pantalla de 360 px de ancho.
- Se puede recorrer y usar solo con teclado.
- El contraste del texto cumple 4.5:1.

## Casos límite

- El buscador recibe solo espacios: se trata como vacío.
- Texto con tildes o mayúsculas distintas a las de los datos ("ANGELA" encuentra a "Ángela").
- El archivo de datos no carga: se muestra un mensaje de error en lugar de una lista vacía.

## Fuera de alcance

- Registro e inicio de sesión.
- Que las mentoras se inscriban solas desde la página.
- Chat o agenda de citas dentro del sitio.
- Datos reales de personas: en esta entrega todas las mentoras son ficticias.

## Criterios de finalización

Todos los RF con su prueba en verde, la CI en verde en `main`, la demo publicada y el recorrido manual del flujo principal hecho en un celular.

## Dudas abiertas

Ninguna. Resueltas en la clarificación:

- ¿La búsqueda mira también la presentación? No: solo nombre y temas, para que los resultados sean predecibles.
- ¿Cómo contacta la aprendiz a la mentora? Fuera de alcance por ahora; la ONG hace el contacto. Solo se comparte la ficha (RF-7).
