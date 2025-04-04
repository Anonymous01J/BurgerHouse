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
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Categorias</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="./index.php">Modulos</a>
                                <li class="breadcrumb-item text-muted" aria-current="page">Categoria</li>
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
                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Categorias de Combos</button>
                    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Categorias de Materia Prima</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                    <div class="row">
                        <div class="col-md-6 col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Nombre de categoria" aria-label="Recipient's username" aria-describedby="button-addon2">
                                        <button class="btn bh_1" type="button" id="button-addon2" style="color: #fff;">Guardar</button>
                                    </div>
                                    <div class="table-responsive mt-5">
                                        <table class="table table-dark-mode no-wrap">
                                            <thead>
                                                <tr>
                                                    <th>Nro de marca</th>
                                                    <th>Nombre</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td><span class="fs-6">Hamburguesas</span></td>
                                                    <td>
                                                        <button data-bs-toggle="modal" data-bs-target="#confirmAction" class="btn bh_1 rounded-circle btn-circle">
                                                            <i data-feather="edit" class="text-white"></i>
                                                        </button>
                                                        <button data-bs-toggle="modal" data-bs-target="#confirmAction" class="btn bh_5 rounded-circle btn-circle">
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
                        <div class="col-md-6 col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Nombre de categoria" aria-label="Recipient's username" aria-describedby="button-addon2">
                                        <button class="btn bh_1" type="button" id="button-addon2" style="color: #fff;">Guardar</button>
                                    </div>
                                    <div class="table-responsive mt-5">
                                        <table class="table table-dark-mode no-wrap">
                                            <thead>
                                                <tr>
                                                    <th>Nro de marca</th>
                                                    <th>Nombre</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td><span class="fs-6">Carnes rojas</span></td>
                                                    <td>
                                                        <button data-bs-toggle="modal" data-bs-target="#confirmAction" class="btn bh_1 rounded-circle btn-circle">
                                                            <i data-feather="edit" class="text-white"></i>
                                                        </button>
                                                        <button data-bs-toggle="modal" data-bs-target="#confirmAction" class="btn bh_5 rounded-circle btn-circle">
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
            </div>

        </div>

        <?php include_once __DIR__ . '/../Views/Components/modals/Confirm.php' ?>
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



<?php include_once __DIR__ . '/../Views/Components/footer.php' ?>