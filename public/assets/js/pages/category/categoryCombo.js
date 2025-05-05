import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { setValidationStyles, validateField, addDataTables, reindex, deleteDatatable, editDataTables, updateDataTables, resetForm } = functionGeneral();
const { elemenFormCategoryProduct } = Templates()
document.querySelectorAll(".btn-add-tooltip").forEach((btn) => {new bootstrap.Tooltip(btn)})
let n = $(".table_combo").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'categoryProducto/get_all',
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
                <button data-id="${data.id}" data-module-edit="categoryProducto" class="btn bh_1 rounded-circle btn-circle edit_btn_datatable" data-bs-toggle="modal" data-bs-target="#edit-categoryCombo" data-bs-title="Editar Categoria" data-bs-placement="bottom">
                    <i data-feather="edit" class="text-white"></i>
                </button>
                <button data-id="${data.id}" data-module-delete="categoryProducto" class="btn bh_5 rounded-circle btn-circle trash_btn_datatable" data-bs-toggle="tooltip" data-bs-title="Eliminar Categoria" data-bs-placement="bottom">
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
$('#searchCategoryProducts').on('keyup', function () {
    n.search(this.value).draw();
});
deleteDatatable(".table_combo", n)

let CategoryProductCount = 1;
function addCategoryCombo() {
    CategoryProductCount++;
    document.getElementById("categoryCombos-container").insertAdjacentHTML('beforeend', elemenFormCategoryProduct(CategoryProductCount));
    feather.replace();
    attachValidationListeners(CategoryProductCount);
    const newCategoryCombo = document.getElementById(`categoryCombos-${CategoryProductCount}`);
    newCategoryCombo.querySelector(".remove-categoryProducts").addEventListener("click", function () {
        newCategoryCombo.remove();
        reindex("#categoryCombos-container .categoryCombos", `categoryCombos`, CategoryProductCount, "Categoria Combo");
    });
}
document.getElementById("add-categoryProduct-btn").addEventListener("click", () => {
    addCategoryCombo()
    reindex("#categoryCombos-container .categoryCombos", "categoryCombos", CategoryProductCount, "Categoria Combo");
});
function attachValidationListeners(index) {
    const unitElement = document.getElementById(`categoryCombos-${index}`);
    unitElement.querySelectorAll("input[type='text']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
    });
    const category2 = document.getElementById(`categoryCombo-container`);
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

let form = document.getElementById("form-submit-categoryProduct")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        const CategoryCombos = document.querySelectorAll(".categoryCombos");
        let formHasError = false;
        let dataCategoryCombos = []

        CategoryCombos.forEach((category, i) => {
            const index = i + 1;
            const data = {
                nombre: category.querySelector(`input[name="nombre"]`).value,
            }
            dataCategoryCombos.push(data)
            const errors = validate(data, rules);
            setValidationStyles(`input-name-categoryProduct-${index}`, errors?.nombre ? errors.nombre[0] : null);
            if (errors) {
                formHasError = true;
            }
        })
        if (!formHasError) {
            let dataFinal = new FormData()
            dataCategoryCombos.forEach((category, index) => {
                dataFinal.append(`lista[${index}][nombre]`, category.nombre)
            })
            addDataTables(n, dataFinal, "categoryProducto")
            resetForm(".categoryCombos", form)
            bootstrap.Modal.getOrCreateInstance('#register-categoryCombo').hide()
        }
    })
    form.dataset.listenerAttached = "true";
}

editDataTables(".table_combo", (response) => {
    let formHasError = false;
    document.querySelector("#input-name-categoryProduct").value = response[0].nombre;
    document.querySelector("#input-id-categoryCombo").value = response[0].id;
    const data = {
        nombre: document.querySelector(`#input-name-categoryProduct`).value,
    }
    const errors = validate(data, rules);
    setValidationStyles(`input-name-categoryProduct`, errors?.nombre ? errors.nombre[0] : null);

    if (errors) {
        formHasError = true;
    }
    let formEdit = document.getElementById("form-submit-edit-categoryProduct")
    if (!formEdit.dataset.listenerAttached) {
        formEdit.addEventListener("submit", (e) => {
            e.preventDefault();
            const data = {
                nombre: document.querySelector(`#input-name-categoryProduct`).value,
            }
            const errors = validate(data, rules);
            setValidationStyles(`input-name-categoryProduct`, errors?.nombre ? errors.nombre[0] : null);
            if (errors) formHasError = true;
            else formHasError = false;

            if (!formHasError) {
                let dataFinal = new FormData()
                dataFinal.append(`nombre`, document.querySelector(`#input-name-categoryProduct`).value)
                dataFinal.append(`id`, document.querySelector("#input-id-categoryCombo").value)
                updateDataTables(n, dataFinal, "categoryProducto")
                bootstrap.Modal.getOrCreateInstance('#edit-categoryCombo').hide()
            }
        })
        formEdit.dataset.listenerAttached = "true";
    }
})
attachValidationListeners(1);