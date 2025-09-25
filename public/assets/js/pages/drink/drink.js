import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { resetForm, setValidationStyles, validateField, addDataTables, reindex, deleteDatatable, editDataTables, updateDataTables, InputPrice, viewImage } = functionGeneral();
const { elemenFormDrink } = Templates()
InputPrice("[input_price]");
viewImage(".input-image")

let tooltip = new bootstrap.Tooltip(document.querySelector(".btn-add-tooltip"))
let n = $(".table_drink").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'additional/get_all/0/10000000/id/asc',
        dataSrc: '',
        type: 'POST',
        data: { active: 1, tipo: "bebida" },
    },
    columns: [
        { data: 'nombre' },
        { data: null, render: (data, type, row, meta) => { return `<img style="object-fit: cover" src='${data.imagen ? "media/bebidas/" + data.imagen : "./assets/img/big/banner_login.png"}' width='50px' height='50px'>` } },
        { data: null , render: (data, type, row, meta) => { return data.precio + " $" } },
        {
            data: null,
            orderable: false,
            render: function (data, type, row, meta) {
                return `
                <button data-id="${data.id}" data-module-edit="drink" class="btn bh_1 rounded-circle btn-circle edit_btn_datatable" data-bs-toggle="modal" data-bs-target="#edit-drink" data-bs-title="Editar Bebida" data-bs-placement="bottom">
                    <i data-feather="edit" class="text-white"></i>
                </button>
                <button data-id="${data.id}" data-module-delete="drink" class="btn bh_5 rounded-circle btn-circle trash_btn_datatable" data-bs-toggle="tooltip" data-bs-title="Eliminar Bebida" data-bs-placement="bottom">
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
$('#searchDrink').on('keyup', function () {
    n.search(this.value).draw();
});
deleteDatatable(".table_drink", n)
let drinkCount = 1;
function addDrink() {
    drinkCount++;
    document.getElementById("drinks-container").insertAdjacentHTML('beforeend', elemenFormDrink(drinkCount));
    feather.replace();
    InputPrice("[input_price]");
    viewImage(".input-image")

    attachValidationListeners(drinkCount);
    const newAdditional = document.getElementById(`drinks-${drinkCount}`);
    newAdditional.querySelector(".remove-additional").addEventListener("click", function () {
        newAdditional.remove();
        reindex("#drinks-container .drinks", "drinks", drinkCount, "Bebida");
    });
}

document.getElementById("add-drink-btn").addEventListener("click", () => {
    addDrink();
    reindex("#drinks-container .drinks", "drinks", drinkCount, "Bebida");
});
function attachValidationListeners(index) {
    const additionalElement = document.getElementById(`drinks-${index}`);
    additionalElement.querySelectorAll("input[type='text'], input[type='file']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
        input.addEventListener("change", (e) => validateField(e, rules));
    });
    const element2 = document.getElementById(`drink`);
    element2.querySelectorAll("input[type='text']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules2));
        input.addEventListener("blur", (e) => validateField(e, rules2));
    });
}
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
            minimum: 4,
            message: "^debe tener al menos 4 caracteres"
        },
    },
    precio: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        precio: { message: "^debe ser un número mayor a 0" }
    },
    imagen: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        }
    },
};
const rules2 = {
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
    },
    precio: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        precio: { message: "^debe ser un número mayor a 0" }
    },
};

let form = document.getElementById("form-submit-drinks")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        const drink = document.querySelectorAll(".drinks");
        let formHasError = false;
        let datadrink = []

        drink.forEach((drink, i) => {
            const index = i + 1;
            const data = {
                nombre: drink.querySelector(`input[name="nombre"]`).value,
                precio: drink.querySelector(`input[name="precio"]`).value.replace(/\./g, '').replace(',', '.'),
                imagen: drink.querySelector(`input[name="imagen"]`) ? drink.querySelector(`input[name="imagen"]`).files[0] : ""
            };
            datadrink.push(data)
            const errors = validate(data, rules);
            setValidationStyles(`input-name-drink-${index}`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-price-drink-${index}`, errors?.precio ? errors.precio[0] : null);
            setValidationStyles(`input-image-drink-${index}`, errors?.imagen ? errors.imagen[0] : null);
            if (errors) formHasError = true;
        })
        if (!formHasError) {
            console.log(datadrink);
            let dataFinal = new FormData()
            datadrink.forEach((drink, index) => {
                dataFinal.append(`lista[${index}][nombre]`, drink.nombre)
                dataFinal.append(`lista[${index}][precio]`, drink.precio)
                dataFinal.append(`lista[${index}][imagen]`, drink.imagen)
                dataFinal.append(`lista[${index}][imagen_name]`, drink.imagen.name)
                dataFinal.append(`lista[${index}][tipo]`, "bebida")
            })
            addDataTables(n, dataFinal, "drink")
            resetForm(".drinks", form)
            bootstrap.Modal.getOrCreateInstance('#register-drink').hide()
        }
    })
    form.dataset.listenerAttached = "true";
}
editDataTables(".table_drink", (response) => {
    let formHasError = false;
    document.querySelector(`#input-name-drink`).value = response[0].nombre,
        document.querySelector(`#input-price-drink`).value = (response[0].precio).toString().replace(/\./g, ',')
    document.querySelector(`#img-drink-response`).src = `media/bebidas/${response[0].imagen}`

    const data = {
        nombre: document.querySelector(`#input-name-drink`).value,
        precio: document.querySelector(`#input-price-drink`).value.replace(/\./g, '').replace(',', '.'),
    }

    const errors = validate(data, rules2);
    setValidationStyles(`input-name-drink`, errors?.nombre ? errors.nombre[0] : null);
    setValidationStyles(`input-price-drink`, errors?.precio ? errors.precio[0] : null);

    if (errors) formHasError = true;
    let formEdit = document.getElementById("form-submit-edit-drink")
    if (!formEdit.dataset.listenerAttached) {
        formEdit.addEventListener("submit", (e) => {
            e.preventDefault();
            const data = {
                nombre: document.querySelector(`#input-name-drink`).value,
                precio: document.querySelector(`#input-price-drink`).value.replace(/\./g, '').replace(',', '.'),
            }
            const errors = validate(data, rules2);
            setValidationStyles(`input-name-drink`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-price-drink`, errors?.precio ? errors.precio[0] : null);

            if (errors) formHasError = true;
            else formHasError = false;

            if (!formHasError) {
                let dataFinal = new FormData()
                dataFinal.append(`id`, response[0].id)
                dataFinal.append(`nombre`, document.querySelector(`#input-name-drink`).value)
                dataFinal.append(`precio`, document.querySelector(`#input-price-drink`).value.replace(/\./g, '').replace(',', '.'))
                if (document.querySelector(`#input-image-drink`).value != "") {
                    dataFinal.append(`imagen`, document.querySelector(`#input-image-drink`).files[0])
                    dataFinal.append(`imagen_name`, document.querySelector(`#input-image-drink`).files[0].name)
                }
                updateDataTables(n, dataFinal, "drink")
                bootstrap.Modal.getOrCreateInstance('#edit-drink').hide()
            }
        })
        formEdit.dataset.listenerAttached = "true";
    }
})

attachValidationListeners(1);