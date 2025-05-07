const modulesConfig = {
    mesas: {
        ajax: {
            dataSrc: '',
            url: 'table/get_all/0/10000000/id/asc',
            type: 'POST',
            data: { active: 0 },
        },
        columns: [
            { title: 'ID', data: 'id' },
            { title: 'Imagen', data: null, render: (data) => `<img src='${"media/mesas/" + data.imagen}' width='50px' height='50px'>` },
            { title: 'Nombre', data: 'nombre' },
            { title: 'Sillas', data: 'sillas' },
            {
                title: 'Acciones',
                data: null,
                orderable: false,
                render: (data) => `
                <button data-id="${data.id}" data-module-restore="table" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Mesa" data-bs-placement="bottom">
                    <i data-feather="refresh-ccw" class="text-white"></i>
                </button>`
            }
        ]
    },
    combo: {
        ajax: {
            url: 'combo/get_all/0/10000000/id/asc',
            dataSrc: '',
            type: 'POST',
            data: {
                active: 0
            }
        },
        columns: [
            { title: '', data: null, render: (data) => `<img src='${data.imagen ? "media/combos/" + data.imagen : "./assets/img/big/banner_login.png"}' width='50px' height='50px'>` },
            { title: 'Nombre', data: 'nombre' },
            { title: 'Precio', data: 'precio' },
            {
                title: 'Acciones',
                data: null,
                render: (data) =>
                    `
                <button data-id="${data.id}" data-module-restore="combo" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Combo" data-bs-placement="bottom">
                    <i data-feather="refresh-ccw" class="text-white"></i>
                </button>
                `
            }
        ]
    },
    Proveedores: {
        ajax: {
            url: 'supplier/get_all/0/10000000/id/asc',
            dataSrc: '',
            type: 'POST',
            data: {
                active: 0
            }
        },
        columns: [
            { title: 'ID', data: 'id' },
            { title: 'Nombre', data: 'nombre' },
            { title: 'Razon Social', data: 'razon_social' },
            {
                title: 'Acciones',
                data: null,
                render: (data) =>
                    `
                  <button data-id="${data.id}" data-module-restore="supplier" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Proveedor" data-bs-placement="bottom">
                      <i data-feather="refresh-ccw" class="text-white"></i>
                  </button>
                  `
            }
        ]
    },
    Clientes: {
        ajax: {
            url: 'clients/get_all/0/10000000/id/asc',
            dataSrc: '',
            type: 'POST',
            data: {
                active: 0
            }
        },
        columns: [
            { title: 'ID', data: 'id' },
            { title: 'Nombre', data: 'nombre' },
            { title: 'Documento', data: 'documento' },
            {
                title: 'Acciones',
                data: null,
                render: (data) =>
                    `
                <button data-id="${data.id}" data-module-restore="clients" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Cliente" data-bs-placement="bottom">
                    <i data-feather="refresh-ccw" class="text-white"></i>
                </button>
                `
            }
        ]
    },
    Unidades: {
        ajax: {
            url: 'units/get_all/0/10000000/id/asc',
            dataSrc: '',
            type: 'POST',
            dataSrc: '',
            data: {
                active: 0
            }
        },
        columns: [
            { title: 'ID', data: 'id' },
            { title: 'Nombre', data: 'nombre' },
            { title: 'Alias', data: 'alias' },
            {
                title: 'Acciones',
                data: null,
                render: (data) =>
                    `
                <button data-id="${data.id}" data-module-restore="units" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Unidad" data-bs-placement="bottom">
                    <i data-feather="refresh-ccw" class="text-white"></i>
                </button>
                `
            }
        ]
    },
    materia_prima: {
        ajax: {
            url: 'rawmaterial/get_all/0/10000000/id/asc',
            dataSrc: '',
            type: 'POST',
            dataSrc: '',
            data: {
                active: 0
            }
        },
        columns: [
            { title: 'ID', data: 'id' },
            { title: 'Nombre', data: 'nombre' },
            { title: 'Categoria', data: 'nombre_categoria' },
            { title: 'Unidad', data: 'alias_unidad' },
            { title: 'Stock Min', data: 'stock_min' },
            { title: 'StocK Max', data: 'stock_max' },
            { title: 'existencia', data: 'existencia' },
            {
                title: 'Acciones',
                data: null,
                render: (data) =>
                    `
                <button data-id="${data.id}" data-module-restore="rawmaterial" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Unidad" data-bs-placement="bottom">
                    <i data-feather="refresh-ccw" class="text-white"></i>
                </button>
                `
            }
        ]
    },
    Categoria_combo: {
        ajax: {
            url: 'categoryProducto/get_all/0/10000000/id/asc',
            dataSrc: '',
            type: 'POST',
            data: {
                active: 0
            }
        },
        columns: [
            { title: 'ID', data: 'id' },
            { title: 'Nombre', data: 'nombre' },
            {
                title: 'Acciones',
                data: null,
                render: (data) =>
                    `
                  <button data-id="${data.id}" data-module-restore="categoryProducto" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Categoria" data-bs-placement="bottom">
                      <i data-feather="refresh-ccw" class="text-white"></i>
                  </button>
                  `
            }
        ]
    },
    Categoria_rawmaterial: {
        ajax: {
            url: 'categoryMateriaPrima/get_all/0/10000000/id/asc',
            dataSrc: '',
            type: 'POST',
            data: {
                active: 0
            }
        },
        columns: [
            { title: 'ID', data: 'id' },
            { title: 'Nombre', data: 'nombre' },
            {
                title: 'Acciones',
                data: null,
                render: (data) =>
                    `
                <button data-id="${data.id}" data-module-restore="categoryMateriaPrima" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Categoria" data-bs-placement="bottom">
                    <i data-feather="refresh-ccw" class="text-white"></i>
                </button>
                `
            }
        ]
    },
    Metodos_pago: {
        ajax: {
            url: 'paymentMethod/get_all/0/10000000/id/asc',
            dataSrc: '',
            type: 'POST',
            data: {
                active: 0
            }
        },
        columns: [
            { title: 'ID', data: 'id' },
            { title: 'Nombre', data: 'nombre' },
            {
                title: 'Acciones',
                data: null,
                render: (data) =>
                    `
                <button data-id="${data.id}" data-module-restore="paymentMethod" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Metodo de pago" data-bs-placement="bottom">
                    <i data-feather="refresh-ccw" class="text-white"></i>
                </button>
                `
            }
        ]
    },
    Roles: {
        ajax: {
            url: 'rol/get_all/0/10000000/id/asc',
            dataSrc: '',
            type: 'POST',
            data: {
                active: 0
            }
        },
        columns: [
            { title: 'ID', data: 'id' },
            { title: 'Nombre', data: 'nombre' },
            { title: 'Descripcion', data: 'descripcion' },
            {
                title: 'Acciones',
                data: null,
                render: (data) =>
                    `
                <button data-id="${data.id}" data-module-restore="rol" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Rol" data-bs-placement="bottom">
                    <i data-feather="refresh-ccw" class="text-white"></i>
                </button>
                `
            }
        ]
    },
    Usuarios: {
        ajax: {
            url: 'users/get_all/0/10000000/id/asc',
            dataSrc: '',
            type: 'POST',
            data: {
                active: 0
            }
        },
        columns: [
            { title: 'ID', data: 'id' },
            { title: 'Nombre', data: 'nombre' + " " + "apellido" },
            { title: 'Documento', data: 'documento' },
            { title: 'Correo', data: 'email' },
            { title: 'Descripcion', data: 'descripcion' },
            {
                title: 'Acciones',
                data: null,
                render: (data) =>
                    `
                <button data-id="${data.id}" data-module-restore="users" class="btn bh_1 rounded-circle btn-circle btn_datatable_restore" data-bs-toggle="tooltip" data-bs-title="Restaurar Usuario" data-bs-placement="bottom">
                    <i data-feather="refresh-ccw" class="text-white"></i>
                </button>
                `
            }
        ]
    },
};

