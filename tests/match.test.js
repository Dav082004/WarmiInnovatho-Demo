import { test } from "node:test";
import assert from "node:assert/strict";
import { calcularMatch, recomendar, PUNTOS } from "../js/match.js";

const objetivos = [
  { id: "becas", texto: "Postular a una beca" },
  { id: "portafolio", texto: "Armar un portafolio" },
];

const lucia = { nombre: "Lucía Paredes", area: "Datos", ayudaCon: ["becas"], dias: ["lunes"], momento: "noche" };
const killa = { nombre: "Killa Mamani", area: "Datos", ayudaCon: ["portafolio"], dias: ["sábado"], momento: "mañana" };
const angela = { nombre: "Ángela Rojas", area: "Diseño UX", ayudaCon: ["portafolio"], dias: ["martes"], momento: "noche" };
const sumaq = { nombre: "Sumaq Quispe", area: "Desarrollo web", ayudaCon: ["portafolio"], dias: ["domingo"], momento: "tarde" };
const mentoras = [sumaq, lucia, angela, killa];

const nombres = (resultado) => resultado.map((r) => r.mentora.nombre);

test("RF-8: muestra como máximo 3 mentoras, de mayor a menor compatibilidad", () => {
  const resultado = recomendar(mentoras, { area: "Datos", objetivo: "portafolio", dias: "fin-de-semana", momento: "noche" }, objetivos);
  assert.equal(resultado.length, 3);
  assert.deepEqual(resultado.map((r) => r.puntos), [6, 4, 3]);
  assert.deepEqual(nombres(resultado), ["Killa Mamani", "Lucía Paredes", "Ángela Rojas"]);
});

test("RF-8: deja fuera a las mentoras que no suman ningún punto", () => {
  const resultado = recomendar(mentoras, { area: "Datos", objetivo: "becas" }, objetivos);
  assert.deepEqual(nombres(resultado), ["Lucía Paredes", "Killa Mamani"]);
});

test("RF-9: suma 3 por área, 2 por objetivo, 1 por días y 1 por momento", () => {
  assert.deepEqual(PUNTOS, { area: 3, objetivo: 2, dias: 1, momento: 1 });
  const { puntos } = calcularMatch(lucia, { area: "Datos", objetivo: "becas", dias: "entre-semana", momento: "noche" }, objetivos);
  assert.equal(puntos, 7);
});

test("RF-9: el área coincide sin importar mayúsculas ni tildes", () => {
  assert.equal(calcularMatch(angela, { area: "diseno ux" }).puntos, 3);
});

test("RF-9: 'Aún no lo sé', 'Cualquier día' y 'Cualquier momento' no suman a nadie", () => {
  for (const m of mentoras) {
    assert.equal(calcularMatch(m, { area: "", objetivo: "", dias: "", momento: "" }).puntos, 0);
  }
});

test("RF-9: basta un día en común para sumar el punto de días", () => {
  const ana = { ...killa, dias: ["viernes", "sábado"] };
  assert.equal(calcularMatch(ana, { dias: "fin-de-semana" }).puntos, 1);
  assert.equal(calcularMatch(ana, { dias: "entre-semana" }).puntos, 1);
  assert.equal(calcularMatch(killa, { dias: "entre-semana" }).puntos, 0);
});

test("RF-10: si empatan, van en orden alfabético sin que la tilde altere el orden", () => {
  const resultado = recomendar(mentoras, { objetivo: "portafolio" }, objetivos);
  assert.deepEqual(nombres(resultado), ["Ángela Rojas", "Killa Mamani", "Sumaq Quispe"]);
});

test("RF-11: da una razón por cada criterio que sumó, en lenguaje simple", () => {
  const { razones } = calcularMatch(lucia, { area: "Datos", objetivo: "becas", dias: "entre-semana", momento: "noche" }, objetivos);
  assert.deepEqual(razones, [
    "Trabaja en Datos",
    "Te puede ayudar a postular a una beca",
    "Puede entre semana",
    "Puede por la noche",
  ]);
});

test("RF-11: sin puntos no hay razones", () => {
  assert.deepEqual(calcularMatch(sumaq, { area: "Datos" }).razones, []);
});

test("RF-12: si nadie suma puntos, el resultado está vacío", () => {
  assert.deepEqual(recomendar(mentoras, { area: "Ciberseguridad", objetivo: "entrevistas" }, objetivos), []);
});

test("recomendar no modifica la lista original", () => {
  const copia = [...mentoras];
  recomendar(mentoras, { objetivo: "portafolio" }, objetivos);
  assert.deepEqual(mentoras, copia);
});
