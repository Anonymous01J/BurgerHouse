import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { optionsSupplier, optionsRawMaterial, elementFormEntrysRawMaterial } = Templates()
const { InputPrice, selectOptionAll, viewImage, reindex, resetForm, setValidationStyles, validateField, fecha, reference, searchParam, diasRestantesFechaVencimiento, sessionInfo, binnacle, deleteDatatable, editDataTables, updateDataTables } = functionGeneral();
selectOptionAll(".select_options_supplier", "supplier", optionsSupplier)
selectOptionAll(".select_options_raw_material", "rawmaterial", optionsRawMaterial)
selectOptionAll(".select_options_supplier_edit", "supplier", optionsSupplier)
selectOptionAll(".select_options_raw_material_edit", "rawmaterial", optionsRawMaterial)

InputPrice("[input_price]")
viewImage(".input-image")
let session = await sessionInfo()
//setear valores de las tarjetas de entradas
const cardEntrys = async () => {
    let entrysTotales = await searchParam({}, "Entrada_materia_prima")
    let entrysVigentes = entrysTotales.filter((element) => diasRestantesFechaVencimiento(element) > 10 && element.existencia > 0);
    let entrysPorVencer = entrysTotales.filter((element) => diasRestantesFechaVencimiento(element) <= 10 && diasRestantesFechaVencimiento(element) > 0 && element.existencia > 0);
    let entrysVencidos = entrysTotales.filter((element) => diasRestantesFechaVencimiento(element) <= 0);
    let entrysSinStock = entrysTotales.filter((element) => element.existencia <= 0);

    document.querySelector(".entry-totales").innerHTML = entrysTotales.length;
    document.querySelector(".entrys-vigentes").innerHTML = entrysVigentes.length;
    document.querySelector(".entrys-por-vencer").innerHTML = entrysPorVencer.length;
    document.querySelector(".entrys-vencidas").innerHTML = entrysVencidos.length;
    document.querySelector(".entrys-sin-stock").innerHTML = entrysSinStock.length;
}
cardEntrys()
let tableActive = $(".table_entrys_active").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'Entrada_materia_prima/get_all/0/10000000/id/asc',
        dataSrc: function (json) {
            const EntrysActive = json.filter((element) => {
                let diasRestantes = diasRestantesFechaVencimiento(element)
                return diasRestantes > 10 && element.existencia > 0 && element.active == 1;
            });
            return EntrysActive;
        },
        type: 'POST',
    },
    columns: [
        { data: 'codigo' },
        { data: 'nombre_materia_prima' },
        { data: 'nombre_proveedor' },
        { data: null, render: function (data, type, row, meta) { return fecha(data.fecha_compra) } },
        { data: null, render: function (data, type, row, meta) { return fecha(data.fecha_vencimiento) } },
        { data: null, render: function (data, type, row, meta) { return data.cantidad + " " + data.nombre_unidad } },
        { data: null, render: function (data, type, row, meta) { return data.existencia + " " + data.nombre_unidad } },
        { data: null, render: function (data, type, row, meta) { return "$ " + data.precio_compra } },
        { data: null, render: function (data, type, row, meta) { return `<i data-feather="eye" data-module="Entrada_materia_prima" class="reference_btn" data-id="${data.id}" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#comprobante_view"></i>` } },
        {
            data: null,
            orderable: false,
            render: function (data, type, row, meta) {
                return `
                <button data-id="${data.id}" data-module-edit="Entrada_materia_prima" class="btn bh_1 rounded-circle btn-circle edit_btn_datatable" data-bs-toggle="modal" data-bs-target="#edit-entrys" data-bs-title="Editar Entrada" data-bs-placement="bottom">
                    <i data-feather="edit" class="text-white"></i>
                </button>
                <button data-id="${data.id}" data-module-delete="Entrada_materia_prima" class="btn bh_5 rounded-circle btn-circle trash_btn_datatable" data-bs-toggle="tooltip" data-bs-title="Eliminar Entrada" data-bs-placement="bottom">
                    <i data-feather="trash" class="text-white"></i>
                </button>
                `;
            }
        }
    ],
    drawCallback: function (settings) {
        feather.replace();
        reference("#comprobante_view", "entrada_materia_prima");
    },
    "dom": 'tipr',
    "paging": true,
    "info": true,
})
let tablePorVencer = $(".table_entrys_por_vencer").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'Entrada_materia_prima/get_all/0/10000000/id/asc',
        dataSrc: function (json) {
            const EntryPorVencer = json.filter((element) => {
                let diasRestantes = diasRestantesFechaVencimiento(element)
                return diasRestantes <= 10 && element.existencia > 0;
            });
            return EntryPorVencer;
        },
        type: 'POST',
    },
    columns: [
        { data: 'codigo' },
        { data: 'nombre_materia_prima' },
        { data: 'nombre_proveedor' },
        { data: null, render: function (data, type, row, meta) { return fecha(data.fecha_compra) } },
        { data: null, render: function (data, type, row, meta) { return fecha(data.fecha_vencimiento) } },
        { data: null, render: function (data, type, row, meta) { return data.cantidad + " " + data.nombre_unidad } },
        { data: null, render: function (data, type, row, meta) { return data.existencia + " " + data.nombre_unidad } },
        { data: null, render: function (data, type, row, meta) { return "$ " + data.precio_compra } },
        { data: null, render: function (data, type, row, meta) { return ` <a data-module="Entrada_materia_prima" class="reference_btn" data-id="${data.id}" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#comprobante_view">  <i data-feather="eye" class="text-white"></i></a> ` } },

    ],
    drawCallback: function (settings) {
        feather.replace();
        reference("#comprobante_view", "entrada_materia_prima");
    },
    "dom": 'tipr',
    "paging": true,
    "info": true,
})
let tableVencidas = $(".table_entrys_vencidos").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'Entrada_materia_prima/get_all/0/10000000/id/asc',
        dataSrc: function (json) {
            const EntryVencidas = json.filter((element) => {
                let diasRestantes = diasRestantesFechaVencimiento(element)
                return diasRestantes <= 0;
            });
            return EntryVencidas;
        },
        type: 'POST',
    },
    columns: [
        { data: 'codigo' },
        { data: 'nombre_materia_prima' },
        { data: 'nombre_proveedor' },
        { data: null, render: function (data, type, row, meta) { return fecha(data.fecha_compra) } },
        { data: null, render: function (data, type, row, meta) { return fecha(data.fecha_vencimiento) } },
        { data: null, render: function (data, type, row, meta) { return data.cantidad + " " + data.nombre_unidad } },
        { data: null, render: function (data, type, row, meta) { return data.existencia + " " + data.nombre_unidad } },
        { data: null, render: function (data, type, row, meta) { return "$ " + data.precio_compra } },
        { data: null, render: function (data, type, row, meta) { return ` <a data-module="Entrada_materia_prima" class="reference_btn" data-id="${data.id}" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#comprobante_view">  <i data-feather="eye" class="text-white"></i></a> ` } },

    ],
    drawCallback: function (settings) {
        feather.replace();
        reference("#comprobante_view", "entrada_materia_prima");
    },
    "dom": 'tipr',
    "paging": true,
    "info": true,
})
let tableSinStock = $(".table_entrys_sin_stock").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'Entrada_materia_prima/get_all/0/10000000/id/asc',
        dataSrc: function (json) {
            const EntrySinStock = json.filter((element) => {
                return element.existencia == 0;;
            });
            return EntrySinStock
        },
        type: 'POST',
    },
    columns: [
        { data: 'codigo' },
        { data: 'nombre_materia_prima' },
        { data: 'nombre_proveedor' },
        { data: null, render: function (data, type, row, meta) { return fecha(data.fecha_compra) } },
        { data: null, render: function (data, type, row, meta) { return fecha(data.fecha_vencimiento) } },
        { data: null, render: function (data, type, row, meta) { return data.cantidad + " " + data.nombre_unidad } },
        { data: null, render: function (data, type, row, meta) { return data.existencia + " " + data.nombre_unidad } },
        { data: null, render: function (data, type, row, meta) { return "$ " + data.precio_compra } },
        { data: null, render: function (data, type, row, meta) { return ` <a data-module="Entrada_materia_prima" class="reference_btn" data-id="${data.id}" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#comprobante_view">  <i data-feather="eye" class="text-white"></i></a> ` } },

    ],
    drawCallback: function (settings) {
        feather.replace();
        reference("#comprobante_view", "entrada_materia_prima");
    },
    "dom": 'tipr',
    "paging": true,
    "info": true,
})
$('#searchEntrysActive').on('keyup', function () { tableActive.search(this.value).draw() });
$('#searchEntrysPorVencer').on('keyup', function () { tablePorVencer.search(this.value).draw() });
$('#searchEntrysVencidos').on('keyup', function () { tableVencidas.search(this.value).draw() });
$('#searchEntrysSinStock').on('keyup', function () { tableSinStock.search(this.value).draw() });
deleteDatatable(".table_entrys_active", tableActive, () => binnacle(session.message.id, "Entrada de Materia Prima", "Eliminacion", "Se ha eliminado una Entrada de Materia Prima"))

