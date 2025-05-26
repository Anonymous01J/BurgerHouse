export default function Templates() {
    function targetProductPrepared(objet) {
        return `
        <div class="col">
            <div class="card">
                <img src="${objet.imagen ? "media/productPrepared/" + objet.imagen : "./assets/img/big/banner_login.png"}" class="card-img-top" alt="..." style="object-fit: cover; height: 140px">
                <div class="card-body">
                    <h5 class="card-title">${objet.nombre}</h5>
                    <p class=" fs-6 truncate-3-lines">${objet.detalles}</p>
                </div>
                <div class="card-footer">
                    <small class="text-body-secondary">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <p class="mb-0">Precio: ${objet.precio}$</p>
                            <div class="d-flex gap-3">
                                <a class="link-secondary edit_btn" data-id="${objet.id}" data-module-edit="productPrepared" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#edit-product" data-bs-title="Editar Producto" data-bs-placement="bottom">
                                    <i data-feather="edit"></i>
                                </a>
                                <a class="link-secondary trash_btn" data-id="${objet.id}" data-module-delete="productPrepared" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-title="Eliminar Producto" data-bs-placement="bottom">
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
    function targetProductProcess(objet) {
        return `
        <div class="col">
            <div class="card">
                <img src="${objet.imagen ? "media/productProcess/" + objet.imagen : "./assets/img/big/banner_login.png"}" class="card-img-top" alt="..." style="object-fit: cover; height: 140px">
                <div class="card-body">
                    <h5 class="card-title">${objet.nombre}</h5>
                    <p class=" fs-6 truncate-3-lines">${objet.detalles}</p>
                </div>
                <div class="card-footer">
                    <small class="text-body-secondary">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <p class="mb-0">Precio: ${objet.precio}$</p>
                            <div class="d-flex gap-3">
                                <a class="link-secondary edit_btn" data-id="${objet.id}" data-module-edit="productProcess" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#edit-product" data-bs-title="Editar Producto" data-bs-placement="bottom">
                                    <i data-feather="edit"></i>
                                </a>
                                <a class="link-secondary trash_btn" data-id="${objet.id}" data-module-delete="productProcess" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-title="Eliminar Producto" data-bs-placement="bottom">
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
                        <div class="mb-3 pb-2 border-bottom">
                            <div class="d-flex justify-content-between align-items-center">
                                <h5 class="card-title">${objet.nombre + " " + objet.apellido}</h5>
                                <img src="./assets/img/users/1.jpg" alt="user" class="rounded-circle" style="width: 20%">
                            </div>
                        </div>
                        <div class="row gap-3">
                            <div class="d-flex flex-column gap-4">
                                <div class="text-start">
                                    <h4>Telefono</h4>
                                    <div class="fs-6">${objet.telefono}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <small class="text-body-secondary">
                            <div style="display: flex; justify-content: end; align-items: center;">
                                <div class="d-flex gap-3">
                                    <a class="link-secondary edit_btn" data-id="${objet.id}" data-module-edit="clients" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#edit-client" data-bs-title="Editar Cliente" data-bs-placement="bottom">
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
        let action = `
        <div class="card-footer">
            <small class="text-body-secondary">
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <p class="mb-0">Estado: <span class="badge text-bg-${objet.estado == "LIBRE" ? 'success' : 'secondary'}">${objet.estado}</span></p>
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
        `
        let action2 = `
        <div class="card-footer">
            <small class="text-body-secondary">
                <div style="display: flex; justify-content: center; align-items: center;">
                    <p class="mb-0">Estado: <span class="badge text-bg-${objet.estado == "LIBRE" ? 'success' : 'secondary'}">${objet.estado}</span></p>
                </div>
            </small>
        </div>
        `
        return `
        <div class="col-md-3">
            <div class="card h-100">
                <img src="media/mesas/${objet.imagen}" class="card-img-top" style="object-fit: cover; height: 200px;" alt="...">
                <div class="card-body p-1">
                    <div class="d-flex justify-content-center align-items-center gap-4 h-100">
                        <h5 class="card-title m-0">${objet.nombre}</h5>
                        <h5 class="card-title m-0">Sillas: ${objet.sillas}</h5>
                        <h5 class="card-title m-0">VIP: ${objet.vip == true ? 'Si' : 'No'}</h5>
                    </div>
                </div>
                ${objet.estado == "LIBRE" ? action : action2}
            </div>
        </div>
`
    }
    function targetRecipe(object1, objet2) {
        let template = "";
        objet2.forEach((item) => {
            template += itemIngredientes(item);
        })
        return `
        <div class="col-md-4 col-lg-6 ">
            <div class="position-relative">
                <div class="card">
                    <div class="card-body">
                        <div class="mb-3 border-bottom">
                            <div class="d-flex justify-content-between ">
                                <h5 class="card-title">${object1.nombre_producto}</h5>
                            </div>
                        </div>

                        <div class="row gap-3">
                            <div class="d-flex flex-column gap-4">
                                <div class="row">
                                    <div class="container mb-3">
                                        <ul class=" list-unstyled lista-multi">
                                            ${template}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <small class="text-body-secondary">
                            <div style="display: flex; justify-content: end; align-items: center;">
                                <div class="d-flex gap-3">
                                    <a class="link-secondary edit_btn" data-id="${object1.id}" data-module-edit="Detallerecipe" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#edit-recipe" data-bs-title="Editar Receta" data-bs-placement="bottom">
                                        <i data-feather="edit"></i>
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
    function itemIngredientes(objet) {
        return `
            <li class="fs-5">• ${objet.ingrediente + " " + objet.cantidad + " " + objet.unidad}</li>
        `
    }
    function elemenFormCombo(objet) {
        return `
        <div class="row g-2 product" id="product-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3">
                <h4 class="m-0">Producto ${objet}</h4>
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
    function elemenFormTables(objet) {
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
    function elemenFormAdditional(objet) {
        return `
        <div class="row g-2 additionals" id="additionals-${objet}">
            <div class="d-flex align-items-center gap-4 mb-0 mt-4">
                <h4 class="m-0">${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-additional">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-additional-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-additional-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Precio</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-additional-${objet}" name="precio">
                    <div class="text-danger mt-1 fs-6" id="error-input-price-additional-${objet}"></div>
                </div>
            </div>
            <div class="col-4">
                <label for="inputZip" class="form-label">Imagen</label>
                <input class="form-control input-image" type="file" id="input-image-additional-${objet}" name="imagen">
                <div class="text-danger mt-1 fs-6" id="error-input-image-additional-${objet}"></div>
            </div>
            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
        </div>
        `
    }
    function elemenFormDrink(objet) {
        return `
        <div class="row g-2 drinks" id="drinks-${objet}">
            <div class="d-flex align-items-center gap-4 mb-0 mt-4">
                <h4 class="m-0">${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-drink">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-drink-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-drink-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Precio</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-drink-${objet}" name="precio">
                    <div class="text-danger mt-1 fs-6" id="error-input-price-drink-${objet}"></div>
                </div>
            </div>
            <div class="col-4">
                <label for="inputZip" class="form-label">Imagen</label>
                <input class="form-control input-image" type="file" id="input-image-drink-${objet}" name="imagen">
                <div class="text-danger mt-1 fs-6" id="error-input-image-drink-${objet}"></div>
            </div>
            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
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
    function elemenFormRecipe(objet, objet2 = null) {
        return `
        <div class="row g-2 recipes" id="recipes-${objet}">
            <div class="d-flex align-items-center gap-4 mb-0 mt-4">
                <h4 class="m-0">Item ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-recipe" data-id="${objet2 ? objet2.id : ''}">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-6">
                <label for="inputCity" class="form-label">Materia prima</label>
                <div class="dropdown select_options_rawmaterial">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="${objet2 ? objet2.ingrediente : "Seleccione una opcion"}" id="input-rawmaterial-recipe-${objet}" name="id_rawmaterial" data-id="${objet2 ? objet2.id_materia_prima : "Seleccione una opcion"}">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-rawmaterial-recipe-${objet}"></div>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Cantidad</label>
                <div class="input-group">
                    <span class="input-group-text type_unit">${objet2 ? objet2.unidad : '0'} </span>
                    <input type="text" class="form-control w-75" placeholder="Cantidad" input_price id="input-quantity-recipe-${objet}" name="cantidad" value="${objet2 ? objet2.cantidad : ''}">
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-quantity-recipe-${objet}"></div>
            </div>
        </div>
        `
    }
    function elemenFormRawMaterial(objet) {
        return `
        <div class="rawmaterials row mt-4" id="rawmaterials-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3">
                <h4 class="m-0">Materia Prima ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-rawmaterial">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-2">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-rawMaterial-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-rawMaterial-${objet}"></div>
            </div>
            <div class="col-md-3">
                <label for="inputCity" class="form-label">Categoria</label>
                <div class="dropdown select_options_categorys_rawmaterial">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-category-rawMaterial-${objet}" name="id_categoria" data-id="Seleccione una opcion">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">
                                    <!-- aqui cargan las opciones con ajax -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-category-rawMaterial-${objet}"></div>
            </div>
            <div class="col-md-3">
                <label for="inputCity" class="form-label">Unidad</label>
                <div class="dropdown select_options_units_rawmaterial">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-unit-rawMaterial-${objet}" name="id_unidad" data-id="Seleccione una opcion">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">
                                    <!-- aqui cargan las opciones con ajax -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-unit-rawMaterial-${objet}"></div>
            </div>
            <div class="col-md-2">
                <label for="inputEmail4" class="form-label">Stock Min</label>
                <input type="number" class="form-control" placeholder="Nombre" id="input-min-rawMaterial-${objet}" name="min">
                <div class="text-danger mt-1 fs-6" id="error-input-min-rawMaterial-${objet}"></div>
            </div>
            <div class="col-md-2">
                <label for="inputEmail4" class="form-label">Stock Max</label>
                <input type="number" class="form-control" placeholder="Nombre" id="input-max-rawMaterial-${objet}" name="max">
                <div class="text-danger mt-1 fs-6" id="error-input-max-rawMaterial-${objet}"></div>
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
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Nombre</label>
                <input type="text" class="form-control" placeholder="Nombre" id="input-name-client-${objet}" name="nombre">
                <div class="text-danger mt-1 fs-6" id="error-input-name-client-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Apellido</label>
                <input type="text" class="form-control" placeholder="Apellido" id="input-lastname-client-${objet}" name="apellido">
                <div class="text-danger mt-1 fs-6" id="error-input-lastname-client-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Telefono</label>
                <input type="tel" class="form-control" placeholder="Telefono" id="input-tel-client-${objet}" name="telefono">
                <div class="text-danger mt-1 fs-6" id="error-input-tel-client-${objet}"></div>
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
    function elementFormEntrysRawMaterial(objet) {
        return `
        <div class="row g-2 entrys" id="entrys-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3 mt-5">
                <h4 class="m-0">Cliente ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-entry">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Codigo</label>
                <input type="text" class="form-control" placeholder="Codigo" id="input-code-entrys-${objet}" name="codigo">
                <div class="text-danger mt-1 fs-6" id="error-input-code-entrys-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputCity" class="form-label">Materia Prima</label>
                <div class="dropdown select_options_raw_material">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-rawmaterial-entrys-${objet}" name="id_materia_prima" data-id="Seleccione una opcion">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-rawmaterial-entrys-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputCity" class="form-label">Proveedor</label>
                <div class="dropdown select_options_supplier">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-supplier-entrys-${objet}" name="id_proveedor" data-id="Seleccione una opcion">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-supplier-entrys-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Precio de compra</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-entrys-${objet}" name="precio">
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-price-entrys-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Cantidad</label>
                <div class="input-group">
                    <span class="input-group-text type_unit">0</span>
                    <input type="text" class="form-control w-75" placeholder="Cantidad" input_price id="input-quantity-entrys-${objet}" name="cantidad">
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-quantity-entrys-${objet}"></div>
            </div>
            <div class="col-md-4 mb-3">
                <label for="inputZip" class="form-label">F. Vencimiento</label>
                <input type="date" class="form-control" id="input-date-entrys-${objet}" name="fecha_vencimiento">
                <div class="text-danger mt-1 fs-6" id="error-input-date-entrys-${objet}"></div>
            </div>
            <div class="col-md-12 mb-3">
                <label for="inputZip" class="form-label">Referencia</label>
                <input type="text" class="form-control" id="input-ref-entrys-1" name="referencia">
                <div class="text-danger mt-1 fs-6" id="error-input-ref-entrys-1"></div>
            </div>
            <div class="col-12">
                <label for="inputZip" class="form-label">Imagen</label>
                <input class="form-control input-image" type="file" id="input-image-entrys-${objet}" name="imagen">
                <div class="text-danger mt-1 fs-6" id="error-input-image-entrys-${objet}"></div>
            </div>
            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
        </div>
        `
    }
    function elemenFormEntrysProductProcess(objet) {
        return `
        <div class="row g-2 entrys" id="entrys-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3 mt-5">
                <h4 class="m-0">Cliente ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-entry">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-4">
                <label for="inputEmail4" class="form-label">Codigo</label>
                <input type="text" class="form-control" placeholder="Codigo" id="input-code-entrys-${objet}" name="codigo">
                <div class="text-danger mt-1 fs-6" id="error-input-code-entrys-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputCity" class="form-label">Producto</label>
                <div class="dropdown select_options_product">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-product-entrys-${objet}" name="id_producto" data-id="Seleccione una opcion">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-product-entrys-${objet}"></div>
            </div>
            <div class="col-md-4">
                <label for="inputCity" class="form-label">Proveedor</label>
                <div class="dropdown select_options_supplier">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-supplier-entrys-${objet}" name="id_proveedor" data-id="Seleccione una opcion">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-supplier-entrys-${objet}"></div>
            </div>
            <div class="col-md-3">
                <label for="inputEmail4" class="form-label">Precio de compra</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-entrys-${objet}" name="precio">
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-price-entrys-${objet}"></div>
            </div>
            <div class="col-md-3">
                <label for="inputCity" class="form-label">Unidad</label>
                <div class="dropdown select_options_unit">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-unit-entrys-${objet}" name="id_unidad" data-id="Seleccione una opcion">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-unit-entrys-${objet}"></div>
            </div>
            <div class="col-md-3">
                <label for="inputEmail4" class="form-label">Cantidad</label>
                <input type="text" class="form-control" placeholder="Cantidad" input_price id="input-quantity-entrys-${objet}" name="cantidad">
                <div class="text-danger mt-1 fs-6" id="error-input-quantity-entrys-${objet}"></div>
            </div>
            <div class="col-md-3 mb-3">
                <label for="inputZip" class="form-label">F. Vencimiento</label>
                <input type="date" class="form-control" id="input-date-entrys-${objet}" name="fecha_vencimiento">
                <div class="text-danger mt-1 fs-6" id="error-input-date-entrys-${objet}"></div>
            </div>
            <div class="col-md-12 mb-3">
                <label for="inputZip" class="form-label">Referencia</label>
                <input type="text" class="form-control" placeholder="Referencia" id="input-ref-entrys-${objet}" name="referencia">
                <div class="text-danger mt-1 fs-6" id="error-input-ref-entrys-${objet}"></div>
            </div>
            <div class="col-12">
                <label for="inputZip" class="form-label">Comprobante</label>
                <input class="form-control input-image" type="file" id="input-image-entrys-${objet}" name="imagen">
                <div class="text-danger mt-1 fs-6" id="error-input-image-entrys-${objet}"></div>
            </div>
            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
        </div>
        `
    }
    function optionsRol(object) {
        return `
         <a class="dropdown-item" data-id="${object.id}">${object.nombre}</a>
        `
    }
    function optionsRawMaterial(object) {
        return `
         <a class="dropdown-item" data-id="${object.id}" data-unit="${object.alias_unidad}">${object.nombre}</a>
        `
    }
    function optionsSupplier(object) {
        return `
         <a class="dropdown-item" data-id="${object.id}">${object.razon_social}</a>
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

    //templates de order
    function tagFilterProduct(objet) {
        return `
        <div>
            <input type="radio" class="btn-check" name="options-outlined" data-filter="${objet.nombre}" id="${objet.id + objet.nombre}" autocomplete="off">
            <label class="btn bh_1CHECKBOX rounded-pill" for="${objet.id + objet.nombre}">${objet.nombre}</label>
        </div>
        `
    }
    function tagAdditional(objet) {
        return `
        <div class="form-check" ">
            <input class="form-check-input" type="checkbox" precio="${objet.precio}" value="${objet.nombre}" id="${objet.id}">
            <label class="form-check-label" for="flexCheckDefault">${objet.nombre}</label>
        </div>
        `
    }
    function selectProduct(objet, typeProduct) {
        return `
        <div class="col-md-6 col-lg-3" data-id="${objet.id}" data-filter-id="${objet.nombre_categoria}" tipo="${objet.tipo ? objet.tipo : ""}" nombre="${objet.nombre}" imagen="${objet.imagen}" precio="${objet.precio}">
            <div class="card position-relative">
                <div class="counter-container position-absolute" style="top: -10px; right: -5px;">
                    <button class="trigger-btn p-1 plusTrigger">
                        <i data-feather="plus"></i>
                    </button>
                    <div class="controls" id="controls">
                        <button class="btn-round me-2 p-1 minusBtn">
                            <i data-feather="minus"></i>
                        </button>
                        <input type="text" class="number-input" value="0" readonly>
                        <button class="btn-round ms-2 p-1 plusBtn">
                            <i data-feather="plus"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4 align-items-center d-flex justify-content-center">
                            <img ${objet.imagen ? `src='./media/${typeProduct}/${objet.imagen}'` : `src='./assets/img/big/banner_login.png'`} class="rounded-full" width="100" height="100" alt="">
                        </div>
                        <div class="col-md-8">
                            <h4>${objet.nombre}</h4>
                            <p class="text-muted fs-6">${objet.detalles}</p>
                            <h4 class="border text-center rounded-pill p-1 fs-6 w-75">Precio: ${objet.precio}$</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        `
    }
    function targetDetailProductOrder(objet) {
        let src = ""
        if (objet.type == "" && objet.imagen) src = `src='./media/productProcess/${objet.imagen}'`
        else if (objet.type == "producto" && objet.imagen) src = `src='./media/productPrepared/${objet.imagen}'`
        else if (objet.type == "adicional" && objet.imagen) src = `src='./media/additional/${objet.imagen}'`
        else src = `src='./assets/img/big/banner_login.png'`
        return `
        <div class="col-lg-3 col-md-6">
            <div class="card position-relative">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 col-lg-6 d-flex flex-column align-items-center justify-content-center gap-2">
                            <img ${src} width="100" height="90" style="object-fit: cover;" alt="">
                            <h5 class="text-truncate w-100 text-center" data-id="${objet.id}">${objet.nombre}</h5>
                            <h4 class="border text-center rounded-pill p-1 fs-6 w-100">Precio: ${objet.precio}$</h4>
                            <textarea class="form-control details" placeholder="detalles" rows="3"></textarea>
                            <div class="counter-container mb-2">
                                <button class="trigger-btn p-1 plusTrigger">
                                    <i data-feather="plus"></i>
                                </button>
                                <div class="controls" id="controls">
                                    <button class="btn-round me-2 p-1 minusBtn">
                                        <i data-feather="minus"></i>
                                    </button>
                                    <input type="text" class="number-input" value="1" readonly>
                                    <button class="btn-round ms-2 p-1 plusBtn">
                                        <i data-feather="plus"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 count_additional p-0 border border-2 rounded-3">
                            <textarea rows="6" class="form-control border-0 " style="box-shadow: none;" name="tags" placeholder="Agregar Adicional" /></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        `
    }
    function targetDetailOtherOrder(objet) {
        let src = ""
        if (objet.type == "" && objet.imagen) src = `src='./media/productProcess/${objet.imagen}'`
        else if (objet.type == "adicional" && objet.imagen) src = `src='./media/additional/${objet.imagen}'`
        else src = `src='./assets/img/big/banner_login.png'`
        return `
        <div class="col-lg-2 col-md-3">
            <div class="card position-relative">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 d-flex flex-column align-items-center justify-content-center gap-2">
                            <img ${src} width="100" height="90" style="object-fit: cover;" alt="">
                            <h5 data-id="${objet.id}">${objet.nombre}</h5>
                            <h4 class="border text-center rounded-pill p-1 fs-6 w-100">Precio: ${objet.precio}$</h4>
                            <div class="counter-container mb-2">
                                <button class="trigger-btn p-1 plusTrigger">
                                    <i data-feather="plus"></i>
                                </button>
                                <div class="controls" id="controls">
                                    <button class="btn-round me-2 p-1 minusBtn">
                                        <i data-feather="minus"></i>
                                    </button>
                                    <input type="text" class="number-input" value="1" readonly>
                                    <button class="btn-round ms-2 p-1 plusBtn">
                                        <i data-feather="plus"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        `
    }
    function targetClienteOrder(objet){
        return `
        <div class="col-sm-6 col-md-6 col-lg-3" id="${objet.id}">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <h4>NOMBRE</h4>
                            <p class="text-muted fs-6">${objet.nombre + " " + objet.apellido}</p>
                            <h4>CEDULA</h4>
                            <p class="text-muted fs-6">${objet.documento}</p>
                        </div>
                        <div class="col-lg-6 col-md-6 d-flex justify-content-center align-items-center">
                            <img src="./assets/img/users/1.jpg" class="rounded-circle" width="100" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        `
    }
    function elemenFormPaymentOrder(objet){
        return `
        <div class="row g-2 payments" id="payments-${objet}">
            <div class="d-flex align-items-center gap-4 mb-3 mt-5">
                <h4 class="m-0">Cliente ${objet}</h4>
                <button type="button" class="btn btn-circle btn-secondary remove-payments">
                    <i data-feather="trash"></i>
                </button>
            </div>
            <div class="col-md-6">
                <label for="inputCity" class="form-label">Metodo de pago</label>
                <div class="dropdown select_options_payment">
                    <div class="dropdown">
                        <div class="btn-group w-100" bis_skin_checked="1">
                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-payment-order-${objet}" name="id_metodo_pago" data-id="Seleccione una opcion">
                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span> <i data-feather="chevron-down"></i></span>
                            </button>
                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                <div>
                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                </div>
                                <div class="options_search">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger mt-1 fs-6" id="error-input-payment-order-${objet}"></div>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Cantidad</label>
                <div class="input-group">
                    <span class="input-group-text type_payment">$</span>
                    <input type="text" class="form-control w-75" placeholder="0.00" input_price id="input-quantity-order-${objet}" name="cantidad">
                    <div class="text-danger mt-1 fs-6" id="error-input-quantity-order-${objet}"></div>
                </div>
            </div>
            <div class="col-md-12">
                <label for="inputEmail4" class="form-label">Referencia</label>
                <input type="text" class="form-control" placeholder="Referencia" id="input-reference-order-${objet}" name="referencia">
                <div class="text-danger mt-1 fs-6" id="error-input-reference-order-${objet}"></div>
            </div>
            <div class="col-12">
                <label for="inputZip" class="form-label">Comprobante</label>
                <input class="form-control input-image" type="file" id="input-comprobante-order-${objet}" name="imagen">
                <div class="text-danger mt-1 fs-6" id="error-input-comprobante-order-${objet}"></div>
            </div>
            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
        </div>
        `
    }
    return {
        targetProductPrepared,
        targetProductProcess,
        targetSupplier,
        targetUser,
        targetClient,
        targetRecipe,
        itemIngredientes,
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
        elemenFormAdditional,
        elemenFormDrink,
        elemenFormUser,
        elementFormEntrysRawMaterial,
        elemenFormEntrysProductProcess,
        optionsRol,
        optionsRawMaterial,
        optionsSupplier,
        Watermark,
        tagFilterProduct,
        selectProduct,
        targetDetailProductOrder,
        targetDetailOtherOrder,
        tagAdditional, 
        targetClienteOrder,
        elemenFormPaymentOrder
    }
}