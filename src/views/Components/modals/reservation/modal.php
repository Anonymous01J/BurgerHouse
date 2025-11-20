<!-- modal para agg reservaciones -->
<div class="modal fade" id="add_reservation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="d-flex justify-content-end p-2">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pt-0 overflow-x-hidden">
                <div id="stepper-5" class="bs-stepper">
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
                                <span class="bs-stepper-label d-none">PAGAR</span>
                            </button>
                        </div>
                        <div class="line"></div>
                        <!-- Paso 3 -->
                        <div class="step" data-target="#step-3">
                            <button type="button" class="step-trigger" role="tab" id="steppertrigger3" aria-controls="step-3">
                                <span class="bs-stepper-circle">3</span>
                                <span class="bs-stepper-label d-none">CONFIRMACION</span>
                            </button>
                        </div>
                    </div>
                    <div class="bs-stepper-content">
                        <div id="step-1" class="content" role="tabpanel" aria-labelledby="steppertrigger1">
                            <h5 class="text-center fs-3 mt-2 mb-4">AGENDAR RESERVA</h5>
                            <h4>CLIENTE</h4>
                            <hr class="mb-1">
                            <div class="row">
                                <form class="row g-3" id="form-search-client-reservation">
                                    <div class="col-auto">
                                        <input type="search" class="form-control" placeholder="Documento">
                                    </div>
                                    <div class="col-auto">
                                        <button type="submit" class="btn bh_1 text-white mb-3">Buscar</button>
                                    </div>
                                </form>
                                <div class="row cont_client-reservation">
                                    <div class="col-md-12 d-flex justify-content-center align-items-center my-2 loader_client_reservation">
                                        <h3>No hay clientes seleccionados</h3>
                                        <section class="target_client_reservation w-100 d-none">
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
                            <div class="row mt-3 mb-5">
                                <div class="col-md-6">
                                    <label class="form-label">Fecha de reserva</label>
                                    <input type="datetime-local" class="form-control" id="input-date-reservation" name="fecha">
                                    <div class="text-danger mt-1 fs-6" id="error-input-date-reservation"></div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Numero de telefono</label>
                                    <input type="tel" class="form-control" id="input-tel-client-reservation" name="telefono">
                                    <div class="text-danger mt-1 fs-6" id="error-input-tel-client-reservation"></div>
                                </div>
                            </div>
                            <hr>
                            <h4 class="mt-3">PAQUETES</h4>
                            <div class="row cont_packages_reservation mt-5">
                                <!-- aqui cargan con js -->
                            </div>
                            <div class="d-flex justify-content-end position-sticky start-100 bottom-0">
                                <button class="btn btn-success mt-3 next_reservation_payment">SIGUIENTE</button>
                            </div>
                        </div>
                        <div id="step-2" class="content" role="tabpanel" aria-labelledby="steppertrigger2">
                            <h4>METODOS DE PAGO</h4>
                            <hr>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="d-flex align-items-center gap-1">
                                            <h5 class="m-0">TOTAL USD </h5>
                                            <p class="m-0 amount_payment_usd_reservation">0</p>
                                        </div>
                                        <div class="d-flex align-items-center gap-1">
                                            <h5 class="m-0">TOTAL BS </h5>
                                            <p class="m-0 amount_payment_bs_reservation">0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <form class="row g-2" id="form-submit-payment-reservation">
                                                <div id="payments-container-reservation">
                                                    <div class="row g-2 payments-reservation" id="payments-reservation-1">
                                                        <div class="col-md-6">
                                                            <label for="inputCity" class="form-label">Metodo de pago</label>
                                                            <div class="dropdown select_options_payment_reservation">
                                                                <div class="dropdown">
                                                                    <div class="btn-group w-100" bis_skin_checked="1">
                                                                        <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-payment-reservation-1" name="id_metodo_pago" data-id="Seleccione una opcion">
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
                                                            <div class="text-danger mt-1 fs-6" id="error-input-payment-reservation-1"></div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputEmail4" class="form-label">Cantidad</label>
                                                            <div class="input-group">
                                                                <span class="input-group-text type_payment">N/S</span>
                                                                <input type="text" maxlength="50" class="form-control w-75" placeholder="0.00" input_price id="input-quantity-reservation-1" name="cantidad">
                                                                <div class="text-danger mt-1 fs-6" id="error-input-quantity-reservation-1"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label for="inputEmail4" class="form-label">Referencia</label>
                                                            <input type="text" maxlength="50" class="form-control" placeholder="Referencia" id="input-reference-reservation-1" name="referencia">
                                                            <div class="text-danger mt-1 fs-6" id="error-input-reference-reservation-1"></div>
                                                        </div>
                                                        <div class="col-12">
                                                            <label for="inputZip" class="form-label">Comprobante</label>
                                                            <input class="form-control input-image" type="file" id="input-comprobante-reservation-1" name="imagen">
                                                            <div class="text-danger mt-1 fs-6" id="error-input-comprobante-reservation-1"></div>
                                                        </div>
                                                        <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
                                                    </div>
                                                </div>
                                                <button type="button" id="add-payment-reservation-btn" class="btn btn-secondary mt-3">Agregar Pago</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end position-sticky gap-3 start-100 bottom-0">
                                <button class="btn btn-primary mt-3" onclick="stepperReservation.previous()">Anterior</button>
                                <button class="btn btn-primary mt-3 btn_next_reservation_confirm">Siguiente</button>
                            </div>
                        </div>
                        <div id="step-3" class="content" role="tabpanel" aria-labelledby="steppertrigger3">
                            <h5 class="text-center fs-3 mt-2 mb-4">CONFIRMACION</h5>
                            <div class="row mb-4">
                                <div class="d-flex justify-content-start gap-3">
                                    <div class="d-flex align-items-center gap-3">
                                        <h4 class="m-0">CLIENTE:</h4>
                                        <p class="m-0 name_client_confirm_reservation">JOSE PEREZ</p>
                                    </div>
                                    <div class="d-flex gap-3">
                                        <h4 class="m-0">DOCUMENTO:</h4>
                                        <p class="m-0 document_client_confirm_reservation">1234568</p>
                                    </div>

                                </div>
                            </div>
                            <div class="row mb-4 mt-3">
                                <div class="d-flex gap-3">
                                    <h4 class="m-0">FECHA DE RESERVACION:</h4>
                                    <p class="m-0 date_client_confirm_reservation text-uppercase">0/0/0000</p>
                                </div>
                            </div>
                            <h4>PAQUETE</h4>
                            <hr>
                            <div class="table-responsive mb-5">
                                <table class="table table-dark-mode">
                                    <thead>
                                        <th>PAQUETE</th>
                                        <th>SILLAS</th>
                                        <th>COSTO</th>
                                    </thead>
                                    <tbody class="cont_confirm_package_reservation">

                                    </tbody>
                                </table>
                            </div>
                            <h4>DETALLES DE PAGO</h4>
                            <div class="table-responsive mb-5">
                                <table class="table table-dark-mode">
                                    <thead>
                                        <th>METODO</th>
                                        <th>CANTIDAD</th>
                                        <th>REFERENCIA</th>
                                        <th>COMPROBANTE</th>
                                    </thead>
                                    <tbody class="cont_confirm_payment_reservation">

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="2">TOTAL USD</td>
                                            <td class="total_usd_confirm_payment">0</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">TOTAL BS</td>
                                            <td class="total_bs_confirm_payment">0</td>
                                        </tr>
                                        <hr>
                                        <tr>
                                            <td colspan="2">CAMBIO USD</td>
                                            <td class="propina_usd">0</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">CAMBIO BS</td>
                                            <td class="propina_bs">0</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="d-flex justify-content-end position-sticky start-100 bottom-0">
                                <button class="btn btn-secondary mt-3 me-2" onclick="stepperReservation.previous()">Anterior</button>
                                <button class="btn btn-success mt-3 next_payment_reservation_confirm">Enviar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal de detalles de reservacion -->
