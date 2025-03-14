<?php require_once("./Components/header.php") ?>
<?php require_once("./Components/preloader.php") ?>

<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">


    <?php require_once("./Components/topBar.php") ?>

    <?php require_once("./Components/aside.php") ?>

    <div class="page-wrapper">

        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-7 align-self-center">
                    <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Ticket List</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Aplicaciones</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Ticket List</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="col-5 align-self-center">
                    <div class="customize-input float-end">
                        <select class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
                            <option selected>Aug 23</option>
                            <option value="1">July 23</option>
                            <option value="2">Jun 23</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <!-- Column -->
                                <div class="col-md-6 col-lg-3 col-xlg-3">
                                    <div class="card card-hover">
                                        <div class="p-2 bh_1 text-center">
                                            <h1 class="font-light text-white">2,064</h1>
                                            <h6 class="text-white">Ordenes Totales</h6>
                                        </div>
                                    </div>
                                </div>
                                <!-- Column -->
                                <div class="col-md-6 col-lg-3 col-xlg-3">
                                    <div class="card card-hover">
                                        <div class="p-2 bh_2 text-center">
                                            <h1 class="font-light text-white">1,738</h1>
                                            <h6 class="text-white">Por Verificar</h6>
                                        </div>
                                    </div>
                                </div>
                                <!-- Column -->
                                <div class="col-md-6 col-lg-3 col-xlg-3">
                                    <div class="card card-hover">
                                        <div class="p-2 bh_4 text-center">
                                            <h1 class="font-light text-white">1100</h1>
                                            <h6 class="text-white">Por Despachar</h6>
                                        </div>
                                    </div>
                                </div>
                                <!-- Column -->
                                <div class="col-md-6 col-lg-3 col-xlg-3">
                                    <div class="card card-hover">
                                        <div class="p-2 bh_5 text-center">
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
                                            <th>Nro Comprobante</th>
                                            <th>Comprobante</th>
                                            <th>Cancelar</th>
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
                                            <td class="fs-6">2560</td>
                                            <td>ver</td>
                                            <td>
                                                <button class="btn btn-secondary bh_5">Confirmar</button>
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

</div>

<script src="../assets/libs/jquery/dist/jquery.min.js"></script>
<script src="../assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="../dist/js/app-style-switcher.js"></script>
<script src="../dist/js/feather.min.js"></script>
<script src="../assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../dist/js/sidebarmenu.js"></script>
<script src="../dist/js/custom.min.js"></script>


<?php require_once("./Components/footer.php") ?>