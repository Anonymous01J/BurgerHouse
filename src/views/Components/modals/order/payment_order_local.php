<div class="modal fade" id="payment_order_local" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="d-flex justify-content-end p-2">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pt-0 overflow-x-hidden">
                <div id="stepper-4" class="bs-stepper">
                    <div class="bs-stepper-header" role="tablist">
                        <!-- Paso 1 -->
                        <div class="step" data-target="#step-1">
                            <button type="button" class="step-trigger" role="tab" id="steppertrigger1" aria-controls="step-1">
                                <span class="bs-stepper-circle">1</span>
                                <span class="bs-stepper-label d-none">PAGAR</span>
                            </button>
                        </div>
                        <div class="line"></div>
                        <!-- Paso 2 -->
                        <div class="step" data-target="#step-2">
                            <button type="button" class="step-trigger" role="tab" id="steppertrigger2" aria-controls="step-2">
                                <span class="bs-stepper-circle">2</span>
                                <span class="bs-stepper-label d-none">CONFIRMACION</span>
                            </button>
                        </div>
                    </div>
                    <div class="bs-stepper-content">
                        <div id="step-1" class="content" role="tabpanel" aria-labelledby="steppertrigger1">
                            <h5 class="text-center fs-3 mt-2 mb-4">PAGAR ORDEN</h5>
                            <h4>CLIENTE</h4>
                            <hr class="mb-1">
                            <div class="row">
                                <form class="row g-3" id="form-search-client-order-local">
                                    <div class="col-auto">
                                        <input type="search" class="form-control" placeholder="Documento">
                                    </div>
                                    <div class="col-auto">
                                        <button type="submit" class="btn bh_1 text-white mb-3">Buscar</button>
                                    </div>
                                </form>
                                <div class="row cont_client-order-local">
                                    <div class="col-md-12 d-flex justify-content-center align-items-center my-2 loader_client_order_local">
                                        <h3>No hay clientes seleccionados</h3>
                                        <section class="target_client_order_local w-100 d-none">
                                            <!-- Clientes -->
                                        </section>
                                        <div class="d-flex align-items-center gap-2 d-none loader">
                                            <div class="spinner-grow" style="color: #FF4B00" role="status">
                                                <span class="visually-hidden">Loading...</span>
                                            </div>
                                            <div class="spinner-grow" style="color: #FF4B00" role="status">
                                                <span class="visually-hidden">Loading...</span>
                                            </div>
                                            <div class="spinner-grow" style="color: #FF4B00" role="status">
                                                <span class="visually-hidden">Loading...</span>
                                            </div>
                                            <div class="spinner-grow" style="color: #FF4B00" role="status">
                                                <span class="visually-hidden">Loading...</span>
                                            </div>
                                            <div class="spinner-grow" style="color: #FF4B00" role="status">
                                                <span class="visually-hidden">Loading...</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="mt-3 mb-5">
                                <h4 class="mb-3">NUMERO DE TELEFONO</h4>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="tel" class="form-control" id="input-tel-client-order-local" name="telefono">
                                        <div class="text-danger mt-1 fs-6" id="error-input-tel-client-order-local"></div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <h4>METODOS DE PAGO</h4>
                            <hr>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="d-flex align-items-center gap-1">
                                            <h5 class="m-0">TOTAL USD </h5>
                                            <p class="m-0 amount_payment_usd_local">0</p>
                                        </div>
                                        <div class="d-flex align-items-center gap-1">
                                            <h5 class="m-0">TOTAL BS </h5>
                                            <p class="m-0 amount_payment_bs_local">0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <form class="row g-2" id="form-submit-payment-local">
                                                <div id="payments-container-local">
                                                    <div class="row g-2 payments-local" id="payments-local-1">
                                                        <div class="col-md-6">
                                                            <label for="inputCity" class="form-label">Metodo de pago</label>
                                                            <div class="dropdown select_options_payment_local">
                                                                <div class="dropdown">
                                                                    <div class="btn-group w-100" bis_skin_checked="1">
                                                                        <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-payment-orderLocal-1" name="id_metodo_pago" data-id="Seleccione una opcion">
                                                                        <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            <span> <i data-feather="chevron-down"></i></span>
                                                                        </button>
                                                                        <div class="dropdown-menu p-2" bis_skin_checked="1">
                                                                            <div>
                                                                                <input class="form-control search_select" type="search" placeholder="Buscar">
                                                                            </div>
                                                                            <div class="options_search">

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="text-danger mt-1 fs-6" id="error-input-payment-orderLocal-1"></div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputEmail4" class="form-label">Cantidad</label>
                                                            <div class="input-group">
                                                                <span class="input-group-text type_payment">N/S</span>
                                                                <input type="text" class="form-control w-75" placeholder="0.00" input_price id="input-quantity-orderLocal-1" name="cantidad">
                                                                <div class="text-danger mt-1 fs-6" id="error-input-quantity-orderLocal-1"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label for="inputEmail4" class="form-label">Referencia</label>
                                                            <input type="text" class="form-control" placeholder="Referencia" id="input-reference-orderLocal-1" name="referencia">
                                                            <div class="text-danger mt-1 fs-6" id="error-input-reference-orderLocal-1"></div>
                                                        </div>
                                                        <div class="col-12">
                                                            <label for="inputZip" class="form-label">Comprobante</label>
                                                            <input class="form-control input-image" type="file" id="input-comprobante-orderLocal-1" name="imagen">
                                                            <div class="text-danger mt-1 fs-6" id="error-input-comprobante-orderLocal-1"></div>
                                                        </div>
                                                        <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
                                                    </div>
                                                </div>
                                                <button type="button" id="add-payment-order-local-btn" class="btn btn-secondary mt-3">Agregar Pago</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end position-sticky start-100 bottom-0">
                                <button class="btn btn-primary mt-3 btn_next_payment_local">Siguiente</button>
                            </div>
                        </div>
                        <div id="step-2" class="content" role="tabpanel" aria-labelledby="steppertrigger2">
                            <div>hola</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>