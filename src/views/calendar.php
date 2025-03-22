<?php include_once __DIR__ . '/../Views/Components/header.php' ?>
<?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>

<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">

    <?php include_once __DIR__ . '/../Views/Components/topBar.php' ?>

    <?php include_once __DIR__ . '/../Views/Components/aside.php' ?>

    <div class="page-wrapper">

        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-7 align-self-center">
                    <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Calendario</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item text-muted active" aria-current="page">Aplicaciones</li>
                                <li class="breadcrumb-item text-muted" aria-current="page">Calendario</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                
                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>

            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="">
                            <div class="row">
                                <div class="col-lg-3 border-end pr-0">
                                    <div class="card-body border-bottom">
                                        <h4 class="card-title mt-2">Eventos y reservaciones</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div id="calendar-events" class="">
                                                    <div class="calendar-events mb-3"><i
                                                            class="fa fa-circle me-2" style="color: #FFB200;"></i>Eventos</div>
                                                    <div class="calendar-events mb-3" data-class="bg-success"><i
                                                            class="fa fa-circle me-2" style="color: #FF4B00;"></i>Reservaciones
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <div class="card-body b-l calender-sidebar">
                                        <div id="calendar"></div>
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
<script src="./assets/libs/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
<script src="./assets/libs/extra-libs/taskboard/js/jquery-ui.min.js"></script>
<script src="./assets/libs/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>
<script src="./assets/libs/libs/moment/min/moment.min.js"></script>
<script src="./assets/libs/libs/fullcalendar/dist/fullcalendar.min.js"></script>
<script src="./assets/js/pages/calendar/cal-init.js"></script>

<?php include_once __DIR__ . '/../Views/Components/footer.php' ?>