let table;

function initTable(moduleKey) {
    const config = modulesConfig[moduleKey];
    if (!config) {
        $('.table_trash').hide();
        return;
    }
    $('.table_trash').show();

    // Destruye y limpia DOM si ya había otra tabla
    if ($.fn.DataTable.isDataTable('.table_trash')) {
        $('.table_trash').DataTable().destroy();
        $('.table_trash thead').empty();
        $('.table_trash tbody').empty();
    }
    $('.table_trash thead').empty();
    $('.table_trash tbody').empty();
    // Reconstruye <thead>
    $('.table_trash thead').append('<tr></tr>');
    config.columns.forEach(col => {
        $('.table_trash thead tr').append(`<th>${col.title}</th>`);
    });

    // Inicializa DataTable con destroy automático
    table = $('.table_trash').DataTable({
        destroy: true,
        ajax: config.ajax,
        columns: config.columns,
        language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
        drawCallback: function () {
            feather.replace();
            document.querySelectorAll(".btn_datatable_restore")
                .forEach(btn => new bootstrap.Tooltip(btn));
        },
        dom: 'tipr',
        paging: true,
        info: true,
        serverSide: !!config.serverSide,
        processing: !!config.serverSide
    });

    $('#SearchTrash').on('keyup', function () {
        table.search(this.value).draw();
    });

    // Evento de restaurar
    $('.table_trash tbody').off('click', 'button.btn_datatable_restore').on('click', 'button.btn_datatable_restore', function () {
        Swal.fire({
            title: "¿Deseas Restaurar este elemento?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Restaurar",
            cancelButtonText: "Cancelar",
            confirmButtonColor: "#FF4B00",
        }).then((result) => {
            if (result.isConfirmed) {
                const id = this.getAttribute('data-id');
                const module = this.getAttribute('data-module-restore');
                $.ajax({
                    type: "POST",
                    url: `${module}/update`,
                    data: { id, active: 1 },
                    success: function (response) {
                        if (response.success == true) {
                            Swal.fire({
                                title: `Exito!`,
                                text: "El elemento fue restaurado correctamente",
                                icon: "success",
                            });
                            table.ajax.reload();
                        } else {
                            Swal.fire({
                                title: `Error!`,
                                text: "El elemento no fue restaurado",
                                icon: "error",
                            });
                        }
                    }
                });
            }
        });
    });
}


let select = document.querySelector(".select_options_module")
let options = select.querySelectorAll(".dropdown-item")

options.forEach((option) => {
    option.addEventListener("click", () => {
        let moduleKey = option.getAttribute("data-key");
        let moduleName = option.textContent;
        select.querySelector("input[type='button']").value = moduleName
        initTable(moduleKey);
    });
});

initTable("mesas");