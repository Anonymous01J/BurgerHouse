<!-- modal para agg adicionales -->
<div class="modal fade p-0" id="register-additional" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered  modal-fullscreen">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Adicional</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-additionals">
                    <div id="additionals-container">
                        <div class="row g-2 additionals" id="additionals-1">
                            <div class="col-md-4">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-additional-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-additional-1"></div>
                            </div>
                            <div class="col-md-4">
                                <label for="inputEmail4" class="form-label">Precio</label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-additional-1" name="precio">
                                    <div class="text-danger mt-1 fs-6" id="error-input-price-additional-1"></div>
                                </div>
                            </div>
                            <div class="col-4">
                                <label for="inputZip" class="form-label">Imagen</label>
                                <input class="form-control input-image" type="file" id="input-image-additional-1" name="imagen">
                                <div class="text-danger mt-1 fs-6" id="error-input-image-additional-1"></div>
                            </div>
                            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
                        </div>
                    </div>
                    <button type="button" id="add-additional-btn" class="btn btn-secondary mt-3">Agregar adicional</button>
                    <input type="submit" class="d-none" id="submit-additional">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-additional" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>


<!-- modal para editar adicionales -->
<div class="modal fade p-0" id="edit-additional" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Adicional</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-additional">
                    <div id="additional-container">
                        <div class="row g-2 additional" id="additional">
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-additional" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-additional"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Precio</label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-additional" name="precio">
                                    <div class="text-danger mt-1 fs-6" id="error-input-price-additional"></div>
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="inputZip" class="form-label">Imagen</label>
                                <input class="form-control input-image" type="file" id="input-image-additional" name="imagen">
                                <div class="text-danger mt-1 fs-6" id="error-input-image-additional"></div>
                            </div>
                            <img class="mt-3" id="img-additional-response" src="" alt="Vista previa" style="max-width: 200px;">
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-edit-additional">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-edit-additional" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>