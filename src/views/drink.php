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
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Bebida</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Modulos</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Combos</li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Bebida</li>
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
                    <input type="search" id="inputPassword6" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                </div>
                <button type="button" class="btn bh_1 btn-circle text-white" data-bs-toggle="modal" data-bs-target="#register-combo">
                    <i data-feather="plus" class="svg-icon"></i>
                </button>
            </div>

            <div class="row">

                <?php include_once __DIR__ . '/../Views/Components/modals/Confirm.php' ?>

                <div class="col-md-12 col-lg-12">
                    <div class="row gap-3">
                        <?php for ($i = 0; $i < 6; $i++) { ?>
                            <div class="card shadow rounded-4 mt-5 w-auto h-auto">
                                <div class="d-flex justify-content-center align-items-center" style="transform: translateY(-70px);">
                                    <img src="./assets/img/users/profile-pic.jpg" alt="user" class="rounded-circle img-fluid" width="190">
                                </div>
                                <div class="card-body p-0" style="transform: translateY(-50px);">
                                    <h5 class="card-title mb-3">Nombre</h5>
                                    <div class="mb-4 d-flex justify-content-between">
                                        <h3>Marca</h3>
                                        <p>Pepsicola</p>
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



<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>
<script type="module" src="./assets/js/pages/combo/bebida.js"></script>



<?php include_once __DIR__ . '/../Views/Components/footer.php' ?>