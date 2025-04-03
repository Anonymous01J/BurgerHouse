<div class="modal fade" id="register-entrys" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Entradas de materia prima</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Codigo</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="inputEmail4">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="inputCity" class="form-label">Materia Prima</label>
                        <div class="dropdown">
                            <div class="dropdown">
                                <div class="btn-group w-100" bis_skin_checked="1">
                                    <button type="button" class="btn btn-light w-75 text-start">Nombre</button>
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
                    <div class="col-md-6 mb-3">
                        <label for="inputCity" class="form-label">Proveedor</label>
                        <div class="dropdown">
                            <div class="dropdown">
                                <div class="btn-group w-100" bis_skin_checked="1">
                                    <button type="button" class="btn btn-light w-75 text-start">Nombre</button>
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
                        <label for="inputEmail4" class="form-label">Precio de compra</label>
                        <div class="input-group mb-3">
                            <span class="input-group-text">$</span>
                            <input type="text" class="form-control" placeholder="Precio" input_price>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <label for="inputEmail4" class="form-label">Cantidad</label>
                        <div class="input-group mb-3">
                            <span class="input-group-text">o</span>
                            <input type="text" class="form-control" placeholder="Cantidad">
                        </div>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label for="inputCity" class="form-label">Unidad</label>
                        <div class="dropdown">
                            <div class="dropdown">
                                <div class="btn-group w-100" bis_skin_checked="1">
                                    <button type="button" class="btn btn-light w-75 text-start">Nombre</button>
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
                    
                    <div class="col-md-4 mb-3">
                        <label for="inputZip" class="form-label">F. Vencimiento</label>
                        <input class="form-control" type="date" id="formFile">
                    </div>

                    <div class="col-12 mb-3">
                        <label for="inputZip" class="form-label">Comprobante</label>
                        <input class="form-control" type="file" id="formFile">
                    </div>
                    
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn bh_1 text-white">Guardar</button>
            </div>
        </div>
    </div>
</div>