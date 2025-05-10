export default function Templates() {
    function targetCategories(object) {
        return `
                <li data-filter="*" class="filter-active">Todos</li>
                <li data-filter=".filter-${object.id_categoria}">${object.nombre}</li>
            `
    }
    function targetProducts(object) {
        return `
            <div class="col-lg-6 menu-item isotope-item filter-${object.id_categoria}">
                <img src="assets/img/menu/${object.imagen}.jpg" class="menu-img" alt="${object.nombre}">
                <div class="menu-content d-flex justify-content-between align-items-center">
                    <a href="#">${object.nombre}</a><span>$${object.precio}</span>
                </div>
                <div class="menu-ingredients mb-2">
                    ${object.detalles}
                </div>
                <div class="d-flex justify-content-end">
                    <button
                    class="btn btn-book-a-table"
                    data-bs-toggle="modal"
                    data-bs-target="#addToCartModal"
                    data-id="${object.id}"
                    data-name="${object.nombre}"
                    data-price="${object.precio}">
                    Agregar al carrito <i class="uil uil-shopping-cart-alt"></i>
                    </button>
                </div>
            </div>
                `
    }   return {
        targetProducts,
        targetCategories
    }
}