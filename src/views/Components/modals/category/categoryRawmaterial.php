<!-- modal para agg categorias -->
<div class="modal fade p-0" id="register-categoryRawMaterials" tabindex="-1">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Categoria (Materia Prima)</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-categoryRawMaterials">
                    <div id="categoryRawMaterials-container">
                        <div class="row g-2 categoryRawMaterials" id="categoryRawMaterials-1">
                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-categoryRawMaterials-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-categoryRawMaterials-1"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-categoryRawMaterials">
                    <button type="button" id="add-categoryRawMaterial-btn" class="btn btn-secondary mt-3">Agregar categoria</button>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-categoryRawMaterials" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>

<!-- modal para editar categorias -->
<div class="modal fade p-0" id="edit-categoryRawMaterial" tabindex="-1">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Categoria (Materia Prima)</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-categoryRawMaterial">
                    <div id="categoryRawMaterial-container">
                        <div class="row g-2 categoryRawMaterial" id="categoryRawMaterial">
                            <input type="hidden" id="input-id-categoryRawMaterial">
                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-categoryRawMaterial" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-categoryRawMaterial"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-categoryRawMaterial-edit">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-categoryRawMaterial-edit" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>