// Revisa que los archivos de datos estén bien antes de publicarlos.
// Si la ONG edita data/mentoras.json y se equivoca, la CI lo avisa en el PR.
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { DIAS_SEMANA, MOMENTOS } from "../js/match.js";

const leer = (ruta) => JSON.parse(readFileSync(new URL(ruta, import.meta.url), "utf8"));
const mentoras = leer("../data/mentoras.json");
const catalogo = leer("../data/catalogo.json");

test("Datos: cada mentora tiene los campos que la interfaz necesita y un id único", () => {
  assert.ok(mentoras.length > 0);
  const ids = new Set();
  for (const m of mentoras) {
    for (const campo of ["id", "nombre", "area", "momento", "presentacion"]) {
      assert.equal(typeof m[campo], "string", `${m.id}: falta ${campo}`);
      assert.notEqual(m[campo].trim(), "", `${m.id}: ${campo} está vacío`);
    }
    for (const lista of ["temas", "ayudaCon", "dias"]) {
      assert.ok(Array.isArray(m[lista]) && m[lista].length > 0, `${m.id}: falta ${lista}`);
    }
    assert.ok(!ids.has(m.id), `id repetido: ${m.id}`);
    ids.add(m.id);
  }
});

test("Datos: el área de cada mentora existe en el catálogo", () => {
  const areas = catalogo.areas.map((a) => a.nombre);
  for (const m of mentoras) {
    assert.ok(areas.includes(m.area), `${m.id}: el área "${m.area}" no está en data/catalogo.json`);
  }
});

test("Datos: los objetivos, días y momentos de cada mentora son valores conocidos", () => {
  const objetivos = catalogo.objetivos.map((o) => o.id);
  for (const m of mentoras) {
    for (const o of m.ayudaCon) assert.ok(objetivos.includes(o), `${m.id}: objetivo desconocido "${o}"`);
    for (const d of m.dias) assert.ok(DIAS_SEMANA.includes(d), `${m.id}: día desconocido "${d}"`);
    assert.ok(MOMENTOS.includes(m.momento), `${m.id}: momento desconocido "${m.momento}"`);
  }
});