<div class="modal fade" id="edit-reservation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">DETALLES DE RESERVACION</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">
                        <h4 class="fw-bold d-flex align-items-center gap-3">
                            CLIENTE
                            <i class="edit_client_edit_reservation" data-feather="edit" style="cursor: pointer;" data-module-edit="reservaciones"></i>
                        </h4>
                        <p class="name_client_edit_reservation fs-6 text-muted"></p>
                        <p class="document_client_edit_reservation fs-6 text-muted"></p>
                        <p class="phone_client_edit_reservation fs-6 text-muted"></p>
                    </div>
                    <div class="col-6">
                        <h4 class="fw-bold d-flex align-items-center gap-3">
                            FECHA DE RESERVACION
                            <i data-feather="edit" class="edit_date_reservationEdit" style="cursor: pointer;" data-module-edit="reservaciones"></i>
                        </h4>
                        <p class="date_edit_reservation fs-6 text-muted"></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <h4 class="fw-bold d-flex align-items-center gap-3">
                            PAQUETE
                            <i data-feather="edit" class="edit_package_reservationEdit" style="cursor: pointer;" data-module-edit="reservaciones"></i>
                        </h4>
                        <div class="cont_edit_package_reservation fs-6 text-muted"></div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12">
                        <h4 class="fw-bold text-center">DETALLES DE PAGO</h4>
                        <div class="cont_edit_payment_reservation row p-2"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white btn-null-reservation" data-module-nullSchedule="reservaciones">Anular</button>
                <button type="button" class="btn bh_1 text-white btn-verify-reservation" data-module-verifySchedule="reservaciones">Verificar</button>
                <button type="button" class="btn text-white btn-block-reservation" style="background-color:  #b41a1a">Bloquear mesas</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal de editar cliente d una reservacion -->
