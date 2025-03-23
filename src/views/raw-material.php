<?php include_once __DIR__ . '/../Views/Components/header.php' ?>
<?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>

<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">


    <?php include_once __DIR__ . '/../Views/Components/topBar.php' ?>

    <?php include_once __DIR__ . '/../Views/Components/aside.php' ?>


    <div class="page-wrapper">

        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-7 align-self-center">
                    <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Materia Prima</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Modulos</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Combos</li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Materia Prima</li>
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
                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Materia Prima</button>
                    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Entradas</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">

                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <button data-bs-toggle="modal" data-bs-target="#register-rawMaterial" type="button" class="btn bh_1 text-white mt-3">
                                        <i class="fas fa-plus"></i>
                                        Materia Prima
                                    </button>

                                    <div class="table-responsive mt-3">
                                        <table class="table table-striped no-wrap">
                                            <thead>
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Categoria</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Carne de res</td>
                                                    <td>Carne</td>
                                                    <td>
                                                        <button class="btn bh_1 rounded-circle btn-circle" data-bs-toggle="tooltip" data-bs-title="Verificar pago" data-bs-placement="top">
                                                            <i data-feather="edit" class="text-white"></i>
                                                        </button>
                                                        <button data-bs-toggle="modal" data-bs-target="#confirmAction" class="btn bh_5 rounded-circle btn-circle" data-bs-toggle="tooltip" data-bs-title="Anular" data-bs-placement="top">
                                                            <i data-feather="trash" class="text-white"></i>
                                                        </button>
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

                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_5BG text-center">
                                                    <h1 class="font-light text-white">45</h1>
                                                    <h6 class="text-white">Entradas Totales</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_1BG text-center">
                                                    <h1 class="font-light text-white">10</h1>
                                                    <h6 class="text-white">En vigencia</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_2 text-center">
                                                    <h1 class="font-light text-white">10</h1>
                                                    <h6 class="text-white">Por vencer</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_4 text-center">
                                                    <h1 class="font-light text-white">10</h1>
                                                    <h6 class="text-white">Vencidas</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_5BG text-center">
                                                    <h1 class="font-light text-white">15</h1>
                                                    <h6 class="text-white">Sin Stock</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <button data-bs-toggle="modal" data-bs-target="#register-entrys" type="button" class="btn bh_1 text-white mt-3">
                                                <i class="fas fa-plus"></i>
                                                Entrada
                                            </button>
                                        </div>
                                    </div>

                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" id="vigentes" data-bs-toggle="tab" data-bs-target="#vigentes-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Vigentes</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="porVencer" data-bs-toggle="tab" data-bs-target="#porVencer-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Por Vencer</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="vencidos" data-bs-toggle="tab" data-bs-target="#vencidos-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Vencidas</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="sinStock" data-bs-toggle="tab" data-bs-target="#sinStock-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Sin stock</button>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="vigentes-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                                            <div class="table-responsive mt-4">
                                                <table class="table table-striped no-wrap">
                                                    <thead>
                                                        <tr>
                                                            <th>Codigo</th>
                                                            <th>Nombre</th>
                                                            <th>Proveedor</th>
                                                            <th>F.EXP</th>
                                                            <th>F.VENC</th>
                                                            <th>Cantidad</th>
                                                            <th>Existencia</th>
                                                            <th>P.COMPRA</th>
                                                            <th>Comprobante</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><span class="fs-6">641961</span></td>
                                                            <td><span class="fs-6">Solomo de carne</span></td>
                                                            <td><span class="fs-6">Carliss</span></td>
                                                            <td>13-3-2025</td>
                                                            <td>26-3-2026</td>
                                                            <td>3 kg</td>
                                                            <td>1 kg</td>
                                                            <td class="fs-6">130 Bs</td>
                                                            <td class="fs-6">img</td>
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
                                        <div class="tab-pane fade" id="porVencer-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                                            <div class="table-responsive mt-4">
                                                <table class="table table-striped no-wrap">
                                                    <thead>
                                                        <tr>
                                                            <th>Codigo</th>
                                                            <th>Nombre</th>
                                                            <th>Proveedor</th>
                                                            <th>F.EXP</th>
                                                            <th>F.VENC</th>
                                                            <th>Cantidad</th>
                                                            <th>Existencia</th>
                                                            <th>P.COMPRA</th>
                                                            <th>Comprobante</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><span class="fs-6">641961</span></td>
                                                            <td><span class="fs-6">Solomo de carne</span></td>
                                                            <td><span class="fs-6">Carliss</span></td>
                                                            <td>13-3-2025</td>
                                                            <td>26-3-2026</td>
                                                            <td>3 kg</td>
                                                            <td>1 kg</td>
                                                            <td class="fs-6">130 Bs</td>
                                                            <td class="fs-6">img</td>
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
                                        <div class="tab-pane fade" id="vencidos-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                                            <div class="table-responsive mt-4">
                                                <table class="table table-striped no-wrap">
                                                    <thead>
                                                        <tr>
                                                            <th>Codigo</th>
                                                            <th>Nombre</th>
                                                            <th>Proveedor</th>
                                                            <th>F.EXP</th>
                                                            <th>F.VENC</th>
                                                            <th>Cantidad</th>
                                                            <th>Existencia</th>
                                                            <th>P.COMPRA</th>
                                                            <th>Comprobante</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><span class="fs-6">641961</span></td>
                                                            <td><span class="fs-6">Solomo de carne</span></td>
                                                            <td><span class="fs-6">Carliss</span></td>
                                                            <td>13-3-2025</td>
                                                            <td>26-3-2026</td>
                                                            <td>3 kg</td>
                                                            <td>1 kg</td>
                                                            <td class="fs-6">130 Bs</td>
                                                            <td class="fs-6">img</td>
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
                                        <div class="tab-pane fade" id="sinStock-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                                            <div class="table-responsive mt-4">
                                                <table class="table table-striped no-wrap">
                                                    <thead>
                                                        <tr>
                                                            <th>Codigo</th>
                                                            <th>Nombre</th>
                                                            <th>Proveedor</th>
                                                            <th>F.EXP</th>
                                                            <th>F.VENC</th>
                                                            <th>Cantidad</th>
                                                            <th>Existencia</th>
                                                            <th>P.COMPRA</th>
                                                            <th>Comprobante</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><span class="fs-6">641961</span></td>
                                                            <td><span class="fs-6">Solomo de carne</span></td>
                                                            <td><span class="fs-6">Carliss</span></td>
                                                            <td>13-3-2025</td>
                                                            <td>26-3-2026</td>
                                                            <td>3 kg</td>
                                                            <td>1 kg</td>
                                                            <td class="fs-6">130 Bs</td>
                                                            <td class="fs-6">img</td>
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

            </div>


        </div>

    </div>

    <?php include_once __DIR__ . '/../Views/Components/modals/Confirm.php' ?>
    <?php include_once __DIR__ . '/../Views/Components/modals/raw_material/entrysModal.php' ?>
    <?php include_once __DIR__ . '/../Views/Components/modals/raw_material/raw-materialModal.php' ?>

</div>

<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>


<?php include_once __DIR__ . '/../Views/Components/footer.php' ?>