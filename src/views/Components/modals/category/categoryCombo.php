<!-- modal para agg categorias -->
<div class="modal fade p-0" id="register-categoryCombo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Categoria (Combo)</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-categoryProduct">
                    <div id="categoryCombos-container">
                        <div class="row g-2 categoryCombos" id="categoryCombos-1">
                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-categoryProduct-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-categoryProduct-1"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-categoryProduct">
                    <button type="button" id="add-categoryProduct-btn" class="btn btn-secondary mt-3">Agregar categoria</button>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-categoryProduct" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>

<!-- modal para agg categorias -->
<div class="modal fade p-0" id="edit-categoryCombo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Categoria (Combo)</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-categoryProduct">
                    <div id="categoryCombo-container">
                        <div class="row g-2 categoryCombo" id="categoryCombo">
                            <input type="hidden" id="input-id-categoryCombo">
                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-categoryProduct" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-categoryProduct"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-categoryProduct-edit">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-categoryProduct-edit" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>