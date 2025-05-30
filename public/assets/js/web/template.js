export default function Templates() {
  function targetCategories(data) {
   return`<li data-filter=".filter-${data.id}">${data.nombre}</li>`;
  }
  function targetProductsPrepared(data) {
      return `<div class="col-lg-6 menu-item isotope-item filter-${data.id_categoria}">
                <img src="assets/img/menu/${data.imagen}.jpg" class="menu-img" alt="${data.nombre}">
                <div class="menu-content d-flex justify-content-between align-items-center">
                    <a href="#">${data.nombre}</a><span>$${data.precio}</span>
                </div>
                <div class="menu-ingredients mb-2">
                    ${data.detalles}
                </div>
                <div class="d-flex justify-content-end">
                    <button
                    class="btn btn-book-a-table"
                    data-bs-toggle="modal"
                    data-bs-target="#addToCartModal"
                    data-id="${data.id}"
                    data-name="${data.nombre}"
                    data-price="${data.precio}">
                    Agregar al carrito <i class="uil uil-shopping-cart-alt"></i>
                    </button>
                </div>
            </div>`;
  }
  return {
    targetProductsPrepared,
    targetCategories,
  };
}