let entrysCount = 1;
function addEntrys() {
    entrysCount++;
    document.getElementById("entrys-container").insertAdjacentHTML('beforeend', elementFormEntrysRawMaterial(entrysCount));
    feather.replace();
    selectOptionAll(".select_options_supplier", "supplier", optionsSupplier)
    selectOptionAll(".select_options_raw_material", "rawmaterial", optionsRawMaterial)

    attachValidationListeners(entrysCount);

    const newEntry = document.getElementById(`entrys-${entrysCount}`);
    newEntry.querySelector(".remove-entry").addEventListener("click", function () {
        newEntry.remove();
        reindex("#entrys-container .entrys", "entrys", entrysCount, "Entrada");
    });
}
function attachValidationListeners(index) {
    const row = document.getElementById(`entrys-${index}`);
    row.querySelectorAll("input[type='text'], input[type='file'], input[type='date'], input[type='button']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
        input.addEventListener("change", (e) => validateField(e, rules));
    })
    const rowedit = document.querySelectorAll(`.entry`);
    rowedit.forEach(row => {
        row.querySelectorAll("input[type='text'], input[type='file'], input[type='date'], input[type='button']").forEach(input => {
            input.addEventListener("keyup", (e) => validateField(e, rules2));
            input.addEventListener("blur", (e) => validateField(e, rules2));
            input.addEventListener("change", (e) => validateField(e, rules2));
        })
    })
}
document.getElementById("add-entrys-btn").addEventListener("click", () => {
    addEntrys();
    reindex("#entrys-container .entrys", "entrys", entrysCount, "Entrada");
});
validate.extend(validate.validators.datetime, {
    parse: function (value) {
        return Date.parse(value) || NaN;
    },
    format: function (value, options) {
        return new Date(value).toISOString().split("T")[0]; // Formato YYYY-MM-DD
    }
});
validate.validators.validateCategoryAndRecipe = function (value, options, key, attributes) {
    if (!value) {
        return options.message || "es requerido";
    }
    if (value.toLowerCase() === "seleccione una opcion") {
        return options.message || "es requerido";
    }
};
validate.validators.precio = function (value, options, key, attributes) {
    if (!value) return;
    const cleanValue = value.replace(/\./g, '').replace(',', '.');
    const numberValue = parseFloat(cleanValue);

    if (isNaN(numberValue)) {
        return options.message || "no es un número válido";
    }
    if (numberValue <= 0) {
        return options.message || "debe ser un número mayor a 0";
    }
};
const rules = {
    precio: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        precio: { message: "^debe ser un número mayor a 0" }
    },
    codigo: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
    },
    id_materia_prima: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        validateCategoryAndRecipe: { message: "^es requerido" }
    },
    id_proveedor: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        validateCategoryAndRecipe: { message: "^es requerido" }
    },
    imagen: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        }
    },
    cantidad: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        precio: { message: "^debe ser un número mayor a 0" }
    },
    fecha_vencimiento: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        datetime: {
            dateOnly: true,
            earliest: new Date(),
            message: "^Debe ser una fecha válida"
        }
    },
    referencia: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
    }
};
const rules2 = {
    precio: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        precio: { message: "^debe ser un número mayor a 0" }
    },
    codigo: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
    },
    id_materia_prima: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        validateCategoryAndRecipe: { message: "^es requerido" }
    },
    id_proveedor: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        validateCategoryAndRecipe: { message: "^es requerido" }
    },
    cantidad: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        precio: { message: "^debe ser un número mayor a 0" }
    },
    fecha_vencimiento: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        datetime: {
            dateOnly: true,
            earliest: new Date(),
            message: "^Debe ser una fecha válida"
        }
    },
    referencia: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
    }
};
let form = document.getElementById("form-submit-entrys")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", function (e) {
        e.preventDefault();
        const entry = document.querySelectorAll(".entrys");
        let formHasError = false;
        let entrysData = []

        entry.forEach((entry, i) => {
            const index = i + 1;
            const data = {
                codigo: entry.querySelector(`input[name="codigo"]`).value,
                precio: entry.querySelector(`input[name="precio"]`).value.replace(/\./g, '').replace(',', '.'),
                id_materia_prima: entry.querySelector(`input[name="id_materia_prima"]`).getAttribute("data-id"),
                id_proveedor: entry.querySelector(`input[name="id_proveedor"]`).getAttribute("data-id"),
                cantidad: entry.querySelector(`input[name="cantidad"]`).value.replace(/\./g, '').replace(',', '.'),
                imagen: entry.querySelector(`input[name="imagen"]`) ? entry.querySelector(`input[name="imagen"]`).files[0] : "",
                fecha_vencimiento: entry.querySelector(`input[name="fecha_vencimiento"]`).value,
                referencia: entry.querySelector(`input[name="referencia"]`).value,
            };
            entrysData.push(data)

            const errors = validate(data, rules);
            setValidationStyles(`input-code-entrys-${index}`, errors?.codigo ? errors.codigo[0] : null);
            setValidationStyles(`input-price-entrys-${index}`, errors?.precio ? errors.precio[0] : null);
            setValidationStyles(`input-rawmaterial-entrys-${index}`, errors?.id_materia_prima ? errors.id_materia_prima[0] : null);
            setValidationStyles(`input-supplier-entrys-${index}`, errors?.id_proveedor ? errors.id_proveedor[0] : null);
            setValidationStyles(`input-image-entrys-${index}`, errors?.imagen ? errors.imagen[0] : null);
            setValidationStyles(`input-quantity-entrys-${index}`, errors?.cantidad ? errors.cantidad[0] : null);
            setValidationStyles(`input-date-entrys-${index}`, errors?.fecha_vencimiento ? errors.fecha_vencimiento[0] : null);
            setValidationStyles(`input-ref-entrys-${index}`, errors?.referencia ? errors.referencia[0] : null);
            if (errors) {
                formHasError = true;
            }
        });

        if (!formHasError) {
            let data = new FormData()
            entrysData.forEach((entry, index) => {
                data.append(`lista[${index}][codigo]`, entry.codigo);
                data.append(`lista[${index}][precio_compra]`, entry.precio);
                data.append(`lista[${index}][cantidad]`, entry.cantidad);
                data.append(`lista[${index}][existencia]`, entry.cantidad);
                data.append(`lista[${index}][fecha_vencimiento]`, entry.fecha_vencimiento);
                data.append(`lista[${index}][id_materia_prima]`, entry.id_materia_prima);
                data.append(`lista[${index}][id_proveedor]`, entry.id_proveedor);
                data.append(`lista[${index}][imagen_name]`, entry.imagen.name);
                data.append(`lista[${index}][imagen]`, entry.imagen);
                data.append(`lista[${index}][referencia]`, entry.referencia);
            })
            let send = async () => {
                let pet = await fetch(`Entrada_materia_prima/add_many`, {
                    method: "POST",
                    body: data,
                })
                let response = await pet.json()
                if (response.success == true) {
                    Swal.fire({
                        title: `Exito!`,
                        text: "El elemento fue agregado correctamente",
                        icon: "success",
                    });
                    tableActive.ajax.reload();
                    tablePorVencer.ajax.reload();
                    tableVencidas.ajax.reload();
                    tableSinStock.ajax.reload();
                    cardEntrys()
                    binnacle(session.message.id, "Entradas", "Agregado", "Se ha agregado una entrada de materia prima")
                } else {
                    Swal.fire({
                        title: `Error!`,
                        text: "El elemento no fue agregado",
                        icon: "error",
                    });
                }
            }
            send()
            resetForm("#entrys-container .entrys", form)
            bootstrap.Modal.getOrCreateInstance('#register-entrys').hide()
        }
    });
    form.dataset.listenerAttached = "true";
}
editDataTables(".table_entrys_active", (response) => {
    let formHasError = false;
    document.getElementById("input-code-entry").value = response[0].codigo;
    document.getElementById("input-rawmaterial-entry").value = response[0].nombre_materia_prima;
    document.getElementById("input-rawmaterial-entry").setAttribute("data-id", response[0].id_materia_prima);
    document.getElementById("input-supplier-entry").value = response[0].nombre_proveedor;
    document.getElementById("input-supplier-entry").setAttribute("data-id", response[0].id_proveedor);
    document.getElementById("input-price-entry").value = response[0].precio_compra.toString().replace(/\./g, ',');
    document.querySelector(".type_unit_edit").textContent = response[0].nombre_unidad.toString().replace(/\./g, ',');
    document.getElementById("input-quantity-entry").value = response[0].cantidad.toString().replace(/\./g, ',');
    document.getElementById("input-date-entry").value = new Date(response[0].fecha_vencimiento).toISOString().split('T')[0];
    document.getElementById("input-ref-entry").value = response[0].referencia;
    document.getElementById("img-entry-response").src = `media/entrada_materia_prima/${response[0].comprobante}`;
    let data = {
        codigo: document.querySelector(`#input-code-entry`).value,
        precio: document.querySelector(`#input-price-entry`).value.replace(/\./g, '').replace(',', '.'),
        id_materia_prima: document.querySelector(`#input-rawmaterial-entry`).getAttribute("data-id") ? document.querySelector(`#input-rawmaterial-entry`).getAttribute("data-id") : "",
        id_proveedor: document.querySelector(`#input-supplier-entry`).getAttribute("data-id") ? document.querySelector(`#input-supplier-entry`).getAttribute("data-id") : "",
        cantidad: document.querySelector(`#input-quantity-entry`).value.replace(/\./g, '').replace(',', '.'),
        fecha_vencimiento: document.querySelector(`#input-date-entry`).value,
        referencia: document.querySelector(`#input-ref-entry`).value,
    }
    const errors = validate(data, rules2);
    setValidationStyles(`input-code-entry`, errors?.codigo ? errors.codigo[0] : null);
    setValidationStyles(`input-price-entry`, errors?.precio ? errors.precio[0] : null);
    setValidationStyles(`input-rawmaterial-entry`, errors?.id_materia_prima ? errors.id_materia_prima[0] : null);
    setValidationStyles(`input-supplier-entry`, errors?.id_proveedor ? errors.id_proveedor[0] : null);
    setValidationStyles(`input-quantity-entry`, errors?.cantidad ? errors.cantidad[0] : null);
    setValidationStyles(`input-date-entry`, errors?.fecha_vencimiento ? errors.fecha_vencimiento[0] : null);
    setValidationStyles(`input-ref-entry`, errors?.referencia ? errors.referencia[0] : null);
    if (errors) formHasError = true;
    console.log(formHasError);
    let formEdit = document.getElementById("form-submit-edit-entry")
    if (!formEdit.dataset.listenerAttached) {
        formEdit.addEventListener("submit", (e) => {
            e.preventDefault()
            let data = {
                codigo: document.querySelector(`#input-code-entry`).value,
                precio: document.querySelector(`#input-price-entry`).value.replace(/\./g, '').replace(',', '.'),
                id_materia_prima: document.querySelector(`#input-rawmaterial-entry`).getAttribute("data-id") ? document.querySelector(`#input-rawmaterial-entry`).getAttribute("data-id") : "",
                id_proveedor: document.querySelector(`#input-supplier-entry`).getAttribute("data-id") ? document.querySelector(`#input-supplier-entry`).getAttribute("data-id") : "",
                cantidad: document.querySelector(`#input-quantity-entry`).value.replace(/\./g, '').replace(',', '.'),
                fecha_vencimiento: document.querySelector(`#input-date-entry`).value,
                referencia: document.querySelector(`#input-ref-entry`).value,
            }
            const errors = validate(data, rules2);
            setValidationStyles(`input-code-entry`, errors?.codigo ? errors.codigo[0] : null);
            setValidationStyles(`input-price-entry`, errors?.precio ? errors.precio[0] : null);
            setValidationStyles(`input-rawmaterial-entry`, errors?.id_materia_prima ? errors.id_materia_prima[0] : null);
            setValidationStyles(`input-supplier-entry`, errors?.id_proveedor ? errors.id_proveedor[0] : null);
            setValidationStyles(`input-quantity-entry`, errors?.cantidad ? errors.cantidad[0] : null);
            setValidationStyles(`input-date-entry`, errors?.fecha_vencimiento ? errors.fecha_vencimiento[0] : null);
            setValidationStyles(`input-ref-entry`, errors?.referencia ? errors.referencia[0] : null);
            if (errors) formHasError = true;
            else formHasError = false;

            if (!formHasError) {
                let dataFinal = new FormData()
                dataFinal.append("codigo", data.codigo)
                dataFinal.append("precio_compra", data.precio)
                dataFinal.append("id_materia_prima", data.id_materia_prima)
                dataFinal.append("id_proveedor", data.id_proveedor)
                dataFinal.append("cantidad", data.cantidad)
                dataFinal.append("existencia", data.cantidad)
                dataFinal.append("fecha_vencimiento", data.fecha_vencimiento)
                dataFinal.append("referencia", data.referencia)
                dataFinal.append("id", response[0].id)
                if (document.getElementById("input-image-entry").value != "") {
                    dataFinal.append("imagen", document.getElementById("input-image-entry").files[0])
                    dataFinal.append("imagen_name", document.getElementById("input-image-entry").files[0].name)
                }
                updateDataTables(tableActive, dataFinal, "Entrada_materia_prima", () => binnacle(session.message.id, "Entrada de Materia Prima", "Actualizacion", "Se actualizo una Entrada de Materia Prima"))
                bootstrap.Modal.getOrCreateInstance('#edit-entrys').hide()
            }
        })
        formEdit.dataset.listenerAttached = "true"
    }
})
attachValidationListeners(1)