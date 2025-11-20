<!-- modal para agg paquetes -->
<div class="modal fade p-0" id="register-package" tabindex="-1">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Paquete</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-package">
                    <div id="package-container">
                        <div class="row g-2 package" id="package-1">
                            <h4>Paquete 1</h4>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" maxlength="50" class="form-control" placeholder="Nombre" id="input-name-package-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-package-1"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Precio</label>
                                <input type="text" maxlength="50" class="form-control" placeholder="0.00" input-price id="input-price-package-1" name="precio">
                                <div class="text-danger mt-1 fs-6" id="error-input-price-package-1"></div>
                            </div>
                            <div class="row mt-3">
                                <div>
                                    <h4 class="text-center">SELECCIONAR MESA/S</h4>
                                </div>
                               <div class="row cont_tables_package">

                               </div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-package">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-package" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>


<!-- modal para editar paquetes -->
<div class="modal fade p-0" id="edit-package" tabindex="-1">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Paquete</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-edit-package">
                    <div id="package-container-edit">
                        <div class="row g-2 package_edit" id="packages-1">
                            <h4>Paquete 1</h4>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" maxlength="50" class="form-control" placeholder="Nombre" id="input-name-package" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-package"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Precio</label>
                                <input type="text" maxlength="50" class="form-control" placeholder="0.00" input-price id="input-price-package" name="precio">
                                <div class="text-danger mt-1 fs-6" id="error-input-price-package"></div>
                            </div>
                            <div class="row mt-3">
                                <div>
                                    <h4 class="text-center">SELECCIONAR MESA/S</h4>
                                </div>
                               <div class="row cont_tables_package_edit">

                               </div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="d-none" id="submit-package-edit">
                    <input type="hidden" name="id" id="id_package">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-package-edit" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>