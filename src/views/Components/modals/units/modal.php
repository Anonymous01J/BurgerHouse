<!-- modal para agg unidades -->
<div class="modal fade p-0" id="register-unit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Unidad</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-unit">
                    <div id="units-container">
                        <div class="row g-2 units" id="unit-1">
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-units-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-units-1"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Alias</label>
                                <input type="text" class="form-control" placeholder="Alias" id="input-alias-units-1" name="alias">
                                <div class="text-danger mt-1 fs-6" id="error-input-alias-units-1"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-units">
                    <button type="button" id="add-unit-btn" class="btn btn-secondary mt-3">Agregar unidad</button>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-units" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>

<!-- modal para editar unidad -->
<div class="modal fade p-0" id="edit-unit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Unidad</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-unit">
                    <div id="units-container">
                        <div class="row g-2 unit" id="unit">
                            <input type="hidden" id="input-id-unit" name="id">
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-unit" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-unit"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Alias</label>
                                <input type="text" class="form-control" placeholder="Alias" id="input-alias-unit" name="alias">
                                <div class="text-danger mt-1 fs-6" id="error-input-alias-unit"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-edit-units">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-edit-units" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>