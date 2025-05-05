<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <form action="" id="form-submit-permissions">
                    <div class="row">
                        <!-- Column -->
                        <div class="col-md-6 col-lg-3 col-xlg-3">
                            <div class="mb-3">
                                <label class="form-label text-dark" for="uname">Nombre</label>
                                <input type="text" class="form-control" id="input-name-permission" placeholder="Nombre" name="nombre">
                                <div class="text-danger mt-1 fs-6" id="error-input-name-permission"></div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label text-dark" for="uname">Descripcion</label>
                                <textarea class="form-control" id="input-description-permission" placeholder="Descripcion" rows="12" name="descripcion"></textarea>
                                <div class="text-danger mt-1 fs-6" id="error-input-description-permission"></div>
                            </div>
                            <div class="mb-4">
                                <button type="submit" class="btn bh_1 text-white">Guardar</button>
                            </div>
                        </div>
                        <!-- Column -->
                        <div class="col-md-6 col-lg-9 col-xlg-3">
                            <div class="form-check form-check-reverse mb-4">
                                <input class="form-check-input check-all" type="checkbox" value="" id="reverseCheck1">
                                <label class="form-check-label" for="reverseCheck1">Seleccionar Todos</label>
                            </div>

                            <div class="table-responsive table_permissions">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>MODULO</th>
                                            <th>CONSULTAR</th>
                                            <th>AGREGAR</th>
                                            <th>MODIFICAR</th>
                                            <th>ELIMINAR</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>COMBO</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="combo" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="combo" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="combo" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="combo" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>PROVEEDORES</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="supplier" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="supplier" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="supplier" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="supplier" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>ORDENES</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="order" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="order" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="order" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="order" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>DELIVERY</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="delivery" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="delivery" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>COCINA</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="kitchen" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="kitchen" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>ESTADISTICAS</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="statistics" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>CALENDARIO</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="calendar" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>BITACORA</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="binnacle" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>CAPITAL</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="capital" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="capital" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>PAPELERA</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="trash" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="trash" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>CLIENTES</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="clients" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="clients" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="clients" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="clients" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>CAJA</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="cash" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="cash" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="cash" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>FACTURAS</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="invoice" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>CREDITO</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="credit" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="credit" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>UNIDADES</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="units" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="units" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="units" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="units" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>CATEGORIAS</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="category" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="category" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="category" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="category" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>METODOS DE PAGO</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="paymentMethod" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="paymentMethod" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="paymentMethod" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="paymentMethod" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>PERMISOS</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="permissionsRol" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="permissionsRol" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="permissionsRol" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="permissionsRol" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>USUARIOS</td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="users" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="users" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="users" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" data-module="users" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                </div>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>