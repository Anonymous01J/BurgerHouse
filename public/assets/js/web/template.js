export default function Templates() {
  function targetCategories(data) {
    if (!Array.isArray(data) || data.length === 0) {
      console.warn("No hay categorías para mostrar.");
      return `<li>No hay categorías disponibles.</li>`;
    }

    let html = `<li data-filter="*" class="filter-active">Todos</li>`;
    data.forEach((category) => {
      html += `<li data-filter=".filter-${category.id}">${category.nombre}</li>`;
    });
    return html;
  }
  function targetProductsPrepared(data) {
    if (!Array.isArray(data) || data.length === 0) {
      console.warn("No hay productos preparados para mostrar.");
      return `<div>No hay productos preparados disponibles.</div>`;
    }

    let html = "";
    data.forEach((product) => {
      html += `
            <div class="col-lg-6 menu-item isotope-item filter-${product.id_categoria}">
                <img src="assets/img/menu/${product.imagen}.jpg" class="menu-img" alt="${product.nombre}">
                <div class="menu-content d-flex justify-content-between align-items-center">
                    <a href="#">${product.nombre}</a><span>$${product.precio}</span>
                </div>
                <div class="menu-ingredients mb-2">
                    ${product.detalles}
                </div>
                <div class="d-flex justify-content-end">
                    <button
                    class="btn btn-book-a-table"
                    data-bs-toggle="modal"
                    data-bs-target="#addToCartModal"
                    data-id="${product.id}"
                    data-name="${product.nombre}"
                    data-price="${product.precio}">
                    Agregar al carrito <i class="uil uil-shopping-cart-alt"></i>
                    </button>
                </div>
            </div>
            `;
    });
    return html;
  }
  return {
    targetProductsPrepared,
    targetCategories,
  };
}
