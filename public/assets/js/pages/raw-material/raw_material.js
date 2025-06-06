import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";

const { validateField, setValidationStyles, selectOptionAll, reindex, resetForm, addDataTables, deleteDatatable, editDataTables, updateDataTables, sessionInfo, binnacle } = functionGeneral();
const { elemenFormRawMaterial, optionsRol } = Templates()
let session = await sessionInfo()
selectOptionAll(".select_options_categorys_rawmaterial", "categoryMateriaPrima", optionsRol)
selectOptionAll(".select_options_units_rawmaterial", "units", optionsRol)
selectOptionAll(".select_options_categorys_rawmaterial_edit", "categoryMateriaPrima", optionsRol)
selectOptionAll(".select_options_units_rawmaterial_edit", "units", optionsRol)

let n = $(".table_rawmaterial").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'rawmaterial/get_all/0/10000000/id/asc',
        dataSrc: '',
        type: 'POST',
        data: {active: 1,},
    },
    columns: [
        { data: 'nombre' },
        { data: 'nombre_categoria' },
        { data: 'alias_unidad' },
        { data: 'stock_min' },
        { data: 'stock_max' },
        { data: 'existencia' },
        {
            data: null,
            orderable: false,
            render: function (data, type, row, meta) {
                return `
                <button data-id="${data.id}" data-module-edit="rawmaterial" class="btn bh_1 rounded-circle btn-circle edit_btn_datatable" data-bs-toggle="modal" data-bs-target="#edit-rawMaterial" data-bs-title="Editar Materia Prima" data-bs-placement="bottom">
                    <i data-feather="edit" class="text-white"></i>
                </button>
                <button data-id="${data.id}" data-module-delete="rawmaterial" class="btn bh_5 rounded-circle btn-circle trash_btn_datatable" data-bs-toggle="tooltip" data-bs-title="Eliminar Materia Prima" data-bs-placement="bottom">
                    <i data-feather="trash" class="text-white"></i>
                </button>
`;
            }
        }
    ],
    drawCallback: function (settings) {
        feather.replace();
        document.querySelectorAll(".trash_btn_datatable, .edit_btn_datatable").forEach((btn) => {
            let tooltip = new bootstrap.Tooltip(btn)
        })
    },
    "dom": 'tipr',
    "paging": true,
    "info": true,
})
$('#searchRawmaterial').on('keyup', function () {
    n.search(this.value).draw();
});
deleteDatatable(".table_rawmaterial", n, () => binnacle(session.message.id, "Materia Prima", "Eliminacion", "Se ha eliminado una Materia Prima"))
// ------------------Funcion de select de categoria y receta---------------------------

