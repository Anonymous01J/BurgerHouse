<!-- modal para agg usuarios -->
<div class="modal fade" id="register-user" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Usuario</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-users" autocomplete="off">
                    <div id="users-container">
                        <div class="row g-2 users" id="user-1">
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-user-1" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-user-1"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Apellido</label>
                                <input type="text" class="form-control" placeholder="Apellido" id="input-lastname-user-1" name="apellido">
                                <div class="text-danger mt-1 fs-6" id="error-input-lastname-user-1"></div>
                            </div>
                            <div class="col-md-6 ">
                                <label for="inputCity" class="form-label">Tipo de documento</label>
                                <div class="dropdown select_options_td">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-td-user-1" name="tipo_documento">
                                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span> <i data-feather="chevron-down"></i></span>
                                            </button>
                                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                                <div class="options_search">
                                                    <a class="dropdown-item">V</a>
                                                    <a class="dropdown-item">E</a>
                                                    <a class="dropdown-item">J</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-danger mt-1 fs-6" id="error-input-td-user-1"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nro de documento</label>
                                <input type="text" class="form-control" placeholder="Nro de documento" id="input-rif-user-1" name="rif">
                                <div class="text-danger mt-1 fs-6" id="error-input-rif-user-1"></div>
                            </div>
                            <div class="col-md-4">
                                <label for="inputEmail4" class="form-label">Correo Electronico</label>
                                <input type="text" class="form-control" placeholder="Correo Electronico" id="input-email-user-1" name="email" autocomplete="off">
                                <div class="text-danger mt-1 fs-6" id="error-input-email-user-1"></div>
                            </div>
                            <div class="col-md-4">
                                <label for="inputEmail4" class="form-label">Contraseña</label>
                                <input type="password" autocomplete="new-password" class="form-control" placeholder="Contraseña" id="input-password-user-1" name="hash">
                                <div class="text-danger mt-1 fs-6" id="error-input-password-user-1"></div>
                            </div>
                            <div class="col-md-4">
                                <label for="inputCity" class="form-label">Rol</label>
                                <div class="dropdown select_options_rol">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-rol-user-1" name="id_rol" data-id="Seleccione una opcion">
                                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span> <i data-feather="chevron-down"></i></span>
                                            </button>
                                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                                <div>
                                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                                </div>
                                                <div class="options_search">
                                                    <a class="dropdown-item">V</a>
                                                    <a class="dropdown-item">E</a>
                                                    <a class="dropdown-item">J</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-danger mt-1 fs-6" id="error-input-rol-user-1"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" id="submit-users" class="d-none">
                    <button type="button" id="add-user-btn" class="btn btn-secondary mt-3">Agregar usuario</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label class="btn bh_1 text-white" for="submit-users">Guardar</label>
            </div>
        </div>
    </div>
</div>

<!-- modal para editar usuarios -->
<div class="modal fade" id="edit-user" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Usuario</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-2" id="form-submit-edit-user" autocomplete="off">
                    <input type="hidden" id="id-user" name="id_user">
                    <div id="users-container">
                        <div class="row g-2 user" id="user">
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="input-name-user" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-user"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Apellido</label>
                                <input type="text" class="form-control" placeholder="Apellido" id="input-lastname-user" name="apellido">
                                <div class="text-danger mt-1 fs-6" id="error-input-lastname-user"></div>
                            </div>
                            <div class="col-md-6 ">
                                <label for="inputCity" class="form-label">Tipo de documento</label>
                                <div class="dropdown select_options_td_edit">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-td-user" name="tipo_documento">
                                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span> <i data-feather="chevron-down"></i></span>
                                            </button>
                                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                                <div class="options_search">
                                                    <a class="dropdown-item">V</a>
                                                    <a class="dropdown-item">E</a>
                                                    <a class="dropdown-item">J</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-danger mt-1 fs-6" id="error-input-td-user"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nro de documento</label>
                                <input type="text" class="form-control" placeholder="Nro de documento" id="input-rif-user" name="rif">
                                <div class="text-danger mt-1 fs-6" id="error-input-rif-user"></div>
                            </div>
                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label">Correo Electronico</label>
                                <input type="text" class="form-control" placeholder="Correo Electronico" id="input-email-user" name="email" autocomplete="off">
                                <div class="text-danger mt-1 fs-6" id="error-input-email-user"></div>
                            </div>
                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label">Contraseña</label>
                                <input type="password" autocomplete="new-password" class="form-control" placeholder="Contraseña" id="input-password-user" name="hash">
                                <div class="text-danger mt-1 fs-6" id="error-input-password-user"></div>
                            </div>
                            <div class="col-md-12">
                                <label for="inputCity" class="form-label">Rol</label>
                                <div class="dropdown select_options_rol_edit">
                                    <div class="dropdown">
                                        <div class="btn-group w-100" bis_skin_checked="1">
                                            <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-rol-user" name="id_rol" data-id="Seleccione una opcion">
                                            <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span> <i data-feather="chevron-down"></i></span>
                                            </button>
                                            <div class="dropdown-menu p-2" bis_skin_checked="1">
                                                <div>
                                                    <input class="form-control search_select" type="search" placeholder="Buscar">
                                                </div>
                                                <div class="options_search">
                                                    <a class="dropdown-item">V</a>
                                                    <a class="dropdown-item">E</a>
                                                    <a class="dropdown-item">J</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-danger mt-1 fs-6" id="error-input-rol-user"></div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" id="submit-edit-users" class="d-none">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn bh_5 text-white" data-bs-dismiss="modal">Cancelar</button>
                <label class="btn bh_1 text-white" for="submit-edit-users">Guardar</label>
            </div>
        </div>
    </div>
</div>