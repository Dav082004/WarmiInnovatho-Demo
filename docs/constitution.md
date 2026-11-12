# Constitución de Warmi Mentoras

Principios innegociables. Toda spec, plan y tarea debe cumplirlos.

1. **La spec manda.** Ningún comportamiento se implementa si no está en la spec activa. Si falta una decisión, se detiene el trabajo y se pregunta.
2. **Simplicidad primero.** HTML, CSS y JavaScript sin frameworks ni dependencias. Los datos viven en archivos JSON que la ONG puede editar desde la web de GitHub. Sin servidor ni base de datos.
3. **Lógica separada de la interfaz.** Todo lo que decide qué se muestra vive en módulos de lógica (`js/mentoras.js`, `js/match.js`) que se prueban sin navegador. Los archivos de vista (`js/app.js`, `js/vista-match.js`) solo pintan.
4. **Pruebas como puerta.** Cada tarea termina con sus pruebas en verde (`npm test`). No se fusiona con pruebas en rojo.
5. **`main` siempre funciona.** Todo entra por pull request revisado por una persona distinta de la autora.
6. **Cuidamos a las personas.** Solo datos ficticios, sin secretos en el repo, usable desde un celular de 360 px y con teclado.
7. **Idioma.** Todo en español: documentación, mensajes, nombres de funciones y variables.
