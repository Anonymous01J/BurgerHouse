<!-- <div class="modal fade p-0" id="edit-combo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Combo</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-combo">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Nombre</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="input-name-combo" name="nombre">
                        <div class="text-danger mt-1 fs-6" id="error-input-name-combo"></div>
                    </div>
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Precio</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="text" class="form-control w-50" placeholder="Precio" input_price id="input-price-combo" name="precio">
                            <div class="text-danger mt-1 fs-6" id="error-input-price-combo"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="inputCity" class="form-label">Categoria</label>
                        <div class="dropdown">
                            <div class="dropdown">
                                <div class="btn-group w-100" bis_skin_checked="1">
                                    <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-category-combo" name="id_categoria">
                                    <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span> <i data-feather="chevron-down"></i></span>
                                    </button>
                                    <div class="dropdown-menu p-2" bis_skin_checked="1">
                                        <div>
                                            <input class="form-control" type="text" placeholder="Buscar">
                                        </div>
                                        <a class="dropdown-item">1</a>
                                        <a class="dropdown-item">2</a>
                                        <a class="dropdown-item">3</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-danger mt-1 fs-6" id="error-input-category-combo"></div>
                    </div>
                    <div class="col-md-6">
                        <label for="inputCity" class="form-label">Receta</label>
                        <div class="dropdown">
                            <div class="dropdown">
                                <div class="btn-group w-100" bis_skin_checked="1">
                                    <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-recipe-combo" name="id_receta">
                                    <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span> <i data-feather="chevron-down"></i></span>
                                    </button>
                                    <div class="dropdown-menu p-2" bis_skin_checked="1">
                                        <div>
                                            <input class="form-control" type="text" placeholder="Buscar">
                                        </div>
                                        <a class="dropdown-item">1</a>
                                        <a class="dropdown-item">2</a>
                                        <a class="dropdown-item">3</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-danger mt-1 fs-6" id="error-input-recipe-combo"></div>
                    </div>
                    <div class="col-12">
                        <label for="inputAddress2" class="form-label">Detalles</label>
                        <textarea placeholder="Descripcion" class="form-control" id="input-details-combo" rows="5" name="detalles"></textarea>
                        <div class="text-danger mt-1 fs-6" id="error-input-details-combo"></div>
                    </div>
                    <div class="col-12">
                        <label for="inputZip" class="form-label">Imagen</label>
                        <input class="form-control" type="file" id="input-image-combo" name="imagen">
                        <div class="text-danger mt-1 fs-6" id="error-input-image-combo"></div>
                    </div>
                    <input type="submit" class="d-none" id="submit-edit-combo">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-edit-combo" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div> -->


<div class="modal fade p-0" id="register-combo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Combo</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-combo">
                    <div id="products-container">
                        <div class="row g-2 product" id="product-1">
                            <h4>Combo 1</h4>
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-combo-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-combo-1"></div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Precio</label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-combo-1" name="precio">
                                    <div class="text-danger mt-1 fs-6" id="error-input-price-combo-1"></div>
                                </div>
                            </div>
                            <div class="col-md-3 ">
                                <label for="inputCity" class="form-label">Categoria</label>
                                <div class="dropdown">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-category-combo-1" name="id_categoria">
                                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span> <i data-feather="chevron-down"></i></span>
                                            </button>
                                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                                <div>
                                                    <input class="form-control" type="text" placeholder="Buscar">
                                                </div>
                                                <a class="dropdown-item">1</a>
                                                <a class="dropdown-item">2</a>
                                                <a class="dropdown-item">3</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-danger mt-1 fs-6" id="error-input-category-combo-1"></div>
                            </div>
                            <div class="col-md-3 ">
                                <label for="inputCity" class="form-label">Receta</label>
                                <div class="dropdown">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-recipe-combo-1" name="id_receta">
                                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span> <i data-feather="chevron-down"></i></span>
                                            </button>
                                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                                <div>
                                                    <input class="form-control" type="text" placeholder="Buscar">
                                                </div>
                                                <a class="dropdown-item">1</a>
                                                <a class="dropdown-item">2</a>
                                                <a class="dropdown-item">3</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-danger mt-1 fs-6" id="error-input-recipe-combo-1"></div>
                            </div>
                            <div class="col-12">
                                <label for="inputAddress2" class="form-label">Detalles</label>
                                <textarea placeholder="Detalles" class="form-control" id="input-details-combo-1" rows="5" name="detalles"></textarea>
                                <div class="text-danger mt-1 fs-6" id="error-input-details-combo-1"></div>
                            </div>
                            <div class="col-12">
                                <label for="inputZip" class="form-label">Imagen</label>
                                <input class="form-control input-image" type="file" id="input-image-combo-1" name="imagen">
                                <div class="text-danger mt-1 fs-6" id="error-input-image-combo-1"></div>
                                <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
                            </div>
                            <div class="bg-secondary my-5" style="font-size: 1px;"> 2</div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-combo">
                    <button type="button" id="add-product-btn" class="btn btn-secondary mt-3">Agregar Producto</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-combo" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>