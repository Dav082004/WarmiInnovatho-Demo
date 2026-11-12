// Lógica del directorio. No toca la página: así se puede probar sin navegador.

/** Quita tildes y mayúsculas para comparar textos. */
export function normalizar(texto) {
  return String(texto ?? "")
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .toLowerCase()
    .trim();
}

/** RF-1: devuelve una copia ordenada alfabéticamente por nombre. */
export function ordenarPorNombre(mentoras) {
  return [...mentoras].sort((a, b) =>
    normalizar(a.nombre).localeCompare(normalizar(b.nombre), "es")
  );
}

/** Áreas disponibles, sin repetir y en orden alfabético (para el selector). */
export function areasDisponibles(mentoras) {
  const areas = new Set(mentoras.map((m) => m.area));
  return [...areas].sort((a, b) => a.localeCompare(b, "es"));
}

/**
 * RF-2, RF-3 y RF-4: filtra por área y por texto (nombre o temas).
 * Un filtro vacío no restringe nada.
 */
export function filtrarMentoras(mentoras, { area = "", texto = "" } = {}) {
  const areaBuscada = normalizar(area);
  const textoBuscado = normalizar(texto);

  const resultado = mentoras.filter((mentora) => {
    const coincideArea =
      areaBuscada === "" || normalizar(mentora.area) === areaBuscada;

    const dondeBuscar = normalizar(
      [mentora.nombre, ...(mentora.temas ?? [])].join(" ")
    );
    const coincideTexto =
      textoBuscado === "" || dondeBuscar.includes(textoBuscado);

    return coincideArea && coincideTexto;
  });

  return ordenarPorNombre(resultado);
}

/** RF-6: texto del contador de resultados. */
export function textoContador(cantidad) {
  if (cantidad === 0) return "Sin resultados";
  return cantidad === 1 ? "1 mentora" : `${cantidad} mentoras`;
}
