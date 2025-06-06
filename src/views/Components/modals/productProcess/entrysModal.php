<!-- modal para agg entradas -->
<div class="modal fade" id="register-entrys" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-fullscreen">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Entradas de Product. Procesados</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-entrys" class="row g-2">
                    <div id="entrys-container">
                        <div class="row g-2 entrys" id="entrys-1">
                            <div class="col-md-4">
                                <label for="inputEmail4" class="form-label">Codigo</label>
                                <input type="text" class="form-control" placeholder="Codigo" id="input-code-entrys-1" name="codigo">
                                <div class="text-danger mt-1 fs-6" id="error-input-code-entrys-1"></div>
                            </div>
                            <div class="col-md-4">
                                <label for="inputCity" class="form-label">Producto</label>
                                <div class="dropdown select_options_product">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-product-entrys-1" name="id_producto" data-id="Seleccione una opcion">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-product-entrys-1"></div>
                            </div>
                            <div class="col-md-4">
                                <label for="inputCity" class="form-label">Proveedor</label>
                                <div class="dropdown select_options_supplier">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-supplier-entrys-1" name="id_proveedor" data-id="Seleccione una opcion">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-supplier-entrys-1"></div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Precio de compra</label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-entrys-1" name="precio">
                                </div>
                                <div class="text-danger mt-1 fs-6" id="error-input-price-entrys-1"></div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputCity" class="form-label">Unidad</label>
                                <div class="dropdown select_options_unit">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-unit-entrys-1" name="id_unidad" data-id="Seleccione una opcion">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-unit-entrys-1"></div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Cantidad</label>
                                <input type="text" class="form-control" placeholder="Cantidad" input_price id="input-quantity-entrys-1" name="cantidad">
                                <div class="text-danger mt-1 fs-6" id="error-input-quantity-entrys-1"></div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="inputZip" class="form-label">F. Vencimiento</label>
                                <input type="date" class="form-control" id="input-date-entrys-1" name="fecha_vencimiento">
                                <div class="text-danger mt-1 fs-6" id="error-input-date-entrys-1"></div>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label for="inputZip" class="form-label">Referencia</label>
                                <input type="text" class="form-control" placeholder="Referencia" id="input-ref-entrys-1" name="referencia">
                                <div class="text-danger mt-1 fs-6" id="error-input-ref-entrys-1"></div>
                            </div>
                            <div class="col-12">
                                <label for="inputZip" class="form-label">Comprobante</label>
                                <input class="form-control input-image" type="file" id="input-image-entrys-1" name="imagen">
                                <div class="text-danger mt-1 fs-6" id="error-input-image-entrys-1"></div>
                            </div>
                            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-entrys">
                    <button type="button" id="add-entrys-btn" class="btn btn-secondary mt-3">Agregar Entrada</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-entrys" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>

<!-- modal para editar entradas -->
<div class="modal fade" id="edit-entrys" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Entrada</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-edit-entry" class="row g-2">
                    <div id="entrys-edit-container">
                        <div class="row g-2 entry" id="entry">
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Codigo</label>
                                <input type="text" class="form-control" placeholder="Codigo" id="input-code-entry" name="codigo">
                                <div class="text-danger mt-1 fs-6" id="error-input-code-entry"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputCity" class="form-label">Producto</label>
                                <div class="dropdown select_options_product">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-product-entry" name="id_producto" data-id="Seleccione una opcion">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-product-entry"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputCity" class="form-label">Proveedor</label>
                                <div class="dropdown select_options_supplier">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-supplier-entry" name="id_proveedor" data-id="Seleccione una opcion">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-supplier-entry"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Precio de compra</label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-entry" name="precio">
                                </div>
                                <div class="text-danger mt-1 fs-6" id="error-input-price-entry"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputCity" class="form-label">Unidad</label>
                                <div class="dropdown select_options_unit">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-unit-entry" name="id_unidad" data-id="Seleccione una opcion">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-unit-entry"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Cantidad</label>
                                <input type="text" class="form-control" placeholder="Cantidad" input_price id="input-quantity-entry" name="cantidad">
                                <div class="text-danger mt-1 fs-6" id="error-input-quantity-entry"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="inputZip" class="form-label">F. Vencimiento</label>
                                <input type="date" class="form-control" id="input-date-entry" name="fecha_vencimiento">
                                <div class="text-danger mt-1 fs-6" id="error-input-date-entry"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="inputZip" class="form-label">Referencia</label>
                                <input type="text" class="form-control" placeholder="Referencia" id="input-ref-entry" name="referencia">
                                <div class="text-danger mt-1 fs-6" id="error-input-ref-entry"></div>
                            </div>
                            <div class="col-12">
                                <label for="inputZip" class="form-label">Comprobante</label>
                                <input class="form-control input-image" type="file" id="input-image-entry" name="imagen">
                                <div class="text-danger mt-1 fs-6" id="error-input-image-entry"></div>
                            </div>
                            <img class="mt-3" id="img-entry-response" src="" alt="Vista previa" style="max-width: 200px;">
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-entry-edit">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-entry-edit" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>

<!-- modal para ver comprobantes -->
<div class="modal fade" id="comprobante_view" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="d-flex justify-content-end align-items-center p-3">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex justify-content-center">
                    <img class="w-100 object-fit-cover view_comprobante" src="" alt="">
                </div>
            </div>
        </div>
    </div>
</div>