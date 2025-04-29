<div class="modal fade p-0" id="register-additional" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Adicional</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-combo">
                    <div class="col-md-4">
                        <label for="inputEmail4" class="form-label">Nombre</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="input-name-combo" name="nombre">
                        <div class="text-danger mt-1 fs-6" id="error-input-name-combo"></div>
                    </div>
                    <div class="col-md-4">
                        <label for="inputEmail4" class="form-label">Precio</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="text" class="form-control w-50" placeholder="Precio" input_price id="input-price-combo" name="precio">
                            <div class="text-danger mt-1 fs-6" id="error-input-price-combo"></div>
                        </div>
                    </div>
                    <div class="col-md-4">
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
                    <input type="submit" class="d-none" id="submit-edit-combo">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-edit-combo" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>