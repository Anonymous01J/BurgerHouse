<!-- modal para agg metodos de pago -->
<div class="modal fade p-0" id="register-payments" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Metodo de pago</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-payments">
                    <div id="payments-container">
                        <div class="row g-2 payments" id="payments-1">
                            <div class="col-12">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-payments-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-payments-1"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-payments">
                    <button type="button" id="add-payment-btn" class="btn btn-secondary mt-3">Agregar Metodo de pago</button>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-payments" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>

<!-- modal para editar metodo de pago -->
<div class="modal fade p-0" id="edit-payment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Metodo de pago</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-payment">
                    <div id="payment-container">
                        <div class="row g-2 payment" id="payment">
                            <input type="hidden" id="input-id-payment" name="id">
                            <div class="col-12">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-payment" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-payment"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-edit-payment">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-edit-payment" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>