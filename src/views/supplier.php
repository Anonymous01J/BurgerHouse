<?php include_once __DIR__ . '/../Views/Components/header.php' ?>
<?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>



<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">

    <?php include_once __DIR__ . '/../Views/Components/topBar.php' ?>

    <?php include_once __DIR__ . '/../Views/Components/aside.php' ?>

    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-7 align-self-center">
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Delivery</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="home" class="text-muted">Modulos</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Proveedores</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>

            </div>
        </div>

        <div class="container-fluid">

            <div class="row g-3 align-items-center mb-4">
                <div class="col-auto">
                    <input type="search" id="inputPassword6" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-lg-3 ">
                    <div class="position-relative">
                        <span class="badge bh_1 d-flex justify-content-center align-items-center position-absolute rounded-circle" style="z-index: 1; width: 40px; height: 40px; top: -15px; right: -10px;">
                            <span><i style="font-size: 24px;" data-feather="bookmark" class="svg-icon"></i></span>
                        </span>
                        <div class="card">
                            <div class="card-body">
                                <div class="mb-3 border-bottom">
                                    <div class="d-flex justify-content-between ">
                                        <h5 class="card-title">Montecarmelo</h5>
                                        <div>
                                            <p class="fs-6">J-582679</p>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p class="fw-lighter fs-6">Nombre</p>
                                        <p class="fw-lighter fs-6">Jose Perez</p>
                                    </div>
                                </div>


                                <div class="row gap-3">
                                    <div class="d-flex flex-column gap-4">
                                        <div class="text-start">
                                            <h4>Telefono</h4>
                                            <div class="fs-6">0412568935</div>
                                        </div>
                                        <div class="">
                                            <h4>Direccion</h4>
                                            <div class="fs-6">Una direccion cualquiera detras de algo</div>
                                        </div>
                                        <div class="d-flex justify-content-end gap-3 border-top pt-3">
                                            <i data-feather="edit"></i>
                                            <i data-feather="trash-2"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>

        <?php include_once __DIR__ . '/../Views/Components/modals/Confirm.php' ?>

        <?php include_once __DIR__ . '/../Views/Components/footer.php' ?>

    </div>



    <script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
    <script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/js/app-style-switcher.js"></script>
    <script src="./assets/js/feather.min.js"></script>
    <script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="./assets/js/sidebarmenu.js"></script>
    <script src="./assets/js/custom.min.js"></script>
    <script src="./assets/js/pages/dashboards/dashboard1.min.js"></script>