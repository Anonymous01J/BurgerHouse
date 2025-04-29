<?php include_once __DIR__ . '/../Views/Components/header.php' ?>
<?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>

<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
    <?php include_once __DIR__ . '/../Views/Components/topBar.php' ?>
    <?php include_once __DIR__ . '/../Views/Components/aside.php' ?>

    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-7 align-self-center">
                    <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Adicionales</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Aplicaciones</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Papelera</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>
            </div>
        </div>

        <div class="container-fluid">
            <div class="d-flex align-items-start">
                <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab">Mesas</button>
                    <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab">Combo</button>
                    <button class="nav-link" id="v-pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#v-pills-disabled" type="button" role="tab">Materia prima</button>
                    <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab">Recetas</button>
                    <button class="nav-link" id="v-pills-adicional-tab" data-bs-toggle="pill" data-bs-target="#v-pills-adicional" type="button" role="tab">Adicionales</button>
                    <button class="nav-link" id="v-pills-proveedor-tab" data-bs-toggle="pill" data-bs-target="#v-pills-proveedor" type="button" role="tab">Proveedores</button>
                    <button class="nav-link" id="v-pills-client-tab" data-bs-toggle="pill" data-bs-target="#v-pills-client" type="button" role="tab">Clientes</button>
                    <button class="nav-link" id="v-pills-unit-tab" data-bs-toggle="pill" data-bs-target="#v-pills-unit" type="button" role="tab">Unidades</button>
                    <button class="nav-link" id="v-pills-category-tab" data-bs-toggle="pill" data-bs-target="#v-pills-category" type="button" role="tab">Categorias</button>
                    <button class="nav-link" id="v-pills-rol-tab" data-bs-toggle="pill" data-bs-target="#v-pills-rol" type="button" role="tab">Roles</button>
                    <button class="nav-link" id="v-pills-user-tab" data-bs-toggle="pill" data-bs-target="#v-pills-user" type="button" role="tab">Usuarios</button>
                </div>
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel">Mesas</div>
                    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel">combo</div>
                    <div class="tab-pane fade" id="v-pills-disabled" role="tabpanel">materia prima</div>
                    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel">recetas</div>
                    <div class="tab-pane fade" id="v-pills-adicional" role="tabpanel">adicionales</div>
                    <div class="tab-pane fade" id="v-pills-proveedor" role="tabpanel">proveedores</div>
                    <div class="tab-pane fade" id="v-pills-client" role="tabpanel">clietnes</div>
                    <div class="tab-pane fade" id="v-pills-unit" role="tabpanel">unidades</div>
                    <div class="tab-pane fade" id="v-pills-category" role="tabpanel">categorias</div>
                    <div class="tab-pane fade" id="v-pills-rol" role="tabpanel">roles</div>
                    <div class="tab-pane fade" id="v-pills-user" role="tabpanel">usuarios</div>
                </div>
            </div>
        </div>
        <?php include_once __DIR__ . '/../Views/Components/footer.php' ?>

    </div>
</div>

<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>