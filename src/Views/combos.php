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
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Combo</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Modulos</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Combos</li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Combo</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>

            </div>
        </div>

        <div class="container-fluid">

            <div class="row g-3 align-items-center mb-5">
                <div class="col-auto">
                    <input type="search" id="searchCombos" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                </div>
                <button type="button" class="btn bh_1 btn-circle text-white btn-add-tooltip" data-module-add="combo" data-bs-toggle="modal" data-bs-target="#register-combo" data-bs-title="Agregar Combo" 
                data-bs-placement="top">
                    <i data-feather="plus" class="svg-icon"></i>
                </button>
            </div>

            <div class="row">

                <?php include_once __DIR__ . '/../Views/Components/modals/combo/modal.php' ?>

                <div class="col-md-12 col-lg-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <h4 class="card-title">Categorias</h4>
                                <div class="d-flex justify-content-center gap-2">
                                    <p>Ver Más</p>
                                    <i data-feather="arrow-right"></i>
                                </div>
                            </div>

                            <div class="row gap-3 p-3">
                                <button class="w-auto btn btn-rounded btn-outline-success">Hamburguesas</button>
                                <button class="w-auto btn btn-rounded btn-outline-success">Perros calientes</button>
                                <button class="w-auto btn btn-rounded btn-outline-success">Bebida</button>
                                <button class="w-auto btn btn-rounded btn-outline-success">Otros</button>
                                <button class="w-auto btn btn-rounded btn-outline-success">Hamburguesas</button>
                            </div>

                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <h4 class="card-title">Top Ordenes</h4>
                            </div>

                            <div class="row ms-auto gap-5">
                                <?php for ($i = 0; $i < 2; $i++) { ?>
                                    <div class="bh_4 w-auto text-white p-2 rounded-4">
                                        <div class="float-start w-auto">
                                            <div class="fs-6 mb-2">
                                                <i data-feather="arrow-up-right"></i>
                                                Mas vendido hoy
                                            </div>
                                            <div>
                                                <p class="fs-6 border-bottom pb-2 mb-1">Nombre</p>
                                            </div>
                                            <div>
                                                <p class="fs-6">4 personas</p>
                                            </div>
                                            <div>
                                                <p class="fs-6 mb-0 ms-2">7.25$</p>
                                            </div>
                                        </div>
                                        <div class="float-end w-25">
                                            <img src="./assets/img/users/profile-pic.jpg" alt="user" class="rounded-circle img-fluid" width="120">
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-9">
                    <!-- <div class="row justify-content-center gap-5 cont-combos">
                        <div class="card shadow rounded-4 mt-5 w-auto h-auto">
                            <div class="d-flex align-items-center" style="transform: translateY(-70px);">
                                <img src="./assets/img/users/profile-pic.jpg" alt="user" class="rounded-circle img-fluid" width="150">
                            </div>
                            <div class="card-body p-0" style="transform: translateY(-50px);">
                                <h5 class="card-title mb-3">Nombre</h5>
                                <div class="mb-4">
                                    <i data-feather="star" class="text-warning"></i>
                                    <i data-feather="star" class="text-warning"></i>
                                    <i data-feather="star" class="text-warning"></i>
                                    <i data-feather="star" class="text-warning"></i>
                                    <i data-feather="star" class="text-secondary"></i>
                                </div>
                                <div style="display: flex; justify-content: space-between; align-items: center;">
                                    <p class="mb-0">precio</p>
                                    <div class="d-flex gap-3">
                                        <i data-feather="edit"></i>
                                        <i data-feather="trash-2"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <div class="row row-cols-1 row-cols-md-3 row-cols-lg-3 g-4 cont-combos">
                        
                    </div>
                </div>
            </div>
        </div>
        <?php include_once __DIR__ . '/../Views/Components/footer.php' ?>
    </div>
</div>


<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>
<script type="module" defer src="./assets/js/pages/combo/combo.js"></script>