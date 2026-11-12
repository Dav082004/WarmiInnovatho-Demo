// Conecta la página con la lógica de mentoras.js.
import { areasDisponibles, filtrarMentoras, textoContador } from "./mentoras.js";

const selectorArea = document.querySelector("#area");
const campoTexto = document.querySelector("#texto");
const formulario = document.querySelector("#filtros");
const lista = document.querySelector("#resultados");
const contador = document.querySelector("#contador");
const vacio = document.querySelector("#vacio");
const botonLimpiar = document.querySelector("#limpiar");
const error = document.querySelector("#error");

let mentoras = [];

function crearElemento(etiqueta, clase, texto) {
  const elemento = document.createElement(etiqueta);
  if (clase) elemento.className = clase;
  if (texto) elemento.textContent = texto;
  return elemento;
}

function crearFila(mentora) {
  const fila = crearElemento("li", "mentora");

  const encabezado = crearElemento("div", "mentora-encabezado");
  encabezado.append(
    crearElemento("h2", "mentora-nombre", mentora.nombre),
    crearElemento("p", "mentora-area", mentora.area)
  );

  const temas = crearElemento("ul", "temas");
  temas.setAttribute("aria-label", "Temas");
  for (const tema of mentora.temas) {
    temas.append(crearElemento("li", "", tema));
  }

  fila.append(
    encabezado,
    crearElemento("p", "mentora-presentacion", mentora.presentacion),
    temas,
    crearElemento("p", "mentora-disponibilidad", `Disponible: ${mentora.disponibilidad}`)
  );
  return fila;
}

function pintar() {
  const resultado = filtrarMentoras(mentoras, {
    area: selectorArea.value,
    texto: campoTexto.value,
  });

  lista.replaceChildren(...resultado.map(crearFila));
  contador.textContent = textoContador(resultado.length);
  vacio.hidden = resultado.length > 0;
  lista.hidden = resultado.length === 0;
}

function llenarAreas() {
  for (const area of areasDisponibles(mentoras)) {
    const opcion = crearElemento("option", "", area);
    opcion.value = area;
    selectorArea.append(opcion);
  }
}

async function iniciar() {
  contador.textContent = "Cargando mentoras…";
  try {
    const respuesta = await fetch("data/mentoras.json");
    if (!respuesta.ok) throw new Error(`Estado ${respuesta.status}`);
    mentoras = await respuesta.json();
    llenarAreas();
    pintar();
  } catch (problema) {
    console.error(problema);
    contador.textContent = "";
    error.hidden = false;
  }
}

formulario.addEventListener("submit", (evento) => evento.preventDefault());
selectorArea.addEventListener("change", pintar);
campoTexto.addEventListener("input", pintar);
botonLimpiar.addEventListener("click", () => {
  formulario.reset();
  pintar();
  campoTexto.focus();
});

iniciar();