<div class="modal fade" id="edit-client-reservation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">EDITAR CLIENTE PARA RESERVACION</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h4>CLIENTE</h4>
                <hr class="mb-1">
                <div class="row">
                    <form class="row g-3" id="form-search-client-reservation-edit">
                        <div class="col-auto">
                            <input type="search" class="form-control" placeholder="Documento">
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn bh_1 text-white mb-3">Buscar</button>
                        </div>
                    </form>
                    <div class="row cont_client-reservation-edit">
                        <div class="col-md-12 d-flex justify-content-center align-items-center my-2 loader_client_reservation-edit">
                            <h3>No hay clientes seleccionados</h3>
                            <section class="target_client_reservation-edit w-100 d-none">
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
                            <input type="tel" class="form-control" id="input-tel-client-reservationEdit" name="telefono">
                            <div class="text-danger mt-1 fs-6" id="error-input-tel-client-reservationEdit"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary btn_edit_client_reservation">Guardar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal de editar fecha de una reservacion -->
<div class="modal fade" id="edit-date-reservation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">EDITAR FECHA PARA RESERVACION</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-label">Fecha de reserva</label>
                        <input type="datetime-local" class="form-control" id="input-date-reservationEdit" name="fecha">
                        <div class="text-danger mt-1 fs-6" id="error-input-date-reservationEdit"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary btn_edit_date_reservation">Guardar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal de editar paquetes de una reservacion -->
