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
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Cocina</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Aplicaciones</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Cocina</li>
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
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Pendientes</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="incomplete-tab" data-bs-toggle="tab" data-bs-target="#incomplete-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">En preparación</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Preparados</button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                    <div class="row g-3 align-items-center my-4">
                        <div class="col-auto">
                            <input type="search" id="searchKitchenPending" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                        </div>
                    </div>
                    <div class="d-flex gap-2 justify-content-start flex-wrap ps-0 mb-4">
                        <div>
                            <input type="radio" class="btn-check btn_check_pending" name="data-filter" data-filter="all" id="kitchen_all_pending" autocomplete="off" checked>
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_all_pending">Todos</label>
                        </div>
                        <div>
                            <input type="radio" class="btn-check btn_check_pending" name="data-filter" data-filter="all" id="kitchen_delivery_pending" autocomplete="off">
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_delivery_pending">Delivery</label>
                        </div>
                        <div>
                            <input type="radio" class="btn-check btn_check_pending" name="data-filter" data-filter="all" id="kitchen_takeaway_pending" autocomplete="off">
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_takeaway_pending">Para llevar</label>
                        </div>
                        <div>
                            <input type="radio" class="btn-check btn_check_pending" name="data-filter" data-filter="all" id="kitchen_local_pending" autocomplete="off">
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_local_pending">Local</label>
                        </div>
                    </div>
                    <div class="row kitchen-cont-prepared">
                        <!-- dad -->
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination_prepared justify-content-end">
                            <li class="page-item" id="prev-page">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <!-- Aquí se insertan los números dinámicamente -->
                            <li class="page-item" id="next-page">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="tab-pane fade" id="incomplete-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">

                    <div class="row g-3 align-items-center my-4">
                        <div class="col-auto">
                            <input type="search" id="searchKitchenInPrepared" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                        </div>
                    </div>
                    <div class="d-flex gap-2 justify-content-start flex-wrap ps-0 mb-4">
                        <div>
                            <input type="radio" class="btn-check btn_check_inprepared" name="data-filter" data-filter="all" id="kitchen_all_inprepared" autocomplete="off" checked>
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_all_inprepared">Todos</label>
                        </div>
                        <div>
                            <input type="radio" class="btn-check btn_check_inprepared" name="data-filter" data-filter="all" id="kitchen_delivery_inprepared" autocomplete="off">
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_delivery_inprepared">Delivery</label>
                        </div>
                        <div>
                            <input type="radio" class="btn-check btn_check_inprepared" name="data-filter" data-filter="all" id="kitchen_takeaway_inprepared" autocomplete="off">
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_takeaway_inprepared">Para llevar</label>
                        </div>
                        <div>
                            <input type="radio" class="btn-check btn_check_inprepared" name="data-filter" data-filter="all" id="kitchen_local_inprepared" autocomplete="off">
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_local_inprepared">Local</label>
                        </div>
                    </div>
                    <div class="row kitchen-cont-inprepared">
                        <!-- dad -->
                    </div>




                </div>
                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                    <div class="row g-3 align-items-center my-4">
                        <div class="col-auto">
                            <input type="search" id="searchKitchenPrepared" placeholder="Buscar" class="form-control" aria-describedby="passwordHelpInline">
                        </div>
                    </div>
                    <div class="d-flex gap-2 justify-content-start flex-wrap ps-0 mb-4">
                        <div>
                            <input type="radio" class="btn-check btn_check_off" name="data-filter-off" data-filter="all" id="kitchen_all_off" autocomplete="off" checked>
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_all_off">Todos</label>
                        </div>
                        <div>
                            <input type="radio" class="btn-check btn_check_off" name="data-filter-off" data-filter="all" id="kitchen_delivery_off" autocomplete="off">
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_delivery_off">Delivery</label>
                        </div>
                        <div>
                            <input type="radio" class="btn-check btn_check_off" name="data-filter-off" data-filter="all" id="kitchen_takeaway_off" autocomplete="off">
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_takeaway_off">Para llevar</label>
                        </div>
                        <div>
                            <input type="radio" class="btn-check btn_check_off" name="data-filter-off" data-filter="all" id="kitchen_local_off" autocomplete="off">
                            <label class="btn bh_1CHECKBOX rounded-pill" for="kitchen_local_off">Local</label>
                        </div>
                    </div>
                    <div class="row kitchen-cont-prepared-off">
                        <!-- aqui cargan con js -->
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination_preparedoff justify-content-end">
                            <li class="page-item" id="prev-page">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <!-- Aquí se insertan los números dinámicamente -->
                            <li class="page-item" id="next-page">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <?php include_once __DIR__ . '/../Views/Components/modals/delivery-kitchen/modal.php' ?>
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
    <script src="./assets/libs/libs/jspdf/jspdf.umd.min.js"></script>
    <script type="module" src="./assets/js/pages/kitchen/kitchen.js"></script>