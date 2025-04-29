<?php include_once __DIR__ . '/../Views/Components/header.php' ?>
<?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>

<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">


    <?php include_once __DIR__ . '/../Views/Components/topBar.php' ?>

    <?php include_once __DIR__ . '/../Views/Components/aside.php' ?>


    <div class="page-wrapper">

        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-7 align-self-center">
                    <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Roles y permisos</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Autenticación</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Roles y permisos</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>

            </div>
        </div>

        <div class="container-fluid">


            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Roles</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Crear Rol</button>
                </li>

            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">

                    <div class="row g-3 align-items-center mb-5 mt-3">
                        <div class="col-auto">
                            <input type="search" id="inputPassword6" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-4 col-lg-3 ">
                            <div class="position-relative">
                                <span class="badge bh_1 d-flex justify-content-center align-items-center position-absolute rounded-circle" style="z-index: 1; width: 40px; height: 40px; top: -15px; right: -10px;">
                                    <span><i style="font-size: 24px;" data-feather="shield" class="svg-icon"></i></span>
                                </span>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="mb-3 border-bottom">
                                            <div class="d-flex justify-content-between ">
                                                <h5 class="card-title">Administrador</h5>
                                            </div>
                                        </div>

                                        <div class="row gap-3">
                                            <div class="d-flex flex-column gap-4">
                                                <div class="text-start">
                                                    <h4>Descripcion</h4>
                                                    <div class="fs-6">Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, itaque earum nihil neque aliquam odit impedit odio.</div>
                                                </div>
                                                <div class="d-flex justify-content-end gap-3 border-top pt-3">
                                                    <i style="cursor: pointer;" data-feather="edit"></i>
                                                    <i style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#confirmAction" data-feather="trash-2"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
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
                                                                        <input class="form-check-input" data-module="proveedores" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="proveedores" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="proveedores" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="proveedores" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>ORDENES</td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="ordenes" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="ordenes" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="ordenes" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="ordenes" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
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
                                                                        <input class="form-check-input" data-module="cocina" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="cocina" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>ESTADISTICAS</td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="estadisticas" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
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
                                                                        <input class="form-check-input" data-module="calendario" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
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
                                                                        <input class="form-check-input" data-module="bitacora" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
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
                                                                        <input class="form-check-input" data-module="papelera" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="papelera" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>CLIENTES</td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="cliente" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="cliente" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="cliente" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="cliente" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>CAJA</td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="caja" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="caja" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="caja" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>FACTURAS</td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="factura" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
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
                                                                        <input class="form-check-input" data-module="credito" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="credito" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>UNIDADES</td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="unidades" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="unidades" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="unidades" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="unidades" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>CATEGORIAS</td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="categorias" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="categorias" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="categorias" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="categorias" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>METODOS DE PAGO</td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="metodos de pago" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="metodos de pago" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="metodos de pago" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="metodos de pago" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>PERMISOS</td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="permisos" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="permisos" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="permisos" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="permisos" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>USUARIOS</td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="usuarios" data-action="consultar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="usuarios" data-action="agregar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="usuarios" data-action="editar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-check form-switch">
                                                                        <input class="form-check-input" data-module="usuarios" data-action="eliminar" type="checkbox" role="switch" id="flexSwitchCheckDefault">
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
                </div>
            </div>
        </div>
        <?php include_once __DIR__ . '/../Views/Components/footer.php' ?>
    </div>
</div>

<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>
<script type="module" src="./assets/js/pages/permissions/permissions.js"></script>