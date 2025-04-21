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
                    <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Bienvenido, Felix!</h3>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="home">Dashboard</a>
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>

            </div>
        </div>

        <div class="container-fluid">

            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    <div class="card border-end">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">15</h2>
                                        <span class="badge bg-primary font-12 text-white font-weight-medium rounded-pill ms-2 d-lg-block d-md-none">+18.33%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Nuevos Clientes
                                    </h6>
                                </div>
                                <div class="ms-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="user-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="card border-end ">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h2 class="text-dark mb-1 w-100 text-truncate font-weight-medium"><sup
                                            class="set-doller">$</sup>18,306</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Ganancias del Mes
                                    </h6>
                                </div>
                                <div class="ms-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="dollar-sign"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="card border-end ">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">25</h2>
                                        <!-- <span class="badge bg-danger font-12 text-white font-weight-medium rounded-pill ms-2 d-md-none d-lg-block">-18.33%</span> -->
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Ordenes Completadas
                                    </h6>
                                </div>
                                <div class="ms-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="file-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="card ">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h2 class="text-dark mb-1 font-weight-medium">8</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Mesas Disponibles</h6>
                                </div>
                                <div class="ms-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="globe"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Total de ventas</h4>
                            <div id="campaign-v2" class="mt-2" style="height:283px; width:100%;"></div>
                            <ul class="list-style-none mb-0">
                                <li>
                                    <i class="fas fa-circle text-primary font-10 me-2"></i>
                                    <span class="text-muted">Delivery</span>
                                    <span class="text-dark float-end font-weight-medium">$2346</span>
                                </li>
                                <li class="mt-3">
                                    <i class="fas fa-circle text-danger font-10 me-2"></i>
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
                <div class="col-lg-8 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start">
                                <h4 class="card-title">Ganancia Neta</h4>
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
                                <div class="net-income mt-1 position-relative mt-2" style="height:294px;"></div>
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
                                <!-- <div id="resumen-anual" class="mt-3 fs-6"></div> -->
                                <ul class="list-inline text-center mt-4 mb-2">
                                    <li class="list-inline-item text-muted fst-italic fs-6">Ventas del Mes $</li>
                                </ul>
                            </div>


                        </div>
                    </div>
                </div>
                <!-- <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title mb-4">Earning by Location</h4>
                            <div class="" style="height:180px">
                                <div id="visitbylocate" style="height:100%"></div>
                            </div>
                            <div class="row mb-3 align-items-center mt-1 mt-5">
                                <div class="col-4 text-end">
                                    <span class="text-muted font-14">India</span>
                                </div>
                                <div class="col-5">
                                    <div class="progress" style="height: 5px;">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 100%"
                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-3 text-end">
                                    <span class="mb-0 font-14 text-dark font-weight-medium">28%</span>
                                </div>
                            </div>
                            <div class="row mb-3 align-items-center">
                                <div class="col-4 text-end">
                                    <span class="text-muted font-14">UK</span>
                                </div>
                                <div class="col-5">
                                    <div class="progress" style="height: 5px;">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 74%"
                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-3 text-end">
                                    <span class="mb-0 font-14 text-dark font-weight-medium">21%</span>
                                </div>
                            </div>
                            <div class="row mb-3 align-items-center">
                                <div class="col-4 text-end">
                                    <span class="text-muted font-14">USA</span>
                                </div>
                                <div class="col-5">
                                    <div class="progress" style="height: 5px;">
                                        <div class="progress-bar bg-cyan" role="progressbar" style="width: 60%"
                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-3 text-end">
                                    <span class="mb-0 font-14 text-dark font-weight-medium">18%</span>
                                </div>
                            </div>
                            <div class="row align-items-center">
                                <div class="col-4 text-end">
                                    <span class="text-muted font-14">China</span>
                                </div>
                                <div class="col-5">
                                    <div class="progress" style="height: 5px;">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 50%"
                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-3 text-end">
                                    <span class="mb-0 font-14 text-dark font-weight-medium">12%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
            </div>

            <div class="row">
                <div class="col-md-6 col-lg-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-start">
                                <h4 class="card-title mb-0">Ganancias</h4>
                            </div>
                            <div class="pl-4 mb-5">
                                <div class="stats ct-charts position-relative" style="height: 315px;"></div>
                            </div>
                            <ul class="list-inline text-center mt-4 mb-0">
                                <li class="list-inline-item text-muted fst-italic">Ganancias de la semana $</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Actividad Reciente</h4>
                            <div class="mt-4 activity">
                                <div class="d-flex align-items-start border-left-line pb-3">
                                    <div>
                                        <a href="javascript:void(0)" class="btn btn-info btn-circle mb-2 btn-item">
                                            <i data-feather="shopping-cart"></i>
                                        </a>
                                    </div>
                                    <div class="ms-3 mt-2">
                                        <h5 class="text-dark font-weight-medium mb-2">Nuevo Combo vendido!</h5>
                                        <p class="font-14 mb-2 text-muted">Jose Perez a comprado pepito mixto
                                        </p>
                                        <span class="font-weight-light font-14 text-muted">Hace 10 min</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-start border-left-line pb-3">
                                    <div>
                                        <a href="javascript:void(0)"
                                            class="btn btn-danger btn-circle mb-2 btn-item">
                                            <i data-feather="message-square"></i>
                                        </a>
                                    </div>
                                    <div class="ms-3 mt-2">
                                        <h5 class="text-dark font-weight-medium mb-2">Nueva orden</h5>
                                        <p class="font-14 mb-2 text-muted">Felix a creado una orden</p>
                                        <span class="font-weight-light font-14 text-muted">Hace 4 hor</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-start border-left-line">
                                    <div>
                                        <a href="javascript:void(0)" class="btn btn-cyan btn-circle mb-2 btn-item">
                                            <i data-feather="bell"></i>
                                        </a>
                                    </div>
                                    <div class="ms-3 mt-2">
                                        <h5 class="text-dark font-weight-medium mb-2">Niveles bajos de stock!
                                        </h5>
                                        <p class="font-14 mb-2 text-muted">Solomo bajo en stock</p>
                                        <span class="font-weight-light font-14 mb-1 d-block text-muted">Hace 1 min</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-4">
                                <h4 class="card-title">Clientes Frecuentes</h4>
                            </div>
                            <div class="table-responsive">
                                <table class="table no-wrap v-middle mb-0">
                                    <thead>
                                        <tr class="border-0">
                                            <th class="border-0 font-14 font-weight-medium text-muted">Nombre
                                            </th>
                                            <th class="border-0 font-14 font-weight-medium text-muted px-2">Combo mas consumido
                                            </th>
                                            <th class="border-0 font-14 font-weight-medium text-muted">Reservacion</th>
                                            <th class="border-0 font-14 font-weight-medium text-muted text-center">
                                                Ultima Orden
                                            </th>
                                            <th class="border-0 font-14 font-weight-medium text-muted">Dinero gastado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="border-top-0 px-2 py-4">
                                                <div class="d-flex no-block align-items-center">
                                                    <div class="me-3">
                                                        <img
                                                            src="./assets/img/users/widget-table-pic1.jpg"
                                                            alt="user" class="rounded-circle" width="45"
                                                            height="45" />
                                                    </div>
                                                    <div class="">
                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">Hanna
                                                            Gover</h5>
                                                        <span class="text-muted font-14">04126742231</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="border-top-0 text-muted px-2 py-4 font-14">
                                                <img src="./assets/img/big/banner_login.png" alt="user" class="rounded-circle" width="60" height="60" />
                                                <img src="./assets/img/big/banner_login.png" alt="user" class="rounded-circle" width="60" height="60" />
                                                <img src="./assets/img/big/banner_login.png" alt="user" class="rounded-circle" width="60" height="60" />
                                            </td>
                                            <td class="border-top-0 px-2 py-4">
                                                <div class="popover-icon">
                                                    <a class="btn btn-danger rounded-circle btn-circle font-12 popover-item"
                                                        href="javascript:void(0)"></a>
                                                </div>
                                            </td>
                                            <td
                                                class="border-top-0 text-center font-weight-medium text-muted px-2 py-4">
                                                25/4/2024
                                            </td>
                                            <td class="font-weight-medium text-dark border-top-0 px-2 py-4">$96K
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="px-2 py-4">
                                                <div class="d-flex no-block align-items-center">
                                                    <div class="me-3"><img
                                                            src="./assets/img/users/widget-table-pic2.jpg"
                                                            alt="user" class="rounded-circle" width="45"
                                                            height="45" /></div>
                                                    <div class="">
                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">Daniel
                                                            Kristeen
                                                        </h5>
                                                        <span class="text-muted font-14">04126742231</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-muted px-2 py-4 font-14">
                                                <img src="./assets/img/big/banner_register.png" alt="user" class="rounded-circle" width="60" height="60" />

                                            </td>
                                            <td class="border-top-0 px-2 py-4">
                                                <div class="popover-icon">
                                                    <a class="btn btn-success rounded-circle btn-circle font-12 popover-item"
                                                        href="javascript:void(0)"></a>
                                                </div>
                                            </td>

                                            <td class="text-center text-muted font-weight-medium px-2 py-4">2/9/2024</td>
                                            <td class="font-weight-medium text-dark px-2 py-4">$85K</td>
                                        </tr>
                                        <tr>
                                            <td class="px-2 py-4">
                                                <div class="d-flex no-block align-items-center">
                                                    <div class="me-3"><img
                                                            src="./assets/img/users/widget-table-pic3.jpg"
                                                            alt="user" class="rounded-circle" width="45"
                                                            height="45" /></div>
                                                    <div class="">
                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">Julian
                                                            Josephs
                                                        </h5>
                                                        <span class="text-muted font-14">04126742231</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-muted px-2 py-4 font-14">
                                                <img src="./assets/img/big/banner_login.png" alt="user" class="rounded-circle" width="60" height="60" />
                                                <img src="./assets/img/big/banner_captcha.png" alt="user" class="rounded-circle" width="60" height="60" />

                                            </td>
                                            <td class="px-2 py-4">
                                                <div class="popover-icon">

                                                    <a class="btn btn-danger rounded-circle btn-circle font-12 popover-item"
                                                        href="javascript:void(0)"></a>
                                                </div>
                                            </td>
                                            <td class="text-center text-muted font-weight-medium px-2 py-4">30/11/2024</td>
                                            <td class="font-weight-medium text-dark px-2 py-4">$81K</td>
                                        </tr>
                                        <tr>
                                            <td class="border-bottom-0 px-2 py-4">
                                                <div class="d-flex no-block align-items-center">
                                                    <div class="me-3"><img
                                                            src="./assets/img/users/widget-table-pic4.jpg"
                                                            alt="user" class="rounded-circle" width="45"
                                                            height="45" /></div>
                                                    <div class="">
                                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">Jan
                                                            Petrovic
                                                        </h5>
                                                        <span class="text-muted font-14">04126742231</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="border-bottom-0 text-muted px-2 py-4 font-14">
                                                <img src="./assets/img/big/banner_login.png" alt="user" class="rounded-circle" width="60" height="60" />
                                                <img src="./assets/img/big/banner_register.png" alt="user" class="rounded-circle" width="60" height="60" />
                                                <img src="./assets/img/big/banner_captcha.png" alt="user" class="rounded-circle" width="60" height="60" />

                                            </td>
                                            <td class="border-top-0 px-2 py-4">
                                                <div class="popover-icon">
                                                    <a class="btn btn-danger rounded-circle btn-circle font-12 popover-item"
                                                        href="javascript:void(0)"></a>
                                                </div>
                                            </td>
                                            <td
                                                class="border-bottom-0 text-center text-muted font-weight-medium px-2 py-4">
                                                23</td>
                                            <td class="border-bottom-0 font-weight-medium text-dark px-2 py-4">$80K
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
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
<script src="./assets/libs/extra-libs/c3/d3.min.js"></script>
<script src="./assets/libs/extra-libs/c3/c3.min.js"></script>
<script src="./assets/libs/libs/chartist/dist/chartist.min.js"></script>
<script src="./assets/libs/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
<script defer src="./assets/js/pages/dashboards/dashboard1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/svg2pdf.js/dist/svg2pdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js" integrity="sha512-01CJ9/g7e8cUmY0DFTMcUw/ikS799FHiOA0eyHsUWfOetgbx/t6oV4otQ5zXKQyIrQGTHSmRVPIgrgLcZi/WMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
