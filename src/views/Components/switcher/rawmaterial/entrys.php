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
                            <table class="table table-dark-mode no-wrap">
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
                            <table class="table table-dark-mode no-wrap">
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
                            <table class="table table-dark-mode no-wrap">
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
                            <table class="table table-dark-mode no-wrap">
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