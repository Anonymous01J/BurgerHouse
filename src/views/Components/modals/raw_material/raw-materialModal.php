<!-- modal para agg materia prima -->
<div class="modal fade" id="register-rawMaterial" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Materia Prima</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-rawMaterials">
                    <div id="rawmaterials-container">
                        <div class="rawmaterials row" id="rawmaterials-1">
                            <div class="col-md-2">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-rawMaterial-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-rawMaterial-1"></div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputCity" class="form-label">Categoria</label>
                                <div class="dropdown select_options_categorys_rawmaterial">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-category-rawMaterial-1" name="id_categoria" data-id="Seleccione una opcion">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-category-rawMaterial-1"></div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputCity" class="form-label">Unidad</label>
                                <div class="dropdown select_options_units_rawmaterial">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-unit-rawMaterial-1" name="id_unidad" data-id="Seleccione una opcion">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-unit-rawMaterial-1"></div>
                            </div>
                            <div class="col-md-2">
                                <label for="inputEmail4" class="form-label">Stock Min</label>
                                <input type="number" class="form-control" placeholder="Nombre" id="input-min-rawMaterial-1" name="min">
                                <div class="text-danger mt-1 fs-6" id="error-input-min-rawMaterial-1"></div>
                            </div>
                            <div class="col-md-2">
                                <label for="inputEmail4" class="form-label">Stock Max</label>
                                <input type="number" class="form-control" placeholder="Nombre" id="input-max-rawMaterial-1" name="max">
                                <div class="text-danger mt-1 fs-6" id="error-input-max-rawMaterial-1"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-rawMaterial">
                    <button type="button" id="add-rawmaterial-btn" class="btn btn-secondary mt-3">Agregar materia prima</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-rawMaterial" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>

<!-- modal para editar materia prima -->
<div class="modal fade" id="edit-rawMaterial" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Materia Prima</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-edit-rawMaterial">
                    <div id="rawmaterial-container">
                        <div class="rawmaterial row" id="rawmaterial">
                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-rawMaterial" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-rawMaterial"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputCity" class="form-label">Categoria</label>
                                <div class="dropdown select_options_categorys_rawmaterial_edit">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-category-rawMaterial" name="id_categoria" data-id="Seleccione una opcion">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-category-rawMaterial"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputCity" class="form-label">Unidad</label>
                                <div class="dropdown select_options_units_rawmaterial_edit">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-unit-rawMaterial" name="id_unidad" data-id="Seleccione una opcion">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-unit-rawMaterial"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Stock Min</label>
                                <input type="number" class="form-control" placeholder="Nombre" id="input-min-rawMaterial" name="min">
                                <div class="text-danger mt-1 fs-6" id="error-input-min-rawMaterial"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Stock Max</label>
                                <input type="number" class="form-control" placeholder="Nombre" id="input-max-rawMaterial" name="max">
                                <div class="text-danger mt-1 fs-6" id="error-input-max-rawMaterial"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-edit-rawMaterial">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-edit-rawMaterial" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>