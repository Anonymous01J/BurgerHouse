<?php require_once("./Components/header.php") ?>
<?php require_once("./Components/preloader.php") ?>


<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">

    <?php require_once("./Components/topBar.php") ?>

    <?php require_once("./Components/aside.php") ?>

    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-7 align-self-center">
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Bienvenido, Felix!</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Combos</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Combo</li>
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

            <div class="row g-3 align-items-center mb-5">
                <div class="col-auto">
                    <input type="search" id="inputPassword6" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                </div>
                <img src="../assets/images/boton.png" style="width: 50px;">
            </div>

            <div class="row">
                <div class="col-md-12 col-lg-4">
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
                                            <img src="../assets/images/users/profile-pic.jpg" alt="user" class="rounded-circle img-fluid" width="120">
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-8">
                    <div class="row gap-3 mx-auto">
                        <?php for ($i = 0; $i < 6; $i++) { ?>
                            <div class="card shadow rounded-4 mt-5 mx-auto w-auto h-auto">
                                <div class="d-flex justify-content-center align-items-center" style="transform: translateY(-70px);">
                                    <img src="../assets/images/users/profile-pic.jpg" alt="user" class="rounded-circle img-fluid" width="190">
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
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="../assets/libs/jquery/dist/jquery.min.js"></script>
<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="../dist/js/app-style-switcher.js"></script>
<script type="module" src="../dist/js/funtionGeneral.js"></script>
<script src="../dist/js/feather.min.js"></script>
<script src="../assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../dist/js/sidebarmenu.js"></script>
<script src="../dist/js/custom.min.js"></script>
<script src="../assets/extra-libs/c3/d3.min.js"></script>
<script src="../assets/extra-libs/c3/c3.min.js"></script>
<script src="../assets/libs/chartist/dist/chartist.min.js"></script>
<script src="../assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
<script src="../assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
<script src="../assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
<script src="../dist/js/pages/dashboards/dashboard1.min.js"></script>


<?php require_once("./Components/footer.php") ?>