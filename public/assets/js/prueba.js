async function renderizarTarjetas() {
  // 1) Obtener datos
  const resp = await fetch("combo/pruebita");
  const data = await resp.json();

  // 2) Agrupar por receta_nombre
  const agrupado = data.reduce((acum, item) => {
    const nombre = item.receta_nombre;
    if (!acum[nombre]) acum[nombre] = [];
    acum[nombre].push(item);
    return acum;
  }, {});

  Object.entries(agrupado).forEach(([receta, ingredientes]) => {
    console.log(receta, ingredientes);
  });
}
// renderizarTarjetas();