<div class="modal fade" id="edit-packages-reservation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">EDITAR PAQUETES PARA RESERVACION</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="stepper-edit-packages" class="bs-stepper">
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
                                <span class="bs-stepper-label d-none">PAGAR</span>
                            </button>
                        </div>
                        <div class="line"></div>
                        <!-- Paso 3 -->
                        <div class="step" data-target="#step-3">
                            <button type="button" class="step-trigger" role="tab" id="steppertrigger3" aria-controls="step-3">
                                <span class="bs-stepper-circle">3</span>
                                <span class="bs-stepper-label d-none">CONFIRMACION</span>
                            </button>
                        </div>
                    </div>
                    <div class="bs-stepper-content">
                        <div id="step-1" class="content" role="tabpanel" aria-labelledby="steppertrigger1">
                            <h5 class="text-center fs-3 mt-2 mb-4">PAQUETE ACTUAL</h5>
                            <div class="row cont_packages_reservation_edit_select">
                                <!-- aqui cargan con js -->
                            </div>
                            <hr class="mb-1">
                            <h5 class="text-center fs-3 mt-3 mb-4">DATOS DEL PAGO</h5>
                            <div class="row">
                                <div class="d-flex gap-5">
                                    <div class="d-flex justify-content-center gap-3">
                                        <h3>TOTAL BS</h3>
                                        <p class="total_bs_edit_reservation_payment fw-bold">0</p>
                                    </div>
                                    <div class="d-flex justify-content-center gap-3">
                                        <h3>TOTAL USD</h3>
                                        <p class="total_usd_edit_reservation_payment fw-bold">0</p>
                                    </div>
                                </div>
                                <div class="row cont_payment_reservation_edit">
                                    <!-- aqui cargan con js -->
                                </div>
                            </div>
                            <h4 class="mt-3">PAQUETES</h4>
                            <div class="row mt-3">
                                <div class="calendar-events fs-6 text-muted">
                                    <i class="fa fa-info-circle me-2" style="color: #FF4B00;"></i>Si no selecciona ningun paquete, se mantendra el paquete actual, de seleccionar un paquete se reemplazara el actual. Tenga en cuenta, si el precio del nuevo paquete es mayor a lo que pago por el paquete actual, debera pagar la diferencia.
                                </div>
                                <div class="row cont_packages_reservation_edit mt-3">
                                    <!-- aqui cargan con js -->
                                </div>
                            </div>
                            <div class="d-flex justify-content-end position-sticky start-100 bottom-0">
                                <button class="btn btn-success mt-3 next_reservation_payment_edit">SIGUIENTE</button>
                            </div>
                        </div>
                        <div id="step-2" class="content" role="tabpanel" aria-labelledby="steppertrigger2">
                            <h4>METODOS DE PAGO</h4>
                            <hr>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="d-flex align-items-center gap-1">
                                            <h5 class="m-0">TOTAL USD </h5>
                                            <p class="m-0 amount_payment_usd_reservation_edit">0</p>
                                        </div>
                                        <div class="d-flex align-items-center gap-1">
                                            <h5 class="m-0">TOTAL BS </h5>
                                            <p class="m-0 amount_payment_bs_reservation_edit">0</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="d-flex gap-4">
                                        <div class="d-flex gap-3">
                                            <h3>ABONO USD</h3>
                                            <p class="text-muted amount_abono_usd_reservation_edit"></p>
                                        </div>
                                        <div class="d-flex gap-3">
                                            <h3>ABONO BS</h3>
                                            <p class="text-muted amount_abono_bs_reservation_edit"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="d-flex gap-4">
                                        <div class="d-flex gap-3">
                                            <h3>TOTAL A PAGAR</h3>
                                            <p class="text-muted amount_total_payment_usd_reservation_edit"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <form class="row g-2" id="form-submit-payment-reservation_edit">
                                                <div id="payments-container-reservation_edit">
                                                    <div class="row g-2 payments-reservation_edit" id="payments-reservation-edit-1">
                                                        <div class="col-md-6">
                                                            <label for="inputCity" class="form-label">Metodo de pago</label>
                                                            <div class="dropdown select_options_payment_reservation_edit">
                                                                <div class="dropdown">
                                                                    <div class="btn-group w-100" bis_skin_checked="1">
                                                                        <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-payment-reservationEdit-1" name="id_metodo_pago" data-id="Seleccione una opcion">
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
                                                            <div class="text-danger mt-1 fs-6" id="error-input-payment-reservationEdit-1"></div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputEmail4" class="form-label">Cantidad</label>
                                                            <div class="input-group">
                                                                <span class="input-group-text type_payment">N/S</span>
                                                                <input type="text" maxlength="50" class="form-control w-75" placeholder="0.00" input_price id="input-quantity-reservationEdit-1" name="cantidad">
                                                                <div class="text-danger mt-1 fs-6" id="error-input-quantity-reservationEdit-1"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label for="inputEmail4" class="form-label">Referencia</label>
                                                            <input type="text" maxlength="50" class="form-control" placeholder="Referencia" id="input-reference-reservationEdit-1" name="referencia">
                                                            <div class="text-danger mt-1 fs-6" id="error-input-reference-reservationEdit-1"></div>
                                                        </div>
                                                        <div class="col-12">
                                                            <label for="inputZip" class="form-label">Comprobante</label>
                                                            <input class="form-control input-image" type="file" id="input-comprobante-reservationEdit-1" name="imagen">
                                                            <div class="text-danger mt-1 fs-6" id="error-input-comprobante-reservationEdit-1"></div>
                                                        </div>
                                                        <img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
                                                    </div>
                                                </div>
                                                <button type="button" id="add-payment-reservation-btn-edit" class="btn btn-secondary mt-3">Agregar Pago</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end position-sticky gap-3 start-100 bottom-0">
                                <button class="btn btn-primary mt-3" onclick="stepperReservationEdit.previous()">Anterior</button>
                                <button class="btn btn-primary mt-3 btn_next_reservation_confirm_edit">Siguiente</button>
                            </div>
                        </div>
                        <div id="step-3" class="content" role="tabpanel" aria-labelledby="steppertrigger3">
                            <h5 class="text-center fs-3 mt-2 mb-4">CONFIRMACION</h5>
                            <div class="row mb-4">
                                <div class="d-flex justify-content-start gap-3">
                                    <div class="d-flex align-items-center gap-3">
                                        <h4 class="m-0">CLIENTE:</h4>
                                        <p class="m-0 name_client_confirm_reservation_edit"></p>
                                    </div>
                                    <div class="d-flex gap-3">
                                        <h4 class="m-0">DOCUMENTO:</h4>
                                        <p class="m-0 document_client_confirm_reservation_edit"></p>
                                    </div>

                                </div>
                            </div>
                            <div class="row mb-4 mt-3">
                                <div class="d-flex gap-3">
                                    <h4 class="m-0">FECHA DE RESERVACION:</h4>
                                    <p class="m-0 date_client_confirm_reservation_edit text-uppercase">0/0/0000</p>
                                </div>
                            </div>
                            <h4>PAQUETE</h4>
                            <hr>
                            <div class="table-responsive mb-5">
                                <table class="table table-dark-mode">
                                    <thead>
                                        <th>PAQUETE</th>
                                        <th>SILLAS</th>
                                        <th>COSTO</th>
                                    </thead>
                                    <tbody class="cont_confirm_package_reservation_edit">

                                    </tbody>
                                </table>
                            </div>
                            <h4>DETALLES DE PAGO</h4>
                            <div class="table-responsive mb-5">
                                <table class="table table-dark-mode">
                                    <thead>
                                        <th>METODO</th>
                                        <th>CANTIDAD</th>
                                        <th>REFERENCIA</th>
                                        <th>COMPROBANTE</th>
                                    </thead>
                                    <tbody class="cont_confirm_payment_reservation_edit">

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="2">TOTAL USD</td>
                                            <td class="total_usd_confirm_payment_edit">0</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">TOTAL BS</td>
                                            <td class="total_bs_confirm_payment_edit">0</td>
                                        </tr>
                                        <hr>
                                        <tr>
                                            <td colspan="2">PROPINA USD</td>
                                            <td class="propina_usd_edit">0</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">PROPINA BS</td>
                                            <td class="propina_bs_edit">0</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="d-flex justify-content-end position-sticky start-100 bottom-0">
                                <button class="btn btn-secondary mt-3 me-2" onclick="stepperReservationEdit.previous()">Anterior</button>
                                <button class="btn btn-success mt-3 next_payment_reservation_confirm_edit">Enviar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>