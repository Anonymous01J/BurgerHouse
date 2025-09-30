<div class="modal fade" id="modal-details-invoice" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title nro_invoice fs-5" id="exampleModalLabel">Factura</h1>
                <i style="cursor: pointer" class="ms-2 btn-print-invoice" data-feather="printer"></i>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <h3 class="fw-bold">Productos</h3>
                    <table class="table table-dark-mode">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio Unitario</th>
                                <th>Descripción</th>
                                <th>Adicionales</th>
                            </tr>
                        </thead>
                        <tbody class="tbody-detail-invoice">

                        </tbody>
                    </table>
                </div>

                <div>
                    <h3 class="fw-bold">Forma de Pago</h3>
                    <div class="row cont-detail-payment">

                    </div>
                </div>
                <hr>

                <div class="row">
                    <div class="row">
                        <div class="col-6">
                            <h4 class="fw-bold">IVA:</h4>
                        </div>
                        <div class="col-6">
                            <h4 class="fw-bold iva-invoice">659</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <h4 class="fw-bold">SUBTOTAL:</h4>
                        </div>
                        <div class="col-6">
                            <h4 class="fw-bold subtotal-invoice">659</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <h4 class="fw-bold">TOTAL:</h4>
                        </div>
                        <div class="col-6">
                            <h4 class="fw-bold total-invoice">659</h4>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>