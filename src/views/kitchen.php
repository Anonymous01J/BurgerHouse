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
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Bienvenido, Felix!</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Aplicaciones</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Cocina</li>
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

            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Pendientes</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Preparados</button>
                </li>
            </ul>

            <div class="tab-content" id="myTabContent">

                <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">

                    <div class="row g-3 align-items-center my-4">
                        <div class="col-auto">
                            <input type="search" id="inputPassword6" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                        </div>
                    </div>

                    <div class="row">
                        <?php for ($i = 0; $i < 5; $i++) { ?>
                            <div class="col-md-4 col-lg-3">
                                <div class="m-auto">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3 border-bottom">
                                                <div class="d-flex justify-content-between ">
                                                    <h5 class="card-title">Nro Orden</h5>
                                                    <div>
                                                        <p class="fs-6">454558</p>
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
                                                        <div>Cliente</div>
                                                        <div class="fs-6">Jose Escalona</div>
                                                    </div>
                                                    <div class="d-flex justify-content-around pt-3 border-top">
                                                        <button class="btn bh_1" style="color: #fff;">Preparar</button>
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
                        <div class="col-md-4 col-lg-3 ">
                            <div class="position-relative">
                                <span class="badge bh_1 d-flex justify-content-center align-items-center position-absolute rounded-circle" style="z-index: 1; width: 40px; height: 40px; top: -15px; right: -10px;">
                                    <span><i style="font-size: 24px;" data-feather="check-circle" class="svg-icon"></i></span>
                                </span>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="mb-3 border-bottom">
                                            <div class="d-flex justify-content-between ">
                                                <h5 class="card-title">Nro Orden</h5>
                                                <div>
                                                    <p class="fs-6">454558</p>
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
                                                    <div>Cliente</div>
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
                    </div>

                </div>


            </div>
        </div>
    </div>



    <script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
    <script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/js/app-style-switcher.js"></script>
    <script type="module" src="./assets/js/funtionGeneral.js"></script>
    <script src="./assets/js/feather.min.js"></script>
    <script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="./assets/js/sidebarmenu.js"></script>
    <script src="./assets/js/custom.min.js"></script>


    <?php include_once __DIR__ . '/../Views/Components/footer.php' ?>
