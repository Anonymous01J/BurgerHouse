<div class="modal fade" id="register-recipe" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Receta</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-submit-recipe">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-label">Nombre</label>
                            <input type="text" class="form-control" placeholder="Nombre" id="input-name-recipe" name="nombre">
                            <div class="text-danger mt-1 fs-6" id="error-input-name-recipe"></div>
                        </div>
                    </div>
                    <div id="recipe-container">
                        <div class="row g-2 recipe" id="recipe-1">

                            <div class="col-md-6 ">
                                <label for="inputCity" class="form-label">Materia prima</label>
                                <div class="dropdown">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-recipe-recipe-1" name="receta">
                                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span> <i data-feather="chevron-down"></i></span>
                                            </button>
                                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                                <div>
                                                    <input class="form-control" type="text" placeholder="Buscar">
                                                </div>
                                                <a class="dropdown-item">Action</a>
                                                <a class="dropdown-item">Another action</a>
                                                <a class="dropdown-item">Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-danger mt-1 fs-6" id="error-input-recipe-recipe-1"></div>
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Cantidad</label>
                                <div class="input-group">
                                    <span class="input-group-text">G</span>
                                    <input type="text" class="form-control w-75" placeholder="Cantidad" input_price id="input-quantity-recipe-1" name="cantidad">
                                    <div class="text-danger mt-1 fs-6" id="error-input-quantity-recipe-1"></div>
                                </div>
                            </div>
                            <input type="submit" class="d-none" id="submit-recipe">
                        </div>
                    </div>
                    <button type="button" id="add-recipe-btn" class="btn btn-secondary mt-3">Agregar Producto</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label for="submit-recipe" class="btn bh_1 text-white">Guardar</label>
            </div>
        </div>
    </div>
</div>