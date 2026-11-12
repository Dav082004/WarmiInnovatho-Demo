// Lógica de "Mi match" (spec 002). No toca la página: se prueba sin navegador.
// Las reglas están a la vista a propósito: la ONG puede leerlas y ajustar los puntos.
import { normalizar, ordenarPorNombre } from "./mentoras.js";

/** RF-9: cuánto suma cada criterio. */
export const PUNTOS = { area: 3, objetivo: 2, dias: 1, momento: 1 };

export const DIAS_SEMANA = ["lunes", "martes", "miércoles", "jueves", "viernes", "sábado", "domingo"];
export const MOMENTOS = ["mañana", "tarde", "noche"];

const DIAS_POR_OPCION = {
  "entre-semana": ["lunes", "martes", "miércoles", "jueves", "viernes"],
  "fin-de-semana": ["sábado", "domingo"],
};

const TEXTO_DIAS = {
  "entre-semana": "Puede entre semana",
  "fin-de-semana": "Puede los fines de semana",
};

const enMinuscula = (texto) => texto.charAt(0).toLowerCase() + texto.slice(1);

/**
 * RF-9 y RF-11: puntos de una mentora para unas respuestas, y una razón por cada criterio que suma.
 * Una respuesta vacía ("Aún no lo sé", "Cualquier día", "Cualquier momento") no suma a nadie.
 */
export function calcularMatch(mentora, respuestas = {}, objetivos = []) {
  const { area = "", objetivo = "", dias = "", momento = "" } = respuestas;
  let puntos = 0;
  const razones = [];

  if (area && normalizar(mentora.area) === normalizar(area)) {
    puntos += PUNTOS.area;
    razones.push(`Trabaja en ${mentora.area}`);
  }

  if (objetivo && (mentora.ayudaCon ?? []).includes(objetivo)) {
    const elegido = objetivos.find((o) => o.id === objetivo);
    puntos += PUNTOS.objetivo;
    razones.push(`Te puede ayudar a ${enMinuscula(elegido?.texto ?? objetivo)}`);
  }

  const diasBuscados = DIAS_POR_OPCION[dias] ?? [];
  if ((mentora.dias ?? []).some((dia) => diasBuscados.includes(dia))) {
    puntos += PUNTOS.dias;
    razones.push(TEXTO_DIAS[dias]);
  }

  if (momento && mentora.momento === momento) {
    puntos += PUNTOS.momento;
    razones.push(`Puede por la ${momento}`);
  }

  return { puntos, razones };
}

/**
 * RF-8 y RF-10: hasta `limite` mentoras con al menos 1 punto,
 * de mayor a menor puntaje y, si empatan, en orden alfabético.
 */
export function recomendar(mentoras, respuestas, objetivos = [], limite = 3) {
  return ordenarPorNombre(mentoras)
    .map((mentora) => ({ mentora, ...calcularMatch(mentora, respuestas, objetivos) }))
    .filter((resultado) => resultado.puntos > 0)
    .sort((a, b) => b.puntos - a.puntos) // sort es estable: el empate conserva el orden alfabético
    .slice(0, limite);
}
