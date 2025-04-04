<?php include_once __DIR__ . '/../Views/Components/header.php' ?>
<?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>

<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">


    <?php include_once __DIR__ . '/../Views/Components/topBar.php' ?>

    <?php include_once __DIR__ . '/../Views/Components/aside.php' ?>


    <div class="page-wrapper">

        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-7 align-self-center">
                    <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Recetas</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Modulos</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Combos</li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Receta</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>

            </div>
        </div>

        <div class="container-fluid">


            <div class="row g-3 align-items-center mb-5 mt-3">
                <div class="col-auto">
                    <input type="search" id="inputPassword6" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                </div>
                <button type="button" class="btn bh_1 btn-circle text-white" data-bs-toggle="modal" data-bs-target="#register-recipe">
                    <i data-feather="plus" class="svg-icon"></i>
                </button>
            </div>

            <div class="row mt-4">
                <?php for ($i = 0; $i < 5; $i++) { ?>
                    <div class="col-md-4 col-lg-6 ">
                        <div class="position-relative">
                            <span class="badge bh_1 d-flex justify-content-center align-items-center position-absolute rounded-circle" style="z-index: 1; width: 40px; height: 40px; top: -15px; right: -10px;">
                                <span><i style="font-size: 20px;" data-feather="book" class="svg-icon"></i></span>
                            </span>
                            <div class="card">
                                <div class="card-body">
                                    <div class="mb-3 border-bottom">
                                        <div class="d-flex justify-content-between ">
                                            <h5 class="card-title">Nombre</h5>
                                        </div>
                                    </div>

                                    <div class="row gap-3">
                                        <div class="d-flex flex-column gap-4">
                                            <div class="row">
                                                <div class="container mb-3">
                                                    <ul class=" list-unstyled lista-multi">
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                        <li class="fs-3">• Ingrediente 1</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-end gap-3 border-top pt-3">
                                                <i style="cursor: pointer;" data-feather="edit"></i>
                                                <i style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#confirmAction" data-feather="trash-2"></i>
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

    </div>

    <?php include_once __DIR__ . '/../Views/Components/modals/Confirm.php' ?>
    <?php include_once __DIR__ . '/../Views/Components/modals/combo/recipe.php' ?>


</div>

<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>
<script type="module" src="./assets/js/pages/combo/recipe.js"></script>



<?php include_once __DIR__ . '/../Views/Components/footer.php' ?>