// ------------------Validaciones---------------------------
let RawmaterialCount = 1;
function addRawMaterial() {
    RawmaterialCount++;
    document.getElementById("rawmaterials-container").insertAdjacentHTML('beforeend', elemenFormRawMaterial(RawmaterialCount));
    feather.replace();
    selectOptionAll(".select_options_categorys_rawmaterial", "categoryMateriaPrima", optionsRol)
    selectOptionAll(".select_options_units_rawmaterial", "units", optionsRol)

    attachValidationListeners(RawmaterialCount);

    const newProduct = document.getElementById(`rawmaterials-${RawmaterialCount}`);
    newProduct.querySelector(".remove-rawmaterial").addEventListener("click", function () {
        newProduct.remove();
        reindex("#rawmaterials-container .rawmaterials", "rawmaterials", RawmaterialCount, "Materia Prima");
    });
}
function attachValidationListeners(index) {
    const row = document.getElementById(`rawmaterials-${index}`);
    row.querySelectorAll("input[type='text'], input[type='number']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
    });
    ["min", "max"].forEach(name => {
        const input = row.querySelector(`input[name="${name}"]`);
        input.addEventListener("keyup", () => {
            const minVal = Number(row.querySelector(`input[name="min"]`).value);
            const maxVal = Number(row.querySelector(`input[name="max"]`).value);
            let minError = null;
            let maxError = null;

            if (isNaN(minVal) || minVal <= 0) {
                minError = "Debe ser un número mayor que 0";
            }
            if (isNaN(maxVal) || maxVal <= 0) {
                maxError = "Debe ser un número mayor que 0";
            }

            if (minError === null && maxError === null) {
                if (maxVal < minVal) {
                    maxError = "No puede ser menor que Stock Min";
                }
            }

            setValidationStyles(`input-min-rawMaterial-${index}`, minError);
            setValidationStyles(`input-max-rawMaterial-${index}`, maxError);
        });
    });

    const edit = document.getElementById(`rawmaterial-container`)
    edit.querySelectorAll("input[type='text'], input[type='number']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
    });
    ["min", "max"].forEach(name => {
        const input = edit.querySelector(`input[name="${name}"]`);
        input.addEventListener("keyup", () => {
            const minVal = Number(edit.querySelector(`input[name="min"]`).value);
            const maxVal = Number(edit.querySelector(`input[name="max"]`).value);
            let minError = null;
            let maxError = null;

            if (isNaN(minVal) || minVal <= 0) {
                minError = "Debe ser un número mayor que 0";
            }
            if (isNaN(maxVal) || maxVal <= 0) {
                maxError = "Debe ser un número mayor que 0";
            }

            if (minError === null && maxError === null) {
                if (maxVal < minVal) {
                    maxError = "No puede ser menor que Stock Min";
                }
            }

            setValidationStyles(`input-min-rawMaterial`, minError);
            setValidationStyles(`input-max-rawMaterial`, maxError);
        });
    });
}
document.getElementById("add-rawmaterial-btn").addEventListener("click", () => {
    addRawMaterial()
    reindex("#rawmaterials-container .rawmaterials", "rawmaterials", RawmaterialCount, "Materia Prima");
});
validate.validators.validateCategoryAndUnit = function (value, options, key, attributes) {
    if (!value) {
        return options.message || "es requerido";
    }
    if (value.toLowerCase() === "seleccione una opcion") {
        return options.message || "es requerido'";
    }
};
validate.validators.nombreValidator = function (value, options, key, attributes) {
    if (!value) return;

    if (!/^[A-Z]/.test(value)) {
        return options.uppercaseMessage;
    }
    if (!/^[A-Za-z0-9\s]*$/.test(value)) {
        return options.specialCharMessage;
    }
};
validate.validators.stockValidator = function (value, options, key, attributes) {
    // Si uno de los dos no está presente, no hacemos nada
    if (value == null || attributes[options.field] == null) return;
    const val = Number(value);
    const other = Number(attributes[options.field]);
    if (isNaN(val) || isNaN(other)) return;
    if (val < other) {
        return options.message || `no puede ser menor que ${options.field}`;
    }
};
const rules = {
    nombre: {
        nombreValidator: {
            uppercaseMessage: "^debe tener la primera letra en mayúscula.",
            specialCharMessage: "^No se permiten signos como puntos (.) o comas (,)."
        },
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        length: {
            minimum: 4,
            message: "^debe tener al menos 4 caracteres"
        },
        format: {
            pattern: /^[A-Z].*/,
            message: "^debe empezar con mayuscula"
        },
    },
    id_categoria: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateCategoryAndUnit: { message: "^es requerido" }
    },
    id_unidad: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateCategoryAndUnit: { message: "^es requerido" }
    },
    min: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        numericality: {
            onlyInteger: true,
            greaterThan: 0,
            message: "^debe ser un número mayor que 0"
        }
    },
    max: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        numericality: {
            onlyInteger: true,
            greaterThan: 0,
            message: "^debe ser un número mayor que 0"
        },
        stockValidator: {
            field: "min",
            message: "^no puede ser menor que Stock Min"
        }
    }
};
let form = document.getElementById("form-submit-rawMaterials")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", function (e) {
        e.preventDefault()
        const rawmaterial = document.querySelectorAll(".rawmaterials");
        let formHasError = false;
        let material = []
        rawmaterial.forEach((rawmaterial, i) => {
            const index = i + 1;
            let data = {
                nombre: rawmaterial.querySelector(`input[name="nombre"]`).value,
                id_categoria: rawmaterial.querySelector(`input[name="id_categoria"]`).getAttribute("data-id") ? rawmaterial.querySelector(`input[name="id_categoria"]`).getAttribute("data-id") : "",
                id_unidad: rawmaterial.querySelector(`input[name="id_unidad"]`).getAttribute("data-id") ? rawmaterial.querySelector(`input[name="id_unidad"]`).getAttribute("data-id") : "",
                min: rawmaterial.querySelector(`input[name="min"]`).value,
                max: rawmaterial.querySelector(`input[name="max"]`).value
            }
            material.push(data)
            const errors = validate(data, rules);
            setValidationStyles(`input-name-rawMaterial-${index}`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-category-rawMaterial-${index}`, errors?.id_categoria ? errors.id_categoria[0] : null);
            setValidationStyles(`input-unit-rawMaterial-${index}`, errors?.id_unidad ? errors.id_unidad[0] : null);
            setValidationStyles(`input-min-rawMaterial-${index}`, errors?.min ? errors.min[0] : null);
            setValidationStyles(`input-max-rawMaterial-${index}`, errors?.max ? errors.max[0] : null);
            if (errors) formHasError = true;
        })

        if (!formHasError) {
            let datafinal = new FormData()
            material.forEach((material, index) => {
                datafinal.append(`lista[${index}][nombre]`, material.nombre)
                datafinal.append(`lista[${index}][id_categoria]`, material.id_categoria)
                datafinal.append(`lista[${index}][id_unidad]`, material.id_unidad)
                datafinal.append(`lista[${index}][stock_min]`, material.min)
                datafinal.append(`lista[${index}][stock_max]`, material.max)
            })
            addDataTables(n, datafinal, "rawmaterial", binnacle(session.message.id, "Materia Prima", "Agregar", "Se creo un nueva materia prima"))
            bootstrap.Modal.getOrCreateInstance('#register-rawMaterial').hide()
            resetForm("#rawmaterial-container .rawmaterial", form)

        }
    });
    form.dataset.listenerAttached = "true";
}
attachValidationListeners(1)

editDataTables(".table_rawmaterial", (response) => {
    document.querySelector("#input-name-rawMaterial").value = response[0].nombre
    document.querySelector("#input-category-rawMaterial").value = response[0].nombre_categoria
    document.querySelector("#input-category-rawMaterial").setAttribute("data-id", response[0].id_categoria)
    document.querySelector("#input-unit-rawMaterial").value = response[0].nombre_unidad
    document.querySelector("#input-unit-rawMaterial").setAttribute("data-id", response[0].id_unidad)
    document.querySelector("#input-min-rawMaterial").value = response[0].stock_min
    document.querySelector("#input-max-rawMaterial").value = response[0].stock_max

    let data = {
        nombre: document.querySelector(`#input-name-rawMaterial`).value,
        id_categoria: document.querySelector(`#input-category-rawMaterial`).getAttribute("data-id") ? document.querySelector(`#input-category-rawMaterial`).getAttribute("data-id") : "",
        id_unidad: document.querySelector(`#input-unit-rawMaterial`).getAttribute("data-id") ? document.querySelector(`#input-unit-rawMaterial`).getAttribute("data-id") : "",
        min: document.querySelector(`#input-min-rawMaterial`).value,
        max: document.querySelector(`#input-max-rawMaterial`).value
    }
    const errors = validate(data, rules);
    setValidationStyles(`input-name-rawMaterial`, errors?.nombre ? errors.nombre[0] : null);
    setValidationStyles(`input-category-rawMaterial`, errors?.id_categoria ? errors.id_categoria[0] : null);
    setValidationStyles(`input-unit-rawMaterial`, errors?.id_unidad ? errors.id_unidad[0] : null);
    setValidationStyles(`input-min-rawMaterial`, errors?.min ? errors.min[0] : null);
    setValidationStyles(`input-max-rawMaterial`, errors?.max ? errors.max[0] : null);

    let formEdit = document.querySelector("#form-submit-edit-rawMaterial")
    if (!formEdit.dataset.listenerAttached) {
        formEdit.addEventListener("submit", (e) => {
            e.preventDefault();
            const data = {
                nombre: document.querySelector(`#input-name-rawMaterial`).value,
                id_categoria: document.querySelector(`#input-category-rawMaterial`).getAttribute("data-id") ? document.querySelector(`#input-category-rawMaterial`).getAttribute("data-id") : "",
                id_unidad: document.querySelector(`#input-unit-rawMaterial`).getAttribute("data-id") ? document.querySelector(`#input-unit-rawMaterial`).getAttribute("data-id") : "",
                min: document.querySelector(`#input-min-rawMaterial`).value,
                max: document.querySelector(`#input-max-rawMaterial`).value
            }
            const errors = validate(data, rules);
            setValidationStyles(`input-name-rawMaterial`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-category-rawMaterial`, errors?.id_categoria ? errors.id_categoria[0] : null);
            setValidationStyles(`input-unit-rawMaterial`, errors?.id_unidad ? errors.id_unidad[0] : null);
            setValidationStyles(`input-min-rawMaterial`, errors?.min ? errors.min[0] : null);
            setValidationStyles(`input-max-rawMaterial`, errors?.max ? errors.max[0] : null);

            if (!errors) {
                let datafinal = new FormData()
                datafinal.append("id", response[0].id)
                datafinal.append("nombre", data.nombre)
                datafinal.append("id_categoria", data.id_categoria)
                datafinal.append("id_unidad", data.id_unidad)
                datafinal.append("stock_min", data.min)
                datafinal.append("stock_max", data.max)
                updateDataTables(n, datafinal, "rawmaterial", binnacle(session.message.id, "Materia Prima", "Actualizacion", "Se actualizo una materia prima"))
                bootstrap.Modal.getOrCreateInstance('#edit-rawMaterial').hide()
            }
        })
        formEdit.dataset.listenerAttached = "true";
    }
})