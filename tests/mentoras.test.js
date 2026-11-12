import { test } from "node:test";
import assert from "node:assert/strict";
import {
  normalizar,
  ordenarPorNombre,
  areasDisponibles,
  filtrarMentoras,
  textoContador,
  textoDisponibilidad,
} from "../js/mentoras.js";

const ejemplo = [
  { nombre: "Valeria Torres", area: "Desarrollo web", temas: ["React"] },
  { nombre: "Ángela Rojas", area: "Diseño UX", temas: ["Figma", "portafolio"] },
  { nombre: "Killa Mamani", area: "Datos", temas: ["Python", "análisis de datos"] },
  { nombre: "Sumaq Quispe", area: "Desarrollo web", temas: ["JavaScript"] },
];

const nombres = (lista) => lista.map((m) => m.nombre);

test("RF-1: ordena alfabéticamente por nombre, sin que la tilde altere el orden", () => {
  assert.deepEqual(nombres(ordenarPorNombre(ejemplo)), [
    "Ángela Rojas",
    "Killa Mamani",
    "Sumaq Quispe",
    "Valeria Torres",
  ]);
});

test("RF-1: ordenar no modifica la lista original", () => {
  const copia = [...ejemplo];
  ordenarPorNombre(ejemplo);
  assert.deepEqual(ejemplo, copia);
});

test("RF-1: sin filtros devuelve todas las mentoras", () => {
  assert.equal(filtrarMentoras(ejemplo).length, 4);
});

test("RF-2: filtra por área", () => {
  assert.deepEqual(nombres(filtrarMentoras(ejemplo, { area: "Desarrollo web" })), [
    "Sumaq Quispe",
    "Valeria Torres",
  ]);
});

test("RF-2: las áreas del selector no se repiten y van en orden", () => {
  assert.deepEqual(areasDisponibles(ejemplo), ["Datos", "Desarrollo web", "Diseño UX"]);
});

test("RF-3: busca en el nombre ignorando mayúsculas y tildes", () => {
  assert.deepEqual(nombres(filtrarMentoras(ejemplo, { texto: "ANGELA" })), ["Ángela Rojas"]);
});

test("RF-3: busca en los temas ignorando tildes", () => {
  assert.deepEqual(nombres(filtrarMentoras(ejemplo, { texto: "analisis" })), ["Killa Mamani"]);
});

test("RF-3: los espacios alrededor del texto no cuentan", () => {
  assert.equal(filtrarMentoras(ejemplo, { texto: "   " }).length, 4);
});

test("RF-4: área y texto se cumplen a la vez", () => {
  assert.deepEqual(
    nombres(filtrarMentoras(ejemplo, { area: "Desarrollo web", texto: "react" })),
    ["Valeria Torres"]
  );
});

test("RF-5: si nada coincide devuelve una lista vacía", () => {
  assert.deepEqual(filtrarMentoras(ejemplo, { area: "Datos", texto: "figma" }), []);
});

test("RF-6: el contador usa singular, plural y el caso vacío", () => {
  assert.equal(textoContador(0), "Sin resultados");
  assert.equal(textoContador(1), "1 mentora");
  assert.equal(textoContador(5), "5 mentoras");
});

test("normalizar tolera valores vacíos", () => {
  assert.equal(normalizar(undefined), "");
  assert.equal(normalizar("  Diseño UX "), "diseno ux");
});

test("RF-1: la disponibilidad se lee en frase, con plural y conectores", () => {
  assert.equal(textoDisponibilidad({ dias: ["sábado"], momento: "mañana" }), "Sábados por la mañana");
  assert.equal(textoDisponibilidad({ dias: ["martes", "jueves"], momento: "noche" }), "Martes y jueves por la noche");
  assert.equal(
    textoDisponibilidad({ dias: ["lunes", "miércoles", "domingo"], momento: "tarde" }),
    "Lunes, miércoles y domingos por la tarde"
  );
});

test("RF-1: sin días, la disponibilidad se coordina con la ONG", () => {
  assert.equal(textoDisponibilidad({}), "A coordinar con la ONG");
});
