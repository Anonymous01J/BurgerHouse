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
                                <a class="link-secondary edit_btn" data-id="${objet.id}" data-module-edit="combo" style="cursor: pointer">
                                    <i data-feather="edit"></i>
                                </a>
                                <a class="link-secondary trash_btn" data-id="${objet.id}" data-module-delete="combo" style="cursor: pointer">
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
    function elemenFormCombo(objet) {
        return `
               <div class="row g-2 product" id="product-${objet}">
                    <div class="d-flex align-items-center gap-4 mb-3">
                        <h4 class="m-0">Combo ${objet}</h4>
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
                </div>
            `
    }
    function elemenFormRecipe(objet) {
        return `
        <div class="row g-2 recipe" id="recipe-${objet}">
            <div class="col-md-5 ">
                <label for="inputCity" class="form-label">Receta</label>
                <div class="dropdown">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-rawmaterial-recipe-${objet}" name="id_rawmaterial">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control" type="text" placeholder="Buscar">
                                </div>
                                <a class="dropdown-item">Action</a>
                                <a class="dropdown-item">Another action</a>
                                <a class="dropdown-item">Something else here</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-rawmaterial-recipe-${objet}"></div>
            </div>

            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Cantidad</label>
                <div class="input-group">
                    <span class="input-group-text">G</span>
                    <input type="text" class="form-control w-75" placeholder="Cantidad" input_price id="input-quantity-recipe-${objet}" name="cantidad">
                    <div class="text-danger mt-1 fs-6" id="error-input-quantity-recipe-${objet}"></div>
                </div>
            </div>
            
            <div class="col-md-1">
                <label for="inputEmail4" class="form-label"></label>

                <div class="input-group">
                    <button type="button" class="btn btn-circle btn-secondary remove-recipe">
                    <i data-feather="trash"></i>
                </button>
                </div>
                
            </div>
        </div>
        `
    }
    function elemenFormRawMaterial(objet) {
        return `
        <div class="rawmaterial row mt-4" id="rawmaterial-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3">
                <h4 class="m-0">Materia Prima ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-rawmaterial">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-rawMaterial-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-rawMaterial-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputCity" class="form-label">Categoria</label>
                <div class="dropdown">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-category-rawMaterial-${objet}" name="id_categoria">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control" type="text" placeholder="Buscar">
                                </div>
                                <a class="dropdown-item">Action</a>
                                <a class="dropdown-item">Another action</a>
                                <a class="dropdown-item">Something else here</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-category-rawMaterial-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputCity" class="form-label">Unidad</label>
                <div class="dropdown">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-unit-rawMaterial-${objet}" name="id_unidad">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control" type="text" placeholder="Buscar">
                                </div>
                                <a class="dropdown-item">Action</a>
                                <a class="dropdown-item">Another action</a>
                                <a class="dropdown-item">Something else here</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-unit-rawMaterial-${objet}"></div>
            </div>
        </div>
        `
    }
    function elemenFormSupplier(objet) {
        return `
        <div class="row g-2 supplier mt-4" id="supplier-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3">
                <h4 class="m-0">Proveedor ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-supplier">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-3">
                <label for="inputEmail4" class="form-label">Nombre de acreditado</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-supplier-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-supplier-${objet}"></div>
            </div>
            <div class="col-md-3">
                <label for="inputEmail4" class="form-label">Razon Social</label>
                <input type="text" class="form-control" placeholder="Razon Social" id="input-razonSocial-supplier-${objet}" name="razonSocial">
                <div class="text-danger mt-1 fs-6" id="error-input-razonSocial-supplier-${objet}"></div>
            </div>
            <div class="col-md-3 mb-3">
                <label for="inputCity" class="form-label">Tipo de documento</label>
                <div class="dropdown">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-td-supplier-${objet}" name="tipo_documento">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control" type="text" placeholder="Buscar">
                                </div>
                                <a class="dropdown-item">V</a>
                                <a class="dropdown-item">E</a>
                                <a class="dropdown-item">J</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-td-supplier-${objet}"></div>
            </div>
            <div class="col-md-3">
                <label for="inputEmail4" class="form-label">Nro de documento</label>
                <input type="text" class="form-control" placeholder="Numero de documento" id="input-rif-supplier-${objet}" name="rif">
                <div class="text-danger mt-1 fs-6" id="error-input-rif-supplier-${objet}"></div>
            </div>
            <div class="col-6">
                <label for="inputEmail4" class="form-label">Telefono</label>
                <input type="tel" class="form-control" placeholder="Telefono 1" id="input-num1-supplier-${objet}" name="n_telefono1">
                <div class="text-danger mt-1 fs-6" id="error-input-num1-supplier-${objet}"></div>
            </div>
            <div class="col-6">
                <label for="inputEmail4" class="form-label">Telefono 2</label>
                <input type="tel" class="form-control" placeholder="Telefono 2" id="input-num2-supplier-${objet}" name="n_telefono2">
                <div class="text-danger mt-1 fs-6" id="error-input-num2-supplier-${objet}"></div>
            </div>
            <div class="col-12">
                <label for="inputEmail4" class="form-label">Direccion</label>
                <textarea class="form-control" id="input-direction-supplier-${objet}" name="direccion" rows="5"></textarea>
                <div class="text-danger mt-1 fs-6" id="error-input-direction-supplier-${objet}"></div>
            </div>
        </div>
        `
    }
    function elemenFormClient(objet) {
        return`
        <div class="row g-2 client mt-4" id="client-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3">
                <h4 class="m-0">Cliente ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-client">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-client-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-client-${objet}"></div>

            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Apellido</label>
                <input type="text" class="form-control" placeholder="Apellido" id="input-lastname-client-${objet}" name="apellido">
                <div class="text-danger mt-1 fs-6" id="error-input-lastname-client-${objet}"></div>

            </div>
            <div class="col-md-6 ">
                <label for="inputCity" class="form-label">Tipo de documento</label>
                <div class="dropdown">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-td-client-${objet}" name="tipo_documento">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control" type="text" placeholder="Buscar">
                                </div>
                                <a class="dropdown-item">V</a>
                                <a class="dropdown-item">E</a>
                                <a class="dropdown-item">J</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-td-client-${objet}"></div>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Nro de documento</label>
                <input type="text" class="form-control" placeholder="Documento" id="input-doc-client-${objet}" name="documento">
                <div class="text-danger mt-1 fs-6" id="error-input-doc-client-${objet}"></div>
            </div>
            <div class="col-12">
                <label for="inputEmail4" class="form-label">Telefono</label>
                <input type="tel" class="form-control" placeholder="Telefono" id="input-tel-client-${objet}" name="telefono">
                <div class="text-danger mt-1 fs-6" id="error-input-tel-client-${objet}"></div>
            </div>
            <div class="col-12">
                <label for="inputEmail4" class="form-label">Direccion</label>
                <textarea class="form-control" id="input-direction-client-${objet}" name="direccion" rows="5"></textarea>
                <div class="text-danger mt-1 fs-6" id="error-input-direction-client-${objet}"></div>
            </div>
        </div>
        `
    }
    function targetCategoryMenu(objet) {
        return `
            <ul class="menu-filters isotope-filters">
                <li data-filter=".filter-${objet.nombre}">${objet.nombre}</li>
        `
    }
    function targetMenu(objet) {
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

    return { targetCombo, elemenFormCombo, elemenFormRawMaterial, elemenFormRecipe, elemenFormSupplier, elemenFormClient, targetCategoryMenu, targetMenu }
}