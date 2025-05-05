export default function Templates() {
    function targetCategories(object) {
        return `
                <li data-filter=".filter-${object.id_categoria}">${object.nombre}</li>
            `
    }
    function targetCombo(object) {
        return `
            <div class="col-lg-6 menu-item isotope-item filter-${object.id_categoria}">
                <img src="assets/img/menu/${object.imagen}.jpg" class="menu-img" alt="${object.nombre}">
                <div class="menu-content">
                    <a href="#">${object.nombre}</a><span>$${object.precio}</span>
                </div>
                <div class="menu-ingredients">
                    ${object.detalles}
                </div>
                <form action="agregar_al_carrito.php" method="post">
                    <input type="hidden" name="id" value="${object.id}">
                    <input type="number" name="cantidad" value="1" min="1">
                    <button type="submit">Agregar al carrito</button>
                </form>
            </div>
                `
    }   return {
        targetCombo,
        targetCategories
    }
}