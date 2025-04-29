<div class="modal fade p-0" id="register-cash" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Abrir Caja</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-combo">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Monto</label>
                        <div class="input-group">
                            <span class="input-group-text">Bs</span>
                            <input type="text" class="form-control w-50" placeholder="Precio" input_price id="input-price-combo" name="precio">
                            <div class="text-danger mt-1 fs-6" id="error-input-price-combo"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Monto</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="text" class="form-control w-50" placeholder="Precio" input_price id="input-price-combo" name="precio">
                            <div class="text-danger mt-1 fs-6" id="error-input-price-combo"></div>
                        </div>
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