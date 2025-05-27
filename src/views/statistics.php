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
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Estadisticas</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="home" class="text-muted">Aplicaciones</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Estadisticas</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>

            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start">
                                <div>
                                    <h4 class="card-title">Gasto Promedio (Clientes)</h4>
                                    <p class="fs-6">Semana 14 de Febrero del 2025</p>
                                </div>
                                <div class="ms-auto">
                                    <div class="dropdown sub-dropdown">
                                        <a class="link-secondary text-muted" id="pdf_net_income" style="cursor: pointer">
                                            <i data-feather="download"></i>
                                        </a>
                                        <button class="btn btn-link text-muted dropdown-toggle" type="button"
                                            id="dd1" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            <i data-feather="more-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dd1">
                                            <div class="row p-3">
                                                <div class="col-md-12">
                                                    <label for="inputEmail4" class="form-label">Ingrese año</label>
                                                    <input type="text" class="form-control" placeholder="Año" id="year_net_income">
                                                    <div class="d-flex justify-content-center mt-3">
                                                        <button class="btn bh_1 text-white mx-auto" id="search_net_income">Buscar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="net_income_container">
                                <canvas class="mt-1 position-relative mt-2 w-100 h-25" id="ticketChart"></canvas>
                                <div class="d-flex align-items-center gap-4 mt-3">
                                    <div>
                                        <i class="fas fa-circle text-primary font-10 me-2"></i>
                                        <span class="text-muted me-1 fs-6">Mejor rendimiento</span>
                                        <span class="fs-6 mesMax">Ene con 25$</span>
                                    </div>
                                    <div>
                                        <i class="fas fa-circle text-primary font-10 me-2"></i>
                                        <span class="text-muted me-1 fs-6">Peor rendimiento</span>
                                        <span class="fs-6 mesMin">Mar con 2$</span>
                                    </div>
                                    <div>
                                        <i class="fas fa-circle text-primary font-10 me-2"></i>
                                        <span class="text-muted me-1 fs-6">Promedio anual</span>
                                        <span class="fs-6 promedio">5$</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center gap-4 mt-3">
                                    <div>
                                        <i class="fas fa-circle text-primary font-10 me-2"></i>
                                        <span class="text-muted me-1 fs-6">Promedio 1er semestre</span>
                                        <span class="fs-6 promedioS1">25$</span>
                                    </div>
                                    <div>
                                        <i class="fas fa-circle text-primary font-10 me-2"></i>
                                        <span class="text-muted me-1 fs-6">Promedio 2do semestre</span>
                                        <span class="fs-6 promedioS2">12$</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex">
                                <div class="mb-4">
                                    <h4 class="card-title">Total de ventas</h4>
                                    <p class="fs-6">Semana 14 de Febrero del 2025</p>
                                </div>
                                <div class="ms-auto">
                                    <div class="dropdown sub-dropdown">
                                        <a class="link-secondary text-muted" id="pdf_net_income" style="cursor: pointer">
                                            <i data-feather="download"></i>
                                        </a>
                                        <button class="btn btn-link text-muted dropdown-toggle" type="button"
                                            id="dd1" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            <i data-feather="more-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dd1">
                                            <div class="row p-3">
                                                <div class="col-md-12">
                                                    <label for="inputEmail4" class="form-label">Ingrese año</label>
                                                    <input type="text" class="form-control" placeholder="Año" id="year_net_income">
                                                    <div class="d-flex justify-content-center mt-3">
                                                        <button class="btn bh_1 text-white mx-auto" id="search_net_income">Buscar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <canvas class="mb-4" id="myDonutChart"></canvas>
                            <ul class="list-style-none mb-0">
                                <li>
                                    <i class="fas fa-circle font-10 me-2" style="color: #FF4B00;"></i>
                                    <span class="text-muted">Delivery</span>
                                    <span class="text-dark float-end font-weight-medium">$2346</span>
                                </li>
                                <li class="mt-3">
                                    <i class="fas fa-circle font-10 me-2" style="color: #FFB200;"></i>
                                    <span class="text-muted">Local</span>
                                    <span class="text-dark float-end font-weight-medium">$2108</span>
                                </li>
                                <li class="mt-3">
                                    <!-- <i class="fas fa-circle text-cyan font-10 me-2"></i>
                                    <span class="text-muted">Affiliate Sales</span>
                                    <span class="text-dark float-end font-weight-medium">$1204</span> -->
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start">
                                <h4 class="card-title">Tasa de reservacion % por horario (2025)</h4>
                                <div class="ms-auto">
                                    <div class="dropdown sub-dropdown">
                                        <a class="link-secondary text-muted" id="tasaReservacion" style="cursor: pointer">
                                            <i data-feather="download"></i>
                                        </a>
                                        <button class="btn btn-link text-muted dropdown-toggle" type="button"
                                            id="dd1" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            <i data-feather="more-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dd1">
                                            <div class="row p-3">
                                                <div class="col-md-12">
                                                    <label for="inputEmail4" class="form-label">Ingrese año</label>
                                                    <input type="text" class="form-control" placeholder="Año" id="year_net_income">
                                                    <div class="d-flex justify-content-center mt-3">
                                                        <button class="btn bh_1 text-white mx-auto" id="search_net_income">Buscar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <canvas id="ocupacionChart"></canvas>

                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start">
                                <h4 class="card-title">% de reservas por canales (2025)</h4>
                                <div class="ms-auto">
                                    <div class="dropdown sub-dropdown">
                                        <a class="link-secondary text-muted" id="pdf_net_income" style="cursor: pointer">
                                            <i data-feather="download"></i>
                                        </a>
                                        <button class="btn btn-link text-muted dropdown-toggle" type="button"
                                            id="dd1" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            <i data-feather="more-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dd1">
                                            <div class="row p-3">
                                                <div class="col-md-12">
                                                    <label for="inputEmail4" class="form-label">Ingrese año</label>
                                                    <input type="text" class="form-control" placeholder="Año" id="year_net_income">
                                                    <div class="d-flex justify-content-center mt-3">
                                                        <button class="btn bh_1 text-white mx-auto" id="search_net_income">Buscar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <canvas id="ReservasChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <?php include_once __DIR__ . '/../Views/Components/footer.php' ?>
    </div>
</div>



<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="./assets/js/prueba.js"></script>
<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>
<script src="./assets/libs/libs/chart.js/dist/Chart.min.js"></script>
<script src="./assets/libs/libs/chart.js/dist/chartjs-plugin-datalabels.js"></script>
<script src="./assets/js/pages/statistics/statistics.js"></script>