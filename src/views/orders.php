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
                    <div class="card">
                        <div class="card-body">
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

                            <div class="table-responsive">
                                <table class="table table-striped table-bordered no-wrap">
                                    <thead>
                                        <tr>
                                            <th>Status</th>
                                            <th>Nro Orden</th>
                                            <th>Cliente</th>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Nro Comprobante</th>
                                            <th>Comprobante</th>
                                            <th>Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <span class="badge text-bg-success badge-pill">ENTREGADO</span>

                                            </td>
                                            <td><span class="fs-6">6419619819</span></td>
                                            <td>Jose Escalona</td>
                                            <td>13-3-2025</td>
                                            <td>13:40</td>
                                            <td class="fs-6">2560</td>
                                            <td>ver</td>
                                            <td>
                                                <button data-bs-toggle="modal" data-bs-target="#confirmAction" class="btn bh_1 rounded-circle btn-circle" data-bs-toggle="tooltip" data-bs-title="Verificar pago" data-bs-placement="top">
                                                    <i data-feather="check-circle" class="text-white"></i>
                                                </button>
                                                <button data-bs-toggle="modal" data-bs-target="#confirmAction" class="btn bh_5 rounded-circle btn-circle" data-bs-toggle="tooltip" data-bs-title="Anular" data-bs-placement="top">
                                                    <i data-feather="x-circle" class="text-white"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <ul class="pagination float-end">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
    <?php include_once __DIR__ . '/../Views/Components/modals/Confirm.php' ?>

</div>

<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>


<?php include_once __DIR__ . '/../Views/Components/footer.php' ?>