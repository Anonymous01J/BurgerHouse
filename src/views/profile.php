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
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Perfil</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="./index.php">Perfil</a>
                            </ol>
                        </nav>
                    </div>
                </div>

                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>

            </div>
        </div>

        <div class="container-fluid">

            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Perfil</button>
                    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Estadisticas</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                    <div class="row mt-3">
                        <div class="col-md-6 col-lg-8">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-md-3 col-lg-5 text-center">
                                            <img src="./assets/img/users/7.jpg" alt="user" class=" rounded-circle w-75 mb-4">
                                            <h3 class="text-uppercase">cajero</h3>
                                        </div>
                                        <div class="col-md-9 col-lg-7">
                                            <div class="row mb-4">
                                                <label for="colFormLabel" class="col-sm-5 col-form-label">Nombre</label>
                                                <div class="col-sm-7">
                                                    <input type="email" class="form-control" id="colFormLabel" placeholder="Nombre">
                                                </div>
                                            </div>
                                            <div class="row mb-4">
                                                <label for="colFormLabel" class="col-sm-5 col-form-label">Apellido</label>
                                                <div class="col-sm-7">
                                                    <input type="email" class="form-control" id="colFormLabel" placeholder="Apellido">
                                                </div>
                                            </div>
                                            <div class="row mb-4">
                                                <label for="colFormLabel" class="col-sm-5 col-form-label">Correo Electronico</label>
                                                <div class="col-sm-7">
                                                    <input type="email" class="form-control" id="colFormLabel" placeholder="Correo Electronico">
                                                </div>
                                            </div>
                                            <div class="mt-5 d-flex justify-content-center">
                                                <button class="btn bh_1 text-white">Guardar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <h3 class="mb-4 border-bottom pb-3">Cambiar Contraseña</h3>
                                        <div class="row mb-4">
                                                <label for="colFormLabel" class="col-sm-5 col-form-label">Contraseña Anterior</label>
                                                <div class="col-sm-7">
                                                    <input type="email" class="form-control" id="colFormLabel" placeholder="Contraseña Anterior">
                                                </div>
                                            </div>
                                            <div class="row mb-4">
                                                <label for="colFormLabel" class="col-sm-5 col-form-label">Contraseña Nueva</label>
                                                <div class="col-sm-7">
                                                    <input type="email" class="form-control" id="colFormLabel" placeholder="Contraseña Nueva">
                                                </div>
                                            </div>
                                            <div class="row mb-4">
                                                <label for="colFormLabel" class="col-sm-5 col-form-label">Confirmar Contraseña</label>
                                                <div class="col-sm-7">
                                                    <input type="email" class="form-control" id="colFormLabel" placeholder="Confirmar Contraseña">
                                                </div>
                                            </div>
                                            <div class="mt-5 d-flex justify-content-center">
                                                <button class="btn bh_1 text-white">Guardar</button>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Actividad Reciente</h4>
                                    <div class="mt-4 activity">
                                        <div class="d-flex align-items-start border-left-line pb-3">
                                            <div>
                                                <a href="javascript:void(0)" class="btn btn-info btn-circle mb-2 btn-item">
                                                    <i data-feather="shopping-cart"></i>
                                                </a>
                                            </div>
                                            <div class="ms-3 mt-2">
                                                <h5 class="text-dark font-weight-medium mb-2">New Product Sold!</h5>
                                                <p class="font-14 mb-2 text-muted">John Musa just purchased <br> Cannon 5M
                                                    Camera.
                                                </p>
                                                <span class="font-weight-light font-14 text-muted">10 Minutes Ago</span>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start border-left-line pb-3">
                                            <div>
                                                <a href="javascript:void(0)"
                                                    class="btn btn-danger btn-circle mb-2 btn-item">
                                                    <i data-feather="message-square"></i>
                                                </a>
                                            </div>
                                            <div class="ms-3 mt-2">
                                                <h5 class="text-dark font-weight-medium mb-2">New Support Ticket</h5>
                                                <p class="font-14 mb-2 text-muted">Richardson just create support <br>
                                                    ticket</p>
                                                <span class="font-weight-light font-14 text-muted">25 Minutes Ago</span>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start border-left-line pb-3">
                                            <div>
                                                <a href="javascript:void(0)"
                                                    class="btn btn-danger btn-circle mb-2 btn-item">
                                                    <i data-feather="message-square"></i>
                                                </a>
                                            </div>
                                            <div class="ms-3 mt-2">
                                                <h5 class="text-dark font-weight-medium mb-2">New Support Ticket</h5>
                                                <p class="font-14 mb-2 text-muted">Richardson just create support <br>
                                                    ticket</p>
                                                <span class="font-weight-light font-14 text-muted">25 Minutes Ago</span>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start border-left-line pb-3">
                                            <div>
                                                <a href="javascript:void(0)"
                                                    class="btn btn-danger btn-circle mb-2 btn-item">
                                                    <i data-feather="message-square"></i>
                                                </a>
                                            </div>
                                            <div class="ms-3 mt-2">
                                                <h5 class="text-dark font-weight-medium mb-2">New Support Ticket</h5>
                                                <p class="font-14 mb-2 text-muted">Richardson just create support <br>
                                                    ticket</p>
                                                <span class="font-weight-light font-14 text-muted">25 Minutes Ago</span>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start border-left-line">
                                            <div>
                                                <a href="javascript:void(0)" class="btn btn-cyan btn-circle mb-2 btn-item">
                                                    <i data-feather="bell"></i>
                                                </a>
                                            </div>
                                            <div class="ms-3 mt-2">
                                                <h5 class="text-dark font-weight-medium mb-2">Notification Pending Order!
                                                </h5>
                                                <p class="font-14 mb-2 text-muted">One Pending order from Ryne <br> Doe</p>
                                                <span class="font-weight-light font-14 mb-1 d-block text-muted">2 Hours
                                                    Ago</span>
                                                <a href="javascript:void(0)"
                                                    class="font-14 border-bottom pb-1 border-info">Load More</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">...</div>

            </div>
        </div>



        <script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
        <script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <script src="./assets/js/app-style-switcher.js"></script>
        <script src="./assets/js/feather.min.js"></script>
        <script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
        <script src="./assets/js/sidebarmenu.js"></script>
        <script src="./assets/js/custom.min.js"></script>





        <?php include_once __DIR__ . '/../Views/Components/footer.php' ?>