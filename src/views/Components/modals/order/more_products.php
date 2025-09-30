<div class="modal fade" id="more_products" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="d-flex justify-content-end p-2">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pt-0 overflow-x-hidden">
                <div id="stepper-3" class="bs-stepper">
                    <div class="bs-stepper-header" role="tablist">
                        <!-- Paso 1 -->
                        <div class="step" data-target="#step-1">
                            <button type="button" class="step-trigger" role="tab" id="steppertrigger1" aria-controls="step-1">
                                <span class="bs-stepper-circle">1</span>
                                <span class="bs-stepper-label d-none">Productos</span>
                            </button>
                        </div>
                        <div class="line"></div>
                        <!-- Paso 2 -->
                        <div class="step" data-target="#step-2">
                            <button type="button" class="step-trigger" role="tab" id="steppertrigger2" aria-controls="step-2">
                                <span class="bs-stepper-circle">2</span>
                                <span class="bs-stepper-label d-none">Dirección</span>
                            </button>
                        </div>
                        <div class="line"></div>
                        <!-- Paso 3 -->
                        <div class="step" data-target="#step-5">
                            <button type="button" class="step-trigger" role="tab" id="steppertrigger3" aria-controls="step-3">
                                <span class="bs-stepper-circle">3</span>
                                <span class="bs-stepper-label d-none">Detalles de Pago</span>
                            </button>
                        </div>
                    </div>
                    <div class="bs-stepper-content">
                        <div id="step-1" class="content" role="tabpanel" aria-labelledby="steppertrigger1">
                            <h5 class="text-center fs-3 mt-2 mb-4">SELECCIONAR PRODUCTOS</h5>
                            <div class="row">
                                <div class="row mb-5">
                                    <div class="d-flex gap-2 justify-content-start flex-wrap ps-0 cont_category_product_orders_local_more">
                                        <div>
                                            <input type="radio" class="btn-check btn-filter-product" data-filter="all" name="options-outlined" id="success-outlined" autocomplete="off" checked>
                                            <label class="btn bh_1CHECKBOX rounded-pill" for="success-outlined">Todos</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row cont-select-product-order_local_more">
                                    <!-- Productos -->
                                </div>
                            </div>
                            <div class="d-flex justify-content-end position-sticky start-100 bottom-0">
                                <button class="btn bh_1 mt-3 text-white select_product_btn_next_local_more">Siguiente</button>
                            </div>
                        </div>
                        <div id="step-2" class="content" role="tabpanel" aria-labelledby="steppertrigger2">
                            <h5 class="text-center fs-3 mt-2 mb-4">DETALLES DE LA ORDEN</h5>
                            <h4>COMIDA</h4>
                            <hr>
                            <div class="row cont-details-product-order-food_local_more">

                            </div>
                            <h4>OTROS</h4>
                            <hr>
                            <div class="row cont-details-product-order-other_local_more">
                                <!-- Otros -->
                            </div>
                            <hr>
                            <div class="row">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="subtotal_local_more">SUBTOTAL: 10 $</h4>
                                        <h4 class="iva_local_more">IVA: 025 $</h4>
                                        <hr>
                                        <h4 class="total-amount_local_more">TOTAL BS: 10 -- USD: 10</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end position-sticky start-100 bottom-0">
                                <button class="btn bh_5 text-white mt-3 me-2" onclick="stepper3.previous()">Anterior</button>
                                <button class="btn bh_1 text-white mt-3 btn-next_details_local_more">Siguiente</button>
                            </div>
                        </div>
                        <div id="step-5" class="content" role="tabpanel" aria-labelledby="steppertrigger5">
                            <h5 class="text-center fs-3 mt-2 mb-4">CONFIRMACION</h5>
                            <div class="row mb-4">
                                <div class="d-flex justify-content-start gap-3">
                                    <div class="d-flex align-items-center gap-3">
                                        <h4 class="m-0">MESA/PAQUETE</h4>
                                        <p class="m-0 table_confirm_order_local_more">1</p>
                                    </div>
                                </div>
                            </div>
                            <h4>PRODUCTOS</h4>
                            <hr>
                            <div class="table-responsive mb-5">
                                <table class="table table-dark-mode">
                                    <thead>
                                        <th>PRODUCTO</th>
                                        <th>CANTIDAD</th>
                                        <th>DETALLES</th>
                                        <th>ADICIONALES</th>
                                    </thead>
                                    <tbody class="cont_confirm_product_order_local_more">

                                    </tbody>
                                </table>
                            </div>
                            <div class="d-flex justify-content-end position-sticky start-100 bottom-0">
                                <button class="btn btn-secondary mt-3 me-2" onclick="stepper3.previous()">Anterior</button>
                                <button class="btn btn-success mt-3 confirm_order_local_more">Enviar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>