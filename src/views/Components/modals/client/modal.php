<!-- <div class="modal fade" id="register-client" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Cliente</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Nombre</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="inputEmail4">
                    </div>
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Apellido</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="inputEmail4">
                    </div>
                    <div class="col-md-6 ">
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


<div class="modal fade" id="register-client" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Cliente</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-client">
                    <div id="client-container">
                        <div class="row g-2 client" id="client-1">
                           
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-client-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-client-1"></div>

                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Apellido</label>
                                <input type="text" class="form-control" placeholder="Apellido" id="input-lastname-client-1" name="apellido">
                                <div class="text-danger mt-1 fs-6" id="error-input-lastname-client-1"></div>

                            </div>
                            <div class="col-md-6 ">
                                <label for="inputCity" class="form-label">Tipo de documento</label>
                                <div class="dropdown">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-td-client-1" name="tipo_documento">
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
                                <div class="text-danger mt-1 fs-6" id="error-input-td-client-1"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nro de documento</label>
                                <input type="text" class="form-control" placeholder="Documento" id="input-doc-client-1" name="documento">
                                <div class="text-danger mt-1 fs-6" id="error-input-doc-client-1"></div>
                            </div>
                            <div class="col-12">
                                <label for="inputEmail4" class="form-label">Telefono</label>
                                <input type="tel" class="form-control" placeholder="Telefono" id="input-tel-client-1" name="telefono">
                                <div class="text-danger mt-1 fs-6" id="error-input-tel-client-1"></div>
                            </div>
                            <div class="col-12">
                                <label for="inputEmail4" class="form-label">Direccion</label>
                                <textarea class="form-control" id="input-direction-client-1" name="direccion" rows="5"></textarea>
                                <div class="text-danger mt-1 fs-6" id="error-input-direction-client-1"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-client">
                    <button type="button" id="add-client-btn" class="btn btn-secondary mt-3">Agregar cliente</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-client" class="btn bh_1 text-white">Guardar</button>
            </div>
        </div>
    </div>
</div>

<script src="./assets/libs/libs/intl-tel-input/js/intlTelInput.js"></script>