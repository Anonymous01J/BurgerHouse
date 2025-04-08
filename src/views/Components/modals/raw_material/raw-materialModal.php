<div class="modal fade" id="register-rawMaterial" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Materia Prima</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-rawMaterial">
                    <div id="rawmaterial-container">
                        <div class="rawmaterial row" id="rawmaterial-1">
                            <div class="d-flex align-items-center gap-4 mb-3">
                                <h4 class="m-0">Materia Prima 1</h4>
                            </div>
                            <div class="col-md-4">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-rawMaterial-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-rawMaterial-1"></div>
                            </div>
                            <div class="col-md-4">
                                <label for="inputCity" class="form-label">Categoria</label>
                                <div class="dropdown">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-category-rawMaterial-1" name="id_categoria">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-category-rawMaterial-1"></div>
                            </div>
                            <div class="col-md-4">
                                <label for="inputCity" class="form-label">Unidad</label>
                                <div class="dropdown">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-unit-rawMaterial-1" name="id_unidad">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-unit-rawMaterial-1"></div>
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