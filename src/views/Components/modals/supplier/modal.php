

<!-- <div class="modal fade" id="register-supplier" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Proveedor</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Nombre de acreditado</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="inputEmail4">
                    </div>
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Razon Social</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="inputEmail4">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="inputCity" class="form-label">Tipo de documento</label>
                        <div class="dropdown">
                            <div class="dropdown">
                                <div class="btn-group w-100" bis_skin_checked="1">
                                    <button type="button" class="btn btn-light w-75 text-start"></button>
                                    <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span> <i data-feather="chevron-down"></i></span>
                                    </button>
                                    <div class="dropdown-menu p-2" bis_skin_checked="1">
                                        <div>
                                            <input class="form-control" type="text" placeholder="Buscar">
                                        </div>
                                        <a class="dropdown-item">Action</a>
                                        <a class="dropdown-item">Another
                                            action</a>
                                        <a class="dropdown-item">Something else
                                            here</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Nro de documento</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="inputEmail4">
                    </div>
                    <div class="col-12">
                        <label for="inputEmail4" class="form-label">Telefono</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="inputEmail4">
                    </div>
                    <div class="col-12">
                        <label for="inputEmail4" class="form-label">Telefono 2</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="inputEmail4">
                    </div>
                    <div class="col-12">
                        <label for="inputEmail4" class="form-label">Direccion</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn bh_1 text-white">Guardar</button>
            </div>
        </div>
    </div>
</div> -->

<div class="modal fade" id="register-supplier" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Proveedor</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-supplier">
                    <div id="supplier-container">
                        <div class="row g-2 supplier" id="supplier-1">
                            <div class="d-flex align-items-center gap-4 mb-3">
                                <h4 class="m-0">Proveedor 1</h4>
                            </div>
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Nombre de acreditado</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-supplier-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-supplier-1"></div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Razon Social</label>
                                <input type="text" class="form-control" placeholder="Razon Social" id="input-razonSocial-supplier-1" name="razonSocial">
                                <div class="text-danger mt-1 fs-6" id="error-input-razonSocial-supplier-1"></div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="inputCity" class="form-label">Tipo de documento</label>
                                <div class="dropdown">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-td-supplier-1" name="tipo_documento">
                                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span> <i data-feather="chevron-down"></i></span>
                                            </button>
                                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                                <div>
                                                    <input class="form-control" type="text" placeholder="Buscar">
                                                </div>
                                                <a class="dropdown-item">V</a>
                                                <a class="dropdown-item">E</a>
                                                <a class="dropdown-item">J</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-danger mt-1 fs-6" id="error-input-td-supplier-1"></div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputEmail4" class="form-label">Nro de documento</label>
                                <input type="text" class="form-control" placeholder="Numero de documento" id="input-rif-supplier-1" name="rif">
                                <div class="text-danger mt-1 fs-6" id="error-input-rif-supplier-1"></div>
                            </div>
                            <div class="col-6">
                                <label for="inputEmail4" class="form-label">Telefono</label>
                                <input type="tel" class="form-control" placeholder="Telefono 1" id="input-num1-supplier-1" name="n_telefono1">
                                <div class="text-danger mt-1 fs-6" id="error-input-num1-supplier-1"></div>
                            </div>
                            <div class="col-6">
                                <label for="inputEmail4" class="form-label">Telefono 2</label>
                                <input type="tel" class="form-control" placeholder="Telefono 2" id="input-num2-supplier-1" name="n_telefono2">
                                <div class="text-danger mt-1 fs-6" id="error-input-num2-supplier-1"></div>
                            </div>
                            <div class="col-12">
                                <label for="inputEmail4" class="form-label">Direccion</label>
                                <textarea class="form-control" id="input-direction-supplier-1" name="direccion" rows="5"></textarea>
                                <div class="text-danger mt-1 fs-6" id="error-input-direction-supplier-1"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-supplier">
                    <button type="button" id="add-supplier-btn" class="btn btn-secondary mt-3">Agregar proveedor</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-supplier" class="btn bh_1 text-white">Guardar</button>
            </div>
        </div>
    </div>
</div>

<script src="./assets/libs/libs/intl-tel-input/js/intlTelInput.js"></script>