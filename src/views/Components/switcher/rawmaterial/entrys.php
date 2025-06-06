<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <!-- Column -->
                    <div class="col-md-6 col-lg col-xlg-3">
                        <div class="card card-hover">
                            <div class="p-2 bh_5BG text-center">
                                <h1 class="font-light text-white entry-totales">0</h1>
                                <h6 class="text-white">Entradas Totales</h6>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-md-6 col-lg col-xlg-3">
                        <div class="card card-hover">
                            <div class="p-2 bh_1BG text-center">
                                <h1 class="font-light text-white entrys-vigentes">0</h1>
                                <h6 class="text-white">En vigencia</h6>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-md-6 col-lg col-xlg-3">
                        <div class="card card-hover">
                            <div class="p-2 bh_2 text-center">
                                <h1 class="font-light text-white entrys-por-vencer">0</h1>
                                <h6 class="text-white">Por vencer</h6>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-md-6 col-lg col-xlg-3">
                        <div class="card card-hover">
                            <div class="p-2 bh_4 text-center">
                                <h1 class="font-light text-white entrys-vencidas">0</h1>
                                <h6 class="text-white">Vencidas</h6>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-md-6 col-lg col-xlg-3">
                        <div class="card card-hover">
                            <div class="p-2 bh_5BG text-center">
                                <h1 class="font-light text-white entrys-sin-stock">0</h1>
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
                        <div class="d-flex gap-4 mt-4">
                            <div class="col-md-6 col-lg-3">
                                <input type="search" class="form-control" id="searchEntrysActive" placeholder="Buscar">
                            </div>
                        </div>
                        <div class="table-responsive mt-4">
                            <table class="table table-dark-mode no-wrap w-100 table_entrys_active">
                                <thead>
                                    <tr>
                                        <th>Cod.</th>
                                        <th>M.Prima</th>
                                        <th>Provee.</th>
                                        <th>F.COMP</th>
                                        <th>F.VENC</th>
                                        <th>Cant</th>
                                        <th>Exis.</th>
                                        <th>P.COMPRA</th>
                                        <th>C.PAGO</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="porVencer-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                        <div class="d-flex gap-4 mt-4">
                            <div class="col-md-6 col-lg-3">
                                <input type="search" class="form-control" id="searchEntrysPorVencer" placeholder="Buscar">
                            </div>
                        </div>
                        <div class="table-responsive mt-4">
                            <table class="table table-dark-mode no-wrap w-100 table_entrys_por_vencer">
                                <thead>
                                    <tr>
                                        <th>Cod.</th>
                                        <th>M.Prima</th>
                                        <th>Provee.</th>
                                        <th>F.COMP</th>
                                        <th>F.VENC</th>
                                        <th>Cant</th>
                                        <th>Exis.</th>
                                        <th>P.COMPRA</th>
                                        <th>C.PAGO</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="vencidos-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                        <div class="d-flex gap-4 mt-4">
                            <div class="col-md-6 col-lg-3">
                                <input type="search" class="form-control" id="searchEntrysVencidos" placeholder="Buscar">
                            </div>
                        </div>
                        <div class="table-responsive mt-4">
                            <table class="table table-dark-mode no-wrap w-100 table_entrys_vencidos">
                                <thead>
                                    <tr>
                                        <th>Cod.</th>
                                        <th>M.Prima</th>
                                        <th>Provee.</th>
                                        <th>F.COMP</th>
                                        <th>F.VENC</th>
                                        <th>Cant</th>
                                        <th>Exis.</th>
                                        <th>P.COMPRA</th>
                                        <th>C.PAGO</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="sinStock-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                        <div class="d-flex gap-4 mt-4">
                            <div class="col-md-6 col-lg-3">
                                <input type="search" class="form-control" id="searchEntrysSinStock" placeholder="Buscar">
                            </div>
                        </div>
                        <div class="table-responsive mt-4">
                            <table class="table table-dark-mode no-wrap w-100 table_entrys_sin_stock">
                                <thead>
                                    <tr>
                                        <th>Cod.</th>
                                        <th>M.Prima</th>
                                        <th>Provee.</th>
                                        <th>F.COMP</th>
                                        <th>F.VENC</th>
                                        <th>Cant</th>
                                        <th>Exis.</th>
                                        <th>P.COMPRA</th>
                                        <th>C.PAGO</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>