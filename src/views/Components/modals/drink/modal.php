<!-- modal para agg bebidas -->
<div class="modal fade p-0" id="register-drink" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered  modal-fullscreen">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Bebida</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-drinks">
                    <div id="drinks-container">
                        <div class="row g-2 drinks" id="drinks-1">
                            <div class="col-md-4">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-drink-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-drink-1"></div>
                            </div>
                            <div class="col-md-4">
                                <label for="inputEmail4" class="form-label">Precio</label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-drink-1" name="precio">
                                    <div class="text-danger mt-1 fs-6" id="error-input-price-drink-1"></div>
                                </div>
                            </div>
                            <div class="col-4">
                                <label for="inputZip" class="form-label">Imagen</label>
                                <input class="form-control input-image" type="file" id="input-image-drink-1" name="imagen">
                                <div class="text-danger mt-1 fs-6" id="error-input-image-drink-1"></div>
                            </div>
                            <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
                        </div>
                    </div>
                    <button type="button" id="add-drink-btn" class="btn btn-secondary mt-3">Agregar adicional</button>
                    <input type="submit" class="d-none" id="submit-drink">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-drink" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>


<!-- modal para editar bebidas -->
<div class="modal fade p-0" id="edit-drink" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Bebida</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-drink">
                    <div id="drink-container">
                        <div class="row g-2 drink" id="drink">
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-drink" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-drink"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Precio</label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-drink" name="precio">
                                    <div class="text-danger mt-1 fs-6" id="error-input-price-drink"></div>
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="inputZip" class="form-label">Imagen</label>
                                <input class="form-control input-image" type="file" id="input-image-drink" name="imagen">
                                <div class="text-danger mt-1 fs-6" id="error-input-image-drink"></div>
                            </div>
                            <img class="mt-3" id="img-drink-response" src="" alt="Vista previa" style="max-width: 200px;">
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-edit-drink">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-edit-drink" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>