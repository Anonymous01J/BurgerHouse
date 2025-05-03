import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { SelectOption, setValidationStyles, validateField, addDataTables, reindex, deleteDatatable, editDataTables, updateDataTables } = functionGeneral();
const { elemenFormUnit } = Templates()

let n = $(".table_unit").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'units/get_all',
        dataSrc: '',
        type: 'POST',
        data: {
            active: 1,
        },
    },
    columns: [
        { data: 'id' },
        { data: 'nombre' },
        { data: 'alias' },
        {
            data: null,
            orderable: false,
            render: function (data, type, row, meta) {
                return `
                <button data-id="${data.id}" data-module-edit="units" class="btn bh_1 rounded-circle btn-circle edit_btn_datatable" data-bs-toggle="modal" data-bs-target="#edit-unit">
                    <i data-feather="edit" class="text-white"></i>
                </button>
                <button data-id="${data.id}" data-module-delete="units" class="btn bh_5 rounded-circle btn-circle trash_btn_datatable">
                    <i data-feather="trash" class="text-white"></i>
                </button>
`;
            }
        }
    ],
    drawCallback: function (settings) {
        feather.replace();
    },
    "dom": 'tipr',
    "paging": true,
    "info": true,
})
$('#searchUnits').on('keyup', function () {
    n.search(this.value).draw();
});
deleteDatatable(".table_unit", n)

let UnitsCount = 1;
function addUnits() {
    UnitsCount++;
    document.getElementById("units-container").insertAdjacentHTML('beforeend', elemenFormUnit(UnitsCount));
    feather.replace();
    attachValidationListeners(UnitsCount);
    const newUnit = document.getElementById(`unit-${UnitsCount}`);
    newUnit.querySelector(".remove-unit").addEventListener("click", function () {
        newUnit.remove();
        reindex("#units-container .units", "units", UnitsCount, "Unidad");
    });
}
document.getElementById("add-unit-btn").addEventListener("click", () => {
    addUnits();
    reindex("#units-container .units", "units", UnitsCount, "unidad");
});
function attachValidationListeners(index) {
    const unitElement = document.getElementById(`unit-${index}`);
    unitElement.querySelectorAll("input[type='text']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
    });
    const unit2 = document.getElementById(`unit`);
    unit2.querySelectorAll("input[type='text']").forEach(input => {
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
    alias: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
    }
};

let form = document.getElementById("form-submit-unit")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        const units = document.querySelectorAll(".units");
        let formHasError = false;
        let dataUnits = []

        units.forEach((unit, i) => {
            const index = i + 1;
            const data = {
                nombre: unit.querySelector(`input[name="nombre"]`).value,
                alias: unit.querySelector(`input[name="alias"]`).value,
            }
            dataUnits.push(data)
            const errors = validate(data, rules);
            setValidationStyles(`input-name-units-${index}`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-alias-units-${index}`, errors?.alias ? errors.alias[0] : null);
            if (errors) {
                formHasError = true;
            }
        })
        if (!formHasError) {
            let dataFinal = new FormData()
            dataUnits.forEach((user, index) => {
                dataFinal.append(`lista[${index}][nombre]`, user.nombre)
                dataFinal.append(`lista[${index}][alias]`, user.alias)
            })
            addDataTables(n, dataFinal, "units")
            bootstrap.Modal.getOrCreateInstance('#register-unit').hide()
        }
    })
    form.dataset.listenerAttached = "true";
}

editDataTables(".table_unit", (response) => {
    let formHasError = false;
    document.querySelector("#input-name-unit").value = response[0].nombre;
    document.querySelector("#input-alias-unit").value = response[0].alias;
    document.querySelector("#input-id-unit").value = response[0].id;
    const data = {
        nombre: document.querySelector(`#input-name-unit`).value,
        alias: document.querySelector(`#input-alias-unit`).value,
    }
    const errors = validate(data, rules);
    setValidationStyles(`input-name-unit`, errors?.nombre ? errors.nombre[0] : null);
    setValidationStyles(`input-alias-unit`, errors?.alias ? errors.alias[0] : null);

    if (errors) {
        formHasError = true;
    }
    let formEdit = document.getElementById("form-submit-edit-unit")
    if (!formEdit.dataset.listenerAttached) {
        formEdit.addEventListener("submit", (e) => {
            e.preventDefault();
            const data = {
                nombre: document.querySelector(`#input-name-unit`).value,
                alias: document.querySelector(`#input-alias-unit`).value,
            }
            const errors = validate(data, rules);
            setValidationStyles(`input-name-unit`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-alias-unit`, errors?.alias ? errors.alias[0] : null);

            if (errors) formHasError = true;
            else formHasError = false;

            if (!formHasError) {
                let dataFinal = new FormData()
                dataFinal.append(`nombre`, document.querySelector(`#input-name-unit`).value)
                dataFinal.append(`alias`, document.querySelector("#input-alias-unit").value)
                dataFinal.append(`id`, document.querySelector("#input-id-unit").value)
                updateDataTables(n, dataFinal, "units")
                bootstrap.Modal.getOrCreateInstance('#edit-unit').hide()
            }
        })
        formEdit.dataset.listenerAttached = "true";
    }
})
attachValidationListeners(1);