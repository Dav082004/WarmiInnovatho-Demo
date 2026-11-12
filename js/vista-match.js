// Pinta "Mi match" (spec 002). La lógica vive en match.js; aquí solo se arma la página.
// Está en su propio archivo para que quien trabaje aquí no choque con quien toca app.js.
import { recomendar } from "./match.js";
import { textoDisponibilidad } from "./mentoras.js";

function crear(etiqueta, clase, texto) {
  const elemento = document.createElement(etiqueta);
  if (clase) elemento.className = clase;
  if (texto) elemento.textContent = texto;
  return elemento;
}

/** Una opción de radio grande, fácil de tocar en el celular. */
function crearOpcion(nombre, valor, titulo, detalle, requerida) {
  const etiqueta = crear("label", "opcion");
  const radio = crear("input");
  radio.type = "radio";
  radio.name = nombre;
  radio.value = valor;
  radio.required = requerida;
  const textos = crear("span", "opcion-textos");
  textos.append(crear("span", "opcion-titulo", titulo));
  if (detalle) textos.append(crear("span", "opcion-detalle", detalle));
  etiqueta.append(radio, textos);
  return etiqueta;
}

function crearRecomendacion({ mentora, razones }, posicion) {
  const fila = crear("li", "match");
  fila.append(crear("span", "match-posicion", String(posicion)));

  const cuerpo = crear("div", "match-cuerpo");
  const encabezado = crear("div", "mentora-encabezado");
  encabezado.append(
    crear("h4", "mentora-nombre", mentora.nombre),
    crear("p", "mentora-area", mentora.area)
  );

  const porQue = crear("ul", "razones");
  porQue.setAttribute("aria-label", "Por qué te la sugerimos");
  for (const razon of razones) porQue.append(crear("li", "", razon));

  cuerpo.append(
    encabezado,
    crear("p", "mentora-presentacion", mentora.presentacion),
    porQue,
    crear("p", "mentora-disponibilidad", `Disponible: ${textoDisponibilidad(mentora)}`)
  );
  fila.append(cuerpo);
  return fila;
}

export function iniciarMatch(mentoras, catalogo) {
  const formulario = document.querySelector("#form-match");
  const opcionesArea = document.querySelector("#opciones-area");
  const opcionesObjetivo = document.querySelector("#opciones-objetivo");
  const resultado = document.querySelector("#resultado-match");
  const listaMatch = document.querySelector("#match-lista");
  const vacio = document.querySelector("#match-vacio");

  for (const area of catalogo.areas) {
    opcionesArea.append(crearOpcion("area", area.nombre, area.nombre, area.descripcion, true));
  }
  opcionesArea.append(crearOpcion("area", "", "Aún no lo sé", "Te sugerimos según lo demás", true));

  for (const objetivo of catalogo.objetivos) {
    opcionesObjetivo.append(crearOpcion("objetivo", objetivo.id, objetivo.texto, "", true));
  }

  formulario.addEventListener("submit", (evento) => {
    evento.preventDefault();
    const datos = new FormData(formulario);
    const respuestas = Object.fromEntries(datos.entries());
    const recomendadas = recomendar(mentoras, respuestas, catalogo.objetivos);

    listaMatch.replaceChildren(...recomendadas.map((r, i) => crearRecomendacion(r, i + 1)));
    resultado.hidden = recomendadas.length === 0;
    vacio.hidden = recomendadas.length > 0;

    // Lleva el foco al resultado para quien usa teclado o lector de pantalla.
    const destino = recomendadas.length > 0 ? resultado : vacio;
    destino.querySelector("h3").focus();
  });
}
