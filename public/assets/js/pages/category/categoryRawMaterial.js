import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { setValidationStyles, validateField, addDataTables, reindex, deleteDatatable, editDataTables, updateDataTables, resetForm } = functionGeneral();
const { elemenFormCategoryRawmaterial } = Templates()
document.querySelectorAll(".btn-add-tooltip").forEach((btn) => { new bootstrap.Tooltip(btn) })
let table = $(".table_category_rawmaterial").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'categoryMateriaPrima/get_all/0/10000000/id/asc',
        dataSrc: '',
        type: 'POST',
        data: {
            active: 1,
        },
    },
    columns: [
        { data: 'id' },
        { data: 'nombre' },
        {
            data: null,
            orderable: false,
            render: function (data, type, row, meta) {
                return `
                <button data-id="${data.id}" data-module-edit="categoryMateriaPrima" class="btn bh_1 rounded-circle btn-circle edit_btn_datatable" data-bs-toggle="modal" data-bs-target="#edit-categoryRawMaterial" data-bs-title="Editar Categoria" data-bs-placement="bottom">
                    <i data-feather="edit" class="text-white"></i>
                </button>
                <button data-id="${data.id}" data-module-delete="categoryMateriaPrima" class="btn bh_5 rounded-circle btn-circle trash_btn_datatable" data-bs-toggle="tooltip" data-bs-title="Eliminar Categoria" data-bs-placement="bottom">
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
$('#searchCategoryRawMaterials').on('keyup', function () {
    table.search(this.value).draw();
});
deleteDatatable(".table_category_rawmaterial", table)

let CategoryRawMaterialCount = 1;
function addCategoryRawMaterial() {
    CategoryRawMaterialCount++;
    document.getElementById("categoryRawMaterials-container").insertAdjacentHTML('beforeend', elemenFormCategoryRawmaterial(CategoryRawMaterialCount));
    feather.replace();
    attachValidationListeners(CategoryRawMaterialCount);
    const newCategoryRawMaterial = document.getElementById(`categoryRawMaterials-${CategoryRawMaterialCount}`);
    newCategoryRawMaterial.querySelector(".remove-categoryRawMaterials").addEventListener("click", function () {
        newCategoryRawMaterial.remove();
        reindex("#categoryRawMaterials-container .categoryRawMaterials", `categoryRawMaterials`, CategoryRawMaterialCount, "Categoria Materia Prima");
    });
}
document.getElementById("add-categoryRawMaterial-btn").addEventListener("click", () => {
    addCategoryRawMaterial()
    reindex("#categoryRawMaterials-container .categoryRawMaterials", `categoryRawMaterials`, CategoryRawMaterialCount, "Categoria Materia Prima");
});
function attachValidationListeners(index) {
    const unitElement = document.getElementById(`categoryRawMaterials-${index}`);
    unitElement.querySelectorAll("input[type='text']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
    });
    const category2 = document.getElementById(`categoryRawMaterial-container`);
    category2.querySelectorAll("input[type='text']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
    });
}
validate.validators.nombreValidator = function (value, options, key, attributes) {
    if (!value) return;
    if (!/^[A-Z]/.test(value)) {
        return options.uppercaseMessage;
    }
    if (!/^[A-Za-z0-9\s]*$/.test(value)) {
        return options.specialCharMessage;
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
            minimum: 2,
            message: "^debe tener al menos 2 caracteres"
        },
    },
};

let form = document.getElementById("form-submit-categoryRawMaterials")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        const categoryRawMaterial = document.querySelectorAll(".categoryRawMaterials");
        let formHasError = false;
        let datacategoryRawMaterial = []

        categoryRawMaterial.forEach((category, i) => {
            const index = i + 1;
            const data = {
                nombre: category.querySelector(`input[name="nombre"]`).value,
            }
            datacategoryRawMaterial.push(data)
            const errors = validate(data, rules);
            setValidationStyles(`input-name-categoryRawMaterials-${index}`, errors?.nombre ? errors.nombre[0] : null);
            if (errors) {
                formHasError = true;
            }
        })
        if (!formHasError) {
            let dataFinal = new FormData()
            datacategoryRawMaterial.forEach((category, index) => {
                dataFinal.append(`lista[${index}][nombre]`, category.nombre)
            })
            addDataTables(table, dataFinal, "categoryMateriaPrima")
            resetForm(".categoryRawMaterials", form)
            bootstrap.Modal.getOrCreateInstance('#register-categoryRawMaterials').hide()
        }
    })
    form.dataset.listenerAttached = "true";
}

editDataTables(".table_category_rawmaterial", (response) => {
    let formHasError = false;
    console.log(document.querySelector("#input-name-categoryRawMaterial"));
    document.querySelector("#input-name-categoryRawMaterial").value = response[0].nombre;
    document.querySelector("#input-id-categoryRawMaterial").value = response[0].id;
    const data = {
        nombre: document.querySelector(`#input-name-categoryRawMaterial`).value,
    }
    const errors = validate(data, rules);
    setValidationStyles(`input-name-categoryRawMaterial`, errors?.nombre ? errors.nombre[0] : null);

    if (errors) {
        formHasError = true;
    }
    let formEdit = document.getElementById("form-submit-edit-categoryRawMaterial")
    if (!formEdit.dataset.listenerAttached) {
        formEdit.addEventListener("submit", (e) => {
            e.preventDefault();
            const data = {
                nombre: document.querySelector(`#input-name-categoryRawMaterial`).value,
            }
            const errors = validate(data, rules);
            setValidationStyles(`input-name-categoryRawMaterial`, errors?.nombre ? errors.nombre[0] : null);
            if (errors) formHasError = true;
            else formHasError = false;

            if (!formHasError) {
                let dataFinal = new FormData()
                dataFinal.append(`nombre`, document.querySelector(`#input-name-categoryRawMaterial`).value)
                dataFinal.append(`id`, document.querySelector("#input-id-categoryRawMaterial").value)
                updateDataTables(table, dataFinal, "categoryMateriaPrima")
                bootstrap.Modal.getOrCreateInstance('#edit-categoryRawMaterial').hide()
            }
        })
        formEdit.dataset.listenerAttached = "true";
    }
})
attachValidationListeners(1);