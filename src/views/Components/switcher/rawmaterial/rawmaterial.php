<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="d-flex gap-4 align-items-center">
                    <div class="col-md-6 col-lg-3">
                        <input type="search" class="form-control" id="searchRawmaterial" placeholder="Buscar">
                    </div>
                    <button type="button" class="btn bh_1 btn-circle text-white btn-add-tooltip" data-module-add="Materia prima" data-bs-toggle="modal" data-bs-target="#register-rawMaterial" data-bs-title="Agregar unidad" data-bs-placement="top">
                        <i data-feather="plus" class="svg-icon"></i>
                    </button>
                    <button data-bs-toggle="tooltip" type="button" class="btn bh_1 btn-circle text-white" data-bs-title="Reporte de inventario" data-bs-placement="top" id="btn-report">
                        <i data-feather="file-minus" class="svg-icon"></i>
                    </button>
                </div>
                <div class="table-responsive mt-3">
                    <table class="table table-dark-mode no-wrap table_rawmaterial w-100">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Categoria</th>
                                <th>Unidad</th>
                                <th>Stock Minimo</th>
                                <th>Stock Maximo</th>
                                <th>Existencia</th>
                                <th>Acciones</th>
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