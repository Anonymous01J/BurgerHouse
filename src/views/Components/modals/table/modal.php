<!-- modal para agg tabless -->
<div class="modal fade p-0" id="register-table" tabindex="-1">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Mesas</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-tables">
                    <div id="tables-container">
                        <div class="row g-2 tables" id="tables-1">
                            <h4>Mesa 1</h4>
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-tables-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-tables-1"></div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Nro de sillas</label>
                                <input type="number" class="form-control" placeholder="Nro de sillas" id="input-chair-tables-1" name="sillas">
                                <div class="text-danger mt-1 fs-6" id="error-input-chair-tables-1"></div>
                            </div>
                            <div class="col-md-1">
                                <label for="inputAddress2" class="form-label">VIP</label>
                                <br>
                                <input type="checkbox" class="btn-check" id="input-vip-tables-1" autocomplete="off" name="vip">
                                <label class="btn btn-outline-primary w-100" for="input-vip-tables-1">VIP</label><br>
                                <div class="text-danger mt-1 fs-6" id="error-input-vip-tables-1"></div>
                            </div>
                            <div class="col-md-5">
                                <label for="inputZip" class="form-label">Imagen</label>
                                <input class="form-control input-image" type="file" id="input-image-tables-1" name="imagen">
                                <div class="text-danger mt-1 fs-6" id="error-input-image-tables-1"></div>
                            </div>
                            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-tables">
                    <button type="button" id="add-table-btn" class="btn btn-secondary mt-3">Agregar Mesa</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-tables" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>


<!-- modal para editar tables -->
<div class="modal fade p-0" id="edit-table" tabindex="-1">
    <div class="modal-dialog modal-modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Mesa</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-edit-table">
                    <div id="table-container">
                        <input type="hidden" id="input-id-table">
                        <div class="row g-2 table" id="table">
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-table" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-table"></div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Nro de sillas</label>
                                <input type="number" class="form-control" placeholder="Nro de sillas" id="input-chair-table" name="sillas">
                                <div class="text-danger mt-1 fs-6" id="error-input-chair-table"></div>
                            </div>
                            <div class="col-md-1">
                                <label for="inputAddress2" class="form-label">VIP</label>
                                <br>
                                <input type="checkbox" class="btn-check" id="input-vip-table" autocomplete="off" name="vip">
                                <label class="btn btn-outline-primary w-100" for="input-vip-table">VIP</label><br>
                                <div class="text-danger mt-1 fs-6" id="error-input-vip-table"></div>
                            </div>
                            <div class="col-md-5">
                                <label for="inputZip" class="form-label">Imagen</label>
                                <input class="form-control input-image" type="file" id="input-image-table" name="imagen">
                                <div class="text-danger mt-1 fs-6" id="error-input-image-table"></div>
                            </div>
                            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-edit-table">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-edit-table" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>