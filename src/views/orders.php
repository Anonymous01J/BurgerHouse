<?php include_once __DIR__ . '/../Views/Components/header.php' ?>
<?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>

<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">


    <?php include_once __DIR__ . '/../Views/Components/topBar.php' ?>

    <?php include_once __DIR__ . '/../Views/Components/aside.php' ?>


    <div class="page-wrapper">

        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-7 align-self-center">
                    <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Ordenes</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Aplicaciones</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Pedidos y entregas</li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Ordenes</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>

            </div>
        </div>

        <div class="container-fluid">


            <div class="row">
                <div class="col-12">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <button class="nav-link active" id="nav-domicilio-tab" data-bs-toggle="tab" data-bs-target="#nav-domicilio" type="button" role="tab" aria-controls="nav-home" aria-selected="true">A domicilio</button>
                            <button class="nav-link" id="nav-llevar-tab" data-bs-toggle="tab" data-bs-target="#nav-llevar" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Para llevar</button>
                            <button class="nav-link" id="nav-local-tab" data-bs-toggle="tab" data-bs-target="#nav-local" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">En el local</button>
                        </div>
                    </nav>
                    <div class="card">
                        <div class="card-body">
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-domicilio" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">

                                    <div class="row">
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_5BG text-center">
                                                    <h1 class="font-light text-white">5</h1>
                                                    <h6 class="text-white">Pagos nulos</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_1BG text-center">
                                                    <h1 class="font-light text-white">2,064</h1>
                                                    <h6 class="text-white">Ordenes Totales</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_2 text-center">
                                                    <h1 class="font-light text-white">1,738</h1>
                                                    <h6 class="text-white">Por Verificar</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_4 text-center">
                                                    <h1 class="font-light text-white">1100</h1>
                                                    <h6 class="text-white">Por Despachar</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_5BG text-center">
                                                    <h1 class="font-light text-white">964</h1>
                                                    <h6 class="text-white">Despachadas</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" class="btn bh_1 text-white mb-3" data-bs-toggle="modal" data-bs-target="#domicile">
                                    <button type="button" class="btn bh_1 text-white mb-3">
                                        <i class="fas fa-plus"></i>
                                        Orden
                                    </button>

                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Pendientes</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Procesadas</button>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                                            <div class="row justify-content-between mt-3">
                                                <div class="col-md-6 col-lg-3">
                                                    <input type="text" class="form-control" id="searchBoxDomicilioPending" placeholder="Buscar">
                                                </div>
                                                <div class="col-md-6 col-lg-9">
                                                </div>
                                            </div>
                                            <div class="table-responsive mt-2">
                                                <table class="table no-wrap table-order-domicilio-pendientes table-dark-mode">
                                                    <thead>
                                                        <tr>
                                                            <th>Status</th>
                                                            <th>N° Orden</th>
                                                            <th>Cliente</th>
                                                            <th>Fecha</th>
                                                            <th>Hora</th>
                                                            <th>Detalles</th>
                                                            <th>N° Comp</th>
                                                            <th>Comprobante</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php for ($i = 0; $i < 20; $i++) { ?>
                                                            <tr>
                                                                <td>
                                                                    <span class="badge text-bg-success badge-pill">ENTREGADO</span>

                                                                </td>
                                                                <td><span class="fs-6">6419619819</span></td>
                                                                <td>Jose Escalona</td>
                                                                <td>13-3-2025</td>
                                                                <td>13:40</td>
                                                                <td>detalle</td>
                                                                <td class="fs-6">2560</td>
                                                                <td>ver</td>
                                                                <td>
                                                                    <button class="btn bh_1 rounded-circle btn-circle" data-bs-toggle="tooltip" data-bs-title="Verificar pago" data-bs-placement="top">
                                                                        <i data-feather="check-circle" class="text-white"></i>
                                                                    </button>
                                                                    <button class="btn bh_5 rounded-circle btn-circle" data-bs-toggle="tooltip" data-bs-title="Anular" data-bs-placement="top">
                                                                        <i data-feather="x-circle" class="text-white"></i>
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        <?php } ?>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                                            <div class="row justify-content-between mt-3">
                                                <div class="col-md-6 col-lg-3">
                                                    <input type="text" class="form-control" id="searchBoxDomicilioProcesadas" placeholder="Buscar">
                                                </div>
                                                <div class="col-md-6 col-lg-9">
                                                </div>
                                            </div>
                                            <div class="table-responsive mt-2">
                                                <table class="table no-wrap table-order-domicilio-procesadas table-dark-mode">
                                                    <thead>
                                                        <tr>
                                                            <th>Status</th>
                                                            <th>N° Orden</th>
                                                            <th>Cliente</th>
                                                            <th>Fecha</th>
                                                            <th>Hora</th>
                                                            <th>Detalles</th>
                                                            <th>N° Comp</th>
                                                            <th>Comprobante</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php for ($i = 0; $i < 20; $i++) { ?>
                                                            <tr>
                                                                <td>
                                                                    <span class="badge text-bg-success badge-pill">ENTREGADO</span>

                                                                </td>
                                                                <td><span class="fs-6">6419619819</span></td>
                                                                <td>Jose Escalona</td>
                                                                <td>13-3-2025</td>
                                                                <td>13:40</td>
                                                                <td>detalle</td>
                                                                <td class="fs-6">2560</td>
                                                                <td>ver</td>
                                                            </tr>
                                                        <?php } ?>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                                <div class="tab-pane fade" id="nav-llevar" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">...</div>



                                <div class="tab-pane fade" id="nav-local" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">...</div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


        </div>

        <?php include_once __DIR__ . '/../Views/Components/footer.php' ?>
    </div>

    <?php include_once __DIR__ . '/../Views/Components/modals/Confirm.php' ?>
    <?php include_once __DIR__ . '/../Views/Components/modals/order/domicile.php' ?>

</div>

<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="./assets/libs/extra-libs/datatables.net/js/jquery.dataTables.js"></script>
<script src="./assets/libs/extra-libs/datatables.net-bs4/js/dataTables.responsive.min.js"></script>

<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>
<script src="./assets/js/pages/order/order.js"></script>

