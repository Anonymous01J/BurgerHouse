<?php include_once __DIR__ . '/../Views/Components/header.php' ?>
<?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>

<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">


    <?php include_once __DIR__ . '/../Views/Components/topBar.php' ?>

    <?php include_once __DIR__ . '/../Views/Components/aside.php' ?>


    <div class="page-wrapper">

        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-md-8 align-self-center">
                    <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Capital</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html" class="text-muted">Aplicaciones</a></li>
                                <li class="breadcrumb-item text-muted active" aria-current="page">Capital</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                
                <?php include_once __DIR__ . '/../Views/Components/BoxAndDolar.php' ?>

            </div>
        </div>

        <div class="container-fluid">


            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 col-lg-5">
                                    <form>
                                        <div class="mb-3">
                                            <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Monto" aria-describedby="emailHelp">
                                        </div>
                                        <div class="mb-3">
                                            <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Descripcion" rows="4"></textarea>
                                        </div>
                                        <div class="mb-4">
                                            <button type="submit" class="btn bh_5" style="color: #fff;">Guardar Gasto</button>
                                            <button type="submit" class="btn bh_1" style="color: #fff;">Guardar Ingreso</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-7">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_1BG text-center">
                                                    <h1 class="font-light text-white">2,064 Bs</h1>
                                                    <h6 class="text-white">Ingresos</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg-6 col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_2 text-center">
                                                    <h1 class="font-light text-white">1,738 Bs</h1>
                                                    <h6 class="text-white">Ventas</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg-6 col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_4 text-center">
                                                    <h1 class="font-light text-white">1100 Bs</h1>
                                                    <h6 class="text-white">Gastos</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Column -->
                                        <div class="col-md-6 col-lg-6 col-xlg-3">
                                            <div class="card card-hover">
                                                <div class="p-2 bh_5BG text-center">
                                                    <h1 class="font-light text-white">964 Bs</h1>
                                                    <h6 class="text-white">Utilidad Neta</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="mt-4">
                                <h2 class="mb-4">Movientos de capital</h2>
                                <div class="table-responsive">
                                    <table class="table no-wrap table-dark-mode">
                                        <thead>
                                            <tr>
                                                <th>Descripcion</th>
                                                <th>Monto</th>
                                                <th>Fecha</th>
                                                <th>Hora</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    Egreso por nuevas entradas
                                                </td>
                                                <td><span class="fs-6">200 Bs</span></td>
                                                <td>13-3-2025</td>
                                                <td>13:40</td>
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

<script src="./assets/libs/libs/jquery/dist/jquery.min.js"></script>
<script src="./assets/libs/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script src="./assets/js/app-style-switcher.js"></script>
<script src="./assets/js/feather.min.js"></script>
<script src="./assets/libs/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="./assets/js/sidebarmenu.js"></script>
<script src="./assets/js/custom.min.js"></script>


<?php include_once __DIR__ . '/../Views/Components/footer.php' ?>