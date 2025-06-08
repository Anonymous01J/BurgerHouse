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
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Productos Preparados</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Modulos</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Productos Preparados</li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Producto</li>
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
                    <input type="search" id="searchProduct" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                </div>
                <button type="button" class="btn bh_1 btn-circle text-white btn-add-tooltip" data-module-add="product" data-bs-toggle="modal" data-bs-target="#register-product" data-bs-title="Agregar Producto" 
                data-bs-placement="top">
                    <i data-feather="plus" class="svg-icon"></i>
                </button>
            </div>

            <div class="row">
                <div class="col-md-12 col-lg-3">
                    <div class="card">
                        <div id="categories" class="card-body">
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
                    <div id="top-products" class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <h4 class="card-title">Top Productos</h4>
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
                    <div class="row row-cols-1 row-cols-md-3 row-cols-lg-3 g-4 cont-product ">
                        
                    </div>
                </div>
            </div>
        </div>
        <?php include_once __DIR__ . '/../Views/Components/footer.php' ?>
        <?php include_once __DIR__ . '/../Views/Components/modals/productPrepared/modal.php' ?>
    </div>
</div>


<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>
<script type="module" defer src="./assets/js/pages/productPrepared/productPrepared.js"></script>