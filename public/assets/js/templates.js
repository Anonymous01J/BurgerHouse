export default function Templates() {
    function targetCombo(objet) {
        return `
        <div class="col">
            <div class="card">
                <img src="${objet.imagen ? "media/combos/" + objet.imagen : "./assets/img/big/banner_login.png"}" class="card-img-top" alt="..." style="object-fit: cover; height: 140px">
                <div class="card-body">
                    <h5 class="card-title">${objet.nombre}</h5>
                    <p class=" fs-6 truncate-3-lines">${objet.detalles}</p>
                </div>
                <div class="card-footer">
                    <small class="text-body-secondary">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <p class="mb-0">Precio: ${objet.precio}$</p>
                            <div class="d-flex gap-3">
                                <a class="link-secondary edit_btn" data-id="${objet.id}" data-module-edit="combo" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#edit-combo" data-bs-title="Editar Combo" data-bs-placement="bottom">
                                    <i data-feather="edit"></i>
                                </a>
                                <a class="link-secondary trash_btn" data-id="${objet.id}" data-module-delete="combo" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-title="Eliminar Combo" data-bs-placement="bottom">
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
    function targetSupplier(objet) {
        return `
        <div class="col-md-4 col-lg-3 ">
            <div class="position-relative">
                <div class="card">
                    <div class="card-body">
                        <div class="mb-3 border-bottom">
                            <div class="d-flex justify-content-between ">
                                <h5 class="card-title">${objet.razon_social}</h5>
                                <div>
                                    <p class="fs-6">${objet.documento}</p>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p class="fw-lighter fs-6">Nombre</p>
                                <p class="fw-lighter fs-6">${objet.nombre}</p>
                            </div>
                        </div>


                        <div class="row gap-3">
                            <div class="d-flex flex-column gap-4">
                                <div class="text-start">
                                    <h4>Telefono</h4>
                                    <div class="fs-6">${objet.n_telefono1 + (objet.n_telefono2 ? " / " + objet.n_telefono2 : "")}</div>
                                </div>
                                <div class="">
                                    <h4>Direccion</h4>
                                    <div class="fs-6">${objet.direccion}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <small class="text-body-secondary">
                            <div style="display: flex; justify-content: end; align-items: center;">
                                <div class="d-flex gap-3">
                                    <a class="link-secondary edit_btn" data-id="${objet.id}" data-module-edit="supplier" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#edit-supplier" data-bs-title="Editar Proveedor" data-bs-placement="bottom">
                                        <i data-feather="edit"></i>
                                    </a>
                                    <a class="link-secondary trash_btn" data-id="${objet.id}" data-module-delete="supplier" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-title="Eliminar Proveedor" data-bs-placement="bottom">
                                        <i data-feather="trash-2"></i>
                                    </a>
                                </div>
                            </div>
                        </small>
                    </div>
                </div>
            </div>
        </div>
        `
    }
    function targetUser(objet) {
        return `
        <div class="col-md-4 col-lg-3 ">
            <div class="position-relative">
                <div class="card">
                    <div class="card-body">
                        <div class="mb-3 border-bottom">
                            <div class="d-flex justify-content-between ">
                                <h5 class="card-title">${objet.nombre + " " + objet.apellido}</h5>
                                <div>
                                    <p style="font-size: 12px"">${objet.documento}</p>
                                </div>
                            </div>
                        </div>

                        <div class="row gap-3">
                            <div class="d-flex flex-column gap-4">

                                <div class="text-start">
                                    <h4>Rol</h4>
                                    <div class="fs-6">${objet.rol}</div>
                                </div>
                                <div class="text-start">
                                    <h4>Correo Electronico</h4>
                                    <div class="fs-6">${objet.email}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <small class="text-body-secondary">
                            <div style="display: flex; justify-content: end; align-items: center;">
                                <div class="d-flex gap-3">
                                    <a class="link-secondary edit_btn" data-id="${objet.id}" data-module-edit="users" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#edit-user" data-bs-title="Editar Usuario" data-bs-placement="bottom">
                                        <i data-feather="edit"></i>
                                    </a>
                                    <a class="link-secondary trash_btn" data-id="${objet.id}" data-module-delete="users" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-title="Eliminar Usuario" data-bs-placement="bottom">
                                        <i data-feather="trash-2"></i>
                                    </a>
                                </div>
                            </div>
                        </small>
                    </div>
                </div>
            </div>
        </div>
        `
    }
    function targetClient(objet) {
        return `
        <div class="col-md-4 col-lg-3 ">
            <div class="position-relative">
                <div class="card">
                    <div class="card-body">
                        <div class="mb-3 border-bottom">
                            <div class="d-flex justify-content-between ">
                                <h5 class="card-title">${objet.nombre + " " + objet.apellido}</h5>
                                <div>
                                    <p class="fs-6">${objet.documento}</p>
                                </div>
                            </div>
                        </div>
                        <div class="row gap-3">
                            <div class="d-flex flex-column gap-4">
                                <div class="text-start">
                                    <h4>Telefono</h4>
                                    <div class="fs-6">${objet.telefono}</div>
                                </div>
                                <div class="">
                                    <h4>Direccion</h4>
                                    <div class="fs-6">${objet.direccion}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <small class="text-body-secondary">
                            <div style="display: flex; justify-content: end; align-items: center;">
                                <div class="d-flex gap-3">
                                    <a class="link-secondary edit_btn" data-id="${objet.id}" data-module-edit="clients" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#edit-client"  data-bs-title="Editar Cliente" data-bs-placement="bottom">
                                        <i data-feather="edit"></i>
                                    </a>
                                    <a class="link-secondary trash_btn" data-id="${objet.id}" data-module-delete="clients" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-title="Eliminar Cliente" data-bs-placement="bottom">
                                        <i data-feather="trash-2"></i>
                                    </a>
                                </div>
                            </div>
                        </small>
                    </div>
                </div>
            </div>
        </div>
        `
    }
    function targetPermission(objet) {
        return `
        <div class="col-md-4 col-lg-3 ">
            <div class="position-relative">
                <span class="badge bh_1 d-flex justify-content-center align-items-center position-absolute rounded-circle" style="z-index: 1; width: 40px; height: 40px; top: -15px; right: -10px;">
                    <span><i style="font-size: 24px;" data-feather="shield" class="svg-icon"></i></span>
                </span>
                <div class="card">
                    <div class="card-body">
                        <div class="mb-3 border-bottom">
                            <div class="d-flex justify-content-between ">
                                <h5 class="card-title">${objet.nombre}</h5>
                            </div>
                        </div>

                        <div class="row gap-3">
                            <div class="d-flex flex-column gap-4">
                                <div class="text-start">
                                    <h4>Descripcion</h4>
                                    <div class="fs-6">${objet.descripcion}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <small class="text-body-secondary">
                            <div style="display: flex; justify-content: end; align-items: center;">
                                <div class="d-flex gap-3">
                                    <a class="link-secondary edit_btn" data-id="${objet.id}" data-module-edit="rol" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-title="Editar Permiso" data-bs-placement="bottom">
                                        <i data-feather="edit"></i>
                                    </a>
                                    <a class="link-secondary trash_btn" data-id="${objet.id}" data-module-delete="rol" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-title="Eliminar Permiso" data-bs-placement="bottom">
                                        <i data-feather="trash-2"></i>
                                    </a>
                                </div>
                            </div>
                        </small>
                    </div>
                </div>
            </div>
        </div>
        `
    }
    function targetTable(objet) {
        return `
        <div class="col">
            <div class="card h-100">
                <img src="media/mesas/${objet.imagen}" class="card-img-top" style="object-fit: cover; height: 200px;" alt="...">
                <div class="card-body p-1">
                    <div class="d-flex justify-content-center align-items-center gap-4 h-100">
                        <h5 class="card-title m-0">${objet.nombre}</h5>
                        <h5 class="card-title m-0">Sillas: ${objet.sillas}</h5>
                        <h5 class="card-title m-0">VIP: ${objet.vip == true ? 'Si' : 'No'}</h5>
                    </div>
                </div>
                <div class="card-footer">
                    <small class="text-body-secondary">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <p class="mb-0">Estado: <span class="badge text-bg-success">Libre</span></p>
                            <div class="d-flex gap-3">
                                <a class="link-secondary edit_btn" data-id="${objet.id}" data-module-edit="table" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#edit-table" data-bs-title="Editar Mesa" data-bs-placement="bottom">
                                    <i data-feather="edit"></i>
                                </a>
                                <a class="link-secondary trash_btn" data-id="${objet.id}" data-module-delete="table" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-title="Eliminar Mesa" data-bs-placement="bottom">
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

            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-combo-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-combo-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Precio</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-combo-${objet}" name="precio">
                    <div class="text-danger mt-1 fs-6" id="error-input-price-combo-${objet}"></div>
                </div>
            </div>
            <div class="col-md-4">
                <label for="inputCity" class="form-label">Categoria</label>
                <div class="dropdown select_options_category_combo">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-category-combo-${objet}" name="id_categoria" data-id="Seleccione una opcion">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">
                                    <a class="dropdown-item">1</a>
                                    <a class="dropdown-item">2</a>
                                    <a class="dropdown-item">3</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-category-combo-${objet}"></div>
            </div>

            <div class="col-12">
                <label for="inputAddress2" class="form-label">Detalles</label>
                <textarea placeholder="Detalles" class="form-control" id="input-details-combo-${objet}" rows="5" name="detalles"></textarea>
                <div class="text-danger mt-1 fs-6" id="error-input-details-combo-${objet}"></div>
            </div>
            <div class="col-12">
                <label for="inputZip" class="form-label">Imagen</label>
                <input class="form-control input-image" type="file" id="input-image-combo-${objet}" name="imagen">
                <div class="text-danger mt-1 fs-6" id="error-input-image-combo-${objet}"></div>
                <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
            </div>
            <div class="bg-secondary my-5" style="font-size: 1px;"> 2</div>
        </div>
    `
    }
    function elemenFormTables(objet){
        return `
        <div class="row g-2 tables" id="tables-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3 mt-3">
                <h4 class="m-0">Combo ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-table">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-3">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-tables-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-tables-${objet}"></div>
            </div>
            <div class="col-md-3">
                <label for="inputEmail4" class="form-label">Nro de sillas</label>
                <input type="number" class="form-control" placeholder="Nro de sillas" id="input-chair-tables-${objet}" name="sillas">
                <div class="text-danger mt-1 fs-6" id="error-input-chair-tables-${objet}"></div>
            </div>
            <div class="col-md-1">
                <label for="inputAddress2" class="form-label">VIP</label>
                <br>
                <input type="checkbox" class="btn-check" id="input-vip-tables-${objet}" autocomplete="off" name="vip">
                <label class="btn btn-outline-primary w-100" for="input-vip-tables-${objet}">VIP</label><br>
                <div class="text-danger mt-1 fs-6" id="error-input-vip-tables-${objet}"></div>
            </div>
            <div class="col-md-5">
                <label for="inputZip" class="form-label">Imagen</label>
                <input class="form-control input-image" type="file" id="input-image-tables-${objet}" name="imagen">
                <div class="text-danger mt-1 fs-6" id="error-input-image-tables-${objet}"></div>
            </div>
            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
        </div>
        `
    }
    function elemenFormUnit(objet) {
        return `
        <div class="row g-2 units" id="unit-${objet}">
            <div class="d-flex align-items-center gap-4 mb-0 mt-4">
                <h4 class="m-0">Uad ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-unit">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-units-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-units-${objet}"></div>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Alias</label>
                <input type="text" class="form-control" placeholder="Alias" id="input-alias-units-${objet}" name="alias">
                <div class="text-danger mt-1 fs-6" id="error-input-alias-units-${objet}"></div>
            </div>
        </div>
        `
    }
    function elemenFormPaymentMethod(objet) {
        return `
        <div class="row g-2 payments" id="payments-${objet}">
            <div class="d-flex align-items-center gap-4 mb-0 mt-4">
                <h4 class="m-0">${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-payment">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-12">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-payments-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-payments-${objet}"></div>
            </div>
        </div>
        `
    }
    function elemenFormCategoryProduct(objet) {
        return `
        <div class="row g-2 categoryCombos" id="categoryCombos-${objet}">
            <div class="d-flex align-items-center gap-4 mb-0 mt-4">
                <h4 class="m-0">Uad ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-categoryProducts">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-12">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-categoryProduct-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-categoryProduct-${objet}"></div>
            </div>
        </div>
        `
    }
    function elemenFormCategoryRawmaterial(objet) {
        return `
        <div class="row g-2 categoryRawMaterials" id="categoryRawMaterials-${objet}">
            <div class="d-flex align-items-center gap-4 mb-0 mt-4">
                <h4 class="m-0">Uad ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-categoryRawMaterials">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-12">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-categoryRawMaterials-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-categoryRawMaterials-${objet}"></div>
            </div>
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
        <div class="row g-2 suppliers mt-4" id="suppliers-${objet}">
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
                <div class="dropdown select_options_td">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-td-supplier-${objet}" name="tipo_documento">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div class="options_search">
                                    <a class="dropdown-item">V</a>
                                    <a class="dropdown-item">E</a>
                                    <a class="dropdown-item">J</a>
                                </div>
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
        return `
        <div class="row g-2 clients mt-4" id="clients-${objet}">
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
                <div class="dropdown select_options_td">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-td-client-${objet}" name="tipo_documento">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div class="options_search">
                                    <a class="dropdown-item">V</a>
                                    <a class="dropdown-item">E</a>
                                    <a class="dropdown-item">J</a>
                                </div>

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
    function elemenFormUser(objet) {
        return `
        <div class="row g-2 users" id="user-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3 mt-5">
                <h4 class="m-0">Cliente ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-user">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-user-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-user-${objet}"></div>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Apellido</label>
                <input type="text" class="form-control" placeholder="Apellido" id="input-lastname-user-${objet}" name="apellido">
                <div class="text-danger mt-1 fs-6" id="error-input-lastname-user-${objet}"></div>
            </div>
            <div class="col-md-6 ">
                <label for="inputCity" class="form-label">Tipo de documento</label>
                <div class="dropdown select_options_td">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-td-user-${objet}" name="tipo_documento">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div class="options_search">
                                    <a class="dropdown-item">V</a>
                                    <a class="dropdown-item">E</a>
                                    <a class="dropdown-item">J</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-td-user-${objet}"></div>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Nro de documento</label>
                <input type="text" class="form-control" placeholder="Nro de documento" id="input-rif-user-${objet}" name="rif">
                <div class="text-danger mt-1 fs-6" id="error-input-rif-user-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Correo Electronico</label>
                <input type="text" class="form-control" placeholder="Correo Electronico" id="input-email-user-${objet}" name="email" autocomplete="off">
                <div class="text-danger mt-1 fs-6" id="error-input-email-user-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Contraseña</label>
                <input type="password" autocomplete="new-password" class="form-control" placeholder="Contraseña" id="input-password-user-${objet}" name="hash">
                <div class="text-danger mt-1 fs-6" id="error-input-password-user-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputCity" class="form-label">Rol</label>
                <div class="dropdown select_options_rol">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-rol-user-${objet}" name="id_rol" data-id="Seleccione una opcion">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">
                                    <a class="dropdown-item">V</a>
                                    <a class="dropdown-item">E</a>
                                    <a class="dropdown-item">J</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-rol-user-${objet}"></div>
            </div>
        </div>
        `
    }
    function optionsRol(object) {
        return `
         <a class="dropdown-item" data-id="${object.id}">${object.nombre}</a>
        `
    }
    function Watermark() {
        return `
        <div class="col-12">
            <div class="d-flex justify-content-center align-items-center flex-column mb-4">
                <img src="./assets/img/bh_logo.png" alt="Logo" class="img-fluid opacity-25">
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
    return {
        targetCombo,
        targetSupplier,
        targetUser,
        targetClient,
        targetPermission,
        targetTable,
        elemenFormCombo,
        elemenFormCategoryProduct,
        elemenFormCategoryRawmaterial,
        elemenFormTables,
        elemenFormUnit,
        elemenFormPaymentMethod,
        elemenFormRawMaterial,
        elemenFormRecipe,
        elemenFormSupplier,
        elemenFormClient,
        elemenFormUser,
        optionsRol,
        Watermark,
        targetCategoryMenu,
        targetMenu
    }
}