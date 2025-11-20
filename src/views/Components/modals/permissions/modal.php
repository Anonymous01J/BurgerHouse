<!-- modal para crear un rol -->
<div class="modal fade p-0" id="register-rol" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Crear rol</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-rol">
                    <div class="col-md-12">
                        <div class="mb-3">
                            <label class="form-label text-dark" for="uname">Nombre</label>
                            <input type="text" maxlength="50" class="form-control" id="input-name-permission" placeholder="Nombre" name="nombre">
                            <div class="text-danger mt-1 fs-6" id="error-input-name-permission"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-dark" for="uname">Descripcion</label>
                            <textarea maxlength="50" class="form-control" id="input-description-permission" placeholder="Descripcion" rows="4" name="descripcion"></textarea>
                            <div class="text-danger mt-1 fs-6" id="error-input-description-permission"></div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-rol">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-rol" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>

<!-- modal para editar un rol -->
<div class="modal fade p-0" id="edit-rol" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Crear rol</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-rol">
                    <div class="col-md-12">
                        <div class="mb-3">
                            <label class="form-label text-dark" for="uname">Nombre</label>
                            <input type="text" maxlength="50" class="form-control" id="input-name-permission-edit" placeholder="Nombre" name="nombre">
                            <div class="text-danger mt-1 fs-6" id="error-input-name-permission-edit"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-dark" for="uname">Descripcion</label>
                            <textarea maxlength="50" class="form-control" id="input-description-permission-edit" placeholder="Descripcion" rows="4" name="descripcion"></textarea>
                            <div class="text-danger mt-1 fs-6" id="error-input-description-permission-edit"></div>
                        </div>
                        <input type="hidden" id="input-id-permission">
                    </div>
                    <input type="submit" class="d-none" id="submit-edit-rol">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-edit-rol" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>