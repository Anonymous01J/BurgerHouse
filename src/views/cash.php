<?php include_once __DIR__ . '/../Views/Components/header.php' ?>
<?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>



<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">

    <?php include_once __DIR__ . '/../Views/Components/topBar.php' ?>

    <?php include_once __DIR__ . '/../Views/Components/aside.php' ?>

    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-md-8 align-self-center">
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Caja</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Modulos</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Caja</li>
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
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Abiertas</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Cerradas</button>
                </li>
            </ul>

            <div class="tab-content" id="myTabContent">

                <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">

                    <div class="row g-3 align-items-center mb-5 mt-3">
                        <div class="col-auto">
                            <input type="search" id="inputPassword6" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                        </div>
                        <button style="color: #fff;" type="button" class="btn bh_1 btn-circle" data-bs-toggle="modal" data-bs-target="#register-cash">
                            <i data-feather="plus" class="svg-icon"></i>
                        </button>
                    </div>

                    <div class="row">
                        <?php for ($i = 0; $i < 1; $i++) { ?>
                            <div class="col-md-4 col-lg-3 ">
                                <div class="position-relative">
                                    <span class="badge bg-success d-flex justify-content-center align-items-center position-absolute rounded-circle" style="z-index: 1; width: 40px; height: 40px; top: -15px; right: -10px;" data-bs-toggle="tooltip" data-bs-title="Estado de caja" data-bs-placement="top">
                                        <span><i style="font-size: 20px;" data-feather="inbox" class="svg-icon"></i></span>
                                    </span>
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3 border-bottom">
                                                <div class="d-flex justify-content-between ">
                                                    <h5 class="card-title">Nro Caja</h5>
                                                    <div>
                                                        <p class="fs-6">15</p>
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <p class="fw-lighter fs-6">Fecha: 15/3/2025</p>
                                                    <p class="fw-lighter fs-6">Hora: 13:40</p>
                                                </div>
                                            </div>


                                            <div class="row gap-3">
                                                <div class="d-flex flex-column gap-4">
                                                    <div class="d-flex align-item-center justify-content-between text-start">
                                                        <div>Usuario</div>
                                                        <div class="fs-6">Jose Escalona</div>
                                                    </div>

                                                    <div class="d-flex justify-content-center pt-3 border-top gap-4">
                                                        <button class="btn bh_1" style="color: #fff;">Cerrar</button>
                                                        <button class="btn bh_5" style="color: #fff;">Detalles</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>

                    </div>
                </div>

                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">

                    <div class="row g-3 align-items-center my-4">
                        <div class="col-auto">
                            <input type="search" id="inputPassword6" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                        </div>
                    </div>

                    <div class="row">
                        <?php for ($i = 0; $i < 1; $i++) { ?>
                            <div class="col-md-4 col-lg-3 ">
                                <div class="position-relative">
                                    <span class="badge bg-danger d-flex justify-content-center align-items-center position-absolute rounded-circle" style="z-index: 1; width: 40px; height: 40px; top: -15px; right: -10px;" data-bs-toggle="tooltip" data-bs-title="Estado de caja" data-bs-placement="top">
                                        <span><i style="font-size: 20px;" data-feather="inbox" class="svg-icon"></i></span>
                                    </span>
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3 border-bottom">
                                                <div class="d-flex justify-content-between ">
                                                    <h5 class="card-title">Nro Caja</h5>
                                                    <div>
                                                        <p class="fs-6">15</p>
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <p class="fw-lighter fs-6">Fecha: 15/3/2025</p>
                                                    <p class="fw-lighter fs-6">Hora: 13:40</p>
                                                </div>
                                            </div>


                                            <div class="row gap-3">
                                                <div class="d-flex flex-column gap-4">
                                                    <div class="d-flex align-item-center justify-content-between text-start">
                                                        <div>Usuario</div>
                                                        <div class="fs-6">Jose Escalona</div>
                                                    </div>

                                                    <div class="d-flex justify-content-center pt-3 border-top">
                                                        <button class="btn bh_5" style="color: #fff;">Detalles</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>

                    </div>

                </div>

                <?php include_once __DIR__ . '/../Views/Components/modals/cash/modal.php' ?>

            </div>
        </div>
        <?php include_once __DIR__ . '/../Views/Components/footer.php' ?>
    </div>



    <script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
    <script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/js/app-style-switcher.js"></script>
    <script src="./assets/js/feather.min.js"></script>
    <script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="./assets/js/sidebarmenu.js"></script>
    <script src="./assets/js/custom.min.js"></script>