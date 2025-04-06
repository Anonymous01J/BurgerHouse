export default function Templates() {

    function targetCombo(objet) {
        return `
        <div class="col">
            <div class="card">
                <img src="${objet.img ? objet.img : "./assets/img/big/banner_login.png"}" class="card-img-top" alt="..." style="object-fit: cover; height: 140px">
                <div class="card-body">
                    <h5 class="card-title">${objet.nombre}</h5>
                    <p class=" fs-6 truncate-3-lines">${objet.detalles}</p>
                </div>
                <div class="card-footer">
                    <small class="text-body-secondary">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <p class="mb-0">Precio: ${objet.precio}$</p>
                            <div class="d-flex gap-3">
                                <a class="link-secondary edit_btn" data-id="${objet.id}" data-module="combo" style="cursor: pointer">
                                    <i data-feather="edit"></i>
                                </a>
                                <a class="link-secondary trash_btn" data-id="${objet.id}" data-module="combo" style="cursor: pointer">
                                    <i data-feather="trash-2"></i>
                                </a>
                            </div>
                        </div>
                    </small>
                </div>
            </div>
        </div>
        `
    }
    // template menu website
    function targetMenu(objet){ 
        return `
        <div class="col-lg-6 menu-item isotope-item filter-${objet.id_categoria}" style="position: absolute; left: 0px; top: 133px;">
            <img src="${objet.img}" class="menu-img" alt="">
            <div class="menu-content">
                <a href="#">${objet.nombre}</a><span>${objet.precio}</span>
            </div>
            <div class="menu-ingredients">
            ${objet.detalles}
            </div>
            </div>
        `
    }
    // template categorias de producto website
    function targetCategoryMenu(objet){ 
        return `
            <ul class="menu-filters isotope-filters">
                <li data-filter=".filter-${objet.nombre}">${objet.nombre}</li>
        `
    }

    function elemenFormCombo(objet) {
        return `
       <div class="row g-2 product" id="product-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3">
                <h2 class="m-0">Combo ${objet}</h2>
                <button type="button" class="btn btn-circle btn-secondary remove-product">
                    <i data-feather="trash"></i>
                </button>
            </div>

            <div class="col-md-3">
                <label for="input-name-combo-${objet}" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-combo-${objet}" name="nombre" />
                <div class="text-danger mt-1 fs-6" id="error-input-name-combo-${objet}"></div>
            </div>
            <div class="col-md-3">
                <label for="input-price-combo-${objet}" class="form-label">Precio</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="text" class="form-control w-75" placeholder="Precio" input_price
                        id="input-price-combo-${objet}" name="precio" />
                    <div class="text-danger mt-1 fs-6" id="error-input-price-combo-${objet}"></div>
                </div>
            </div>
            <div class="col-md-3">
                <label for="input-category-combo-${objet}" class="form-label">Categoria</label>
                <div class="dropdown">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion"
                                id="input-category-combo-${objet}" name="id_categoria" />
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <span><i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control" type="text" placeholder="Buscar" />
                                </div>
                                <a class="dropdown-item">1</a>
                                <a class="dropdown-item">2</a>
                                <a class="dropdown-item">3</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-category-combo-${objet}"></div>
            </div>
            <div class="col-md-3">
                <label for="input-recipe-combo-${objet}" class="form-label">Receta</label>
                <div class="dropdown">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion"
                                id="input-recipe-combo-${objet}" name="id_receta" />
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <span><i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control" type="text" placeholder="Buscar" />
                                </div>
                                <a class="dropdown-item">1</a>
                                <a class="dropdown-item">2</a>
                                <a class="dropdown-item">3</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-recipe-combo-${objet}"></div>
            </div>
            <div class="col-12">
                <label for="input-description-combo-${objet}" class="form-label">Descripcion</label>
                <textarea placeholder="Detalles" class="form-control" id="input-details-combo-${objet}" rows="5"
                    name="detalles"></textarea>
                <div class="text-danger mt-1 fs-6" id="error-input-details-combo-${objet}"></div>
            </div>
            <div class="col-12">
                <label for="input-img-combo-${objet}" class="form-label">Imagen</label>
                <input class="form-control input-image" type="file" id="input-image-combo-${objet}" name="imagen" />
                <div class="text-danger mt-1 fs-6" id="error-input-image-combo-${objet}"></div>
                <img src="" alt="Vista previa" style="max-width: 200px; display: none" />
            </div>
            <div class="bg-secondary my-5" style="font-size: 1px">2</div>
            <input type="submit" class="d-none" id="submit-combo" />
        </div>
    `
    }

    return { targetCombo , elemenFormCombo}
}