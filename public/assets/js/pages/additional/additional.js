import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { resetForm, setValidationStyles, validateField, addDataTables, reindex, deleteDatatable, editDataTables, updateDataTables, InputPrice, sessionInfo, viewImage, binnacle } = functionGeneral();
const { elemenFormAdditional } = Templates()
InputPrice("[input_price]");
viewImage(".input-image")
let session = await sessionInfo();
let tooltip = new bootstrap.Tooltip(document.querySelector(".btn-add-tooltip"))
let n = $(".table_additional").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'additional/get_all/0/10000000/id/asc',
        dataSrc: '',
        type: 'POST',
        data: { active: 1, tipo: "adicional" },
    },
    columns: [
        { data: 'nombre' },
        { data: null, render: (data, type, row, meta) => { return `<img style="object-fit: cover" src='${data.imagen ? "media/additional/" + data.imagen : "./assets/img/big/banner_login.png"}' width='50px' height='50px'>` } },
        { data: null, render: (data, type, row, meta) => { return data.precio + " $" } },
        {
            data: null,
            orderable: false,
            render: function (data, type, row, meta) {
                return `
                <button data-id="${data.id}" data-module-edit="additional" class="btn bh_1 rounded-circle btn-circle edit_btn_datatable" data-bs-toggle="modal" data-bs-target="#edit-additional" data-bs-title="Editar Adicional" data-bs-placement="bottom">
                    <i data-feather="edit" class="text-white"></i>
                </button>
                <button data-id="${data.id}" data-module-delete="additional" class="btn bh_5 rounded-circle btn-circle trash_btn_datatable" data-bs-toggle="tooltip" data-bs-title="Eliminar Adicional" data-bs-placement="bottom">
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
$('#searchAdditional').on('keyup', function () {
    n.search(this.value).draw();
});

let additionalCount = 1;
function addAdditional() {
    additionalCount++;
    document.getElementById("additionals-container").insertAdjacentHTML('beforeend', elemenFormAdditional(additionalCount));
    feather.replace();
    InputPrice("[input_price]");
    viewImage(".input-image")

    attachValidationListeners(additionalCount);
    const newAdditional = document.getElementById(`additionals-${additionalCount}`);
    newAdditional.querySelector(".remove-additional").addEventListener("click", function () {
        newAdditional.remove();
        reindex("#additionals-container .additionals", "additionals", additionalCount, "Adicional");
    });
}
document.getElementById("add-additional-btn").addEventListener("click", () => {
    addAdditional();
    reindex("#additionals-container .additionals", "additionals", additionalCount, "Adicional");
});
function attachValidationListeners(index) {
    const additionalElement = document.getElementById(`additionals-${index}`);
    additionalElement.querySelectorAll("input[type='text'], input[type='file']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
        input.addEventListener("change", (e) => validateField(e, rules));
    });
    const element2 = document.getElementById(`additional`);
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

let form = document.getElementById("form-submit-additionals")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        const additionals = document.querySelectorAll(".additionals");
        let formHasError = false;
        let dataAdditionals = []

        additionals.forEach((additional, i) => {
            const index = i + 1;
            const data = {
                nombre: additional.querySelector(`input[name="nombre"]`).value,
                precio: additional.querySelector(`input[name="precio"]`).value.replace(/\./g, '').replace(',', '.'),
                imagen: additional.querySelector(`input[name="imagen"]`) ? additional.querySelector(`input[name="imagen"]`).files[0] : ""
            };
            dataAdditionals.push(data)
            const errors = validate(data, rules);
            setValidationStyles(`input-name-additional-${index}`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-price-additional-${index}`, errors?.precio ? errors.precio[0] : null);
            setValidationStyles(`input-image-additional-${index}`, errors?.imagen ? errors.imagen[0] : null);
            if (errors) formHasError = true;
        })
        if (!formHasError) {
            console.log(dataAdditionals);
            let dataFinal = new FormData()
            dataAdditionals.forEach((additional, index) => {
                dataFinal.append(`lista[${index}][nombre]`, additional.nombre)
                dataFinal.append(`lista[${index}][precio]`, additional.precio)
                dataFinal.append(`lista[${index}][imagen]`, additional.imagen)
                dataFinal.append(`lista[${index}][imagen_name]`, additional.imagen.name)
                dataFinal.append(`lista[${index}][tipo]`, "adicional")
            })
            addDataTables(n, dataFinal, "additional", binnacle(session.message.id, "Adicionales", "Agregar", "Se agrego un nuevo adicional"))
            resetForm(".additionals", form)
            bootstrap.Modal.getOrCreateInstance('#register-additional').hide()
        }
    })
    form.dataset.listenerAttached = "true";
}
editDataTables(".table_additional", (response) => {
    let formHasError = false;
    document.querySelector(`#input-name-additional`).value = response[0].nombre,
        document.querySelector(`#input-price-additional`).value = (response[0].precio).toString().replace(/\./g, ',')
    document.querySelector(`#img-additional-response`).src = `media/additional/${response[0].imagen}`

    const data = {
        nombre: document.querySelector(`#input-name-additional`).value,
        precio: document.querySelector(`#input-price-additional`).value.replace(/\./g, '').replace(',', '.'),
    }

    const errors = validate(data, rules2);
    setValidationStyles(`input-name-additional`, errors?.nombre ? errors.nombre[0] : null);
    setValidationStyles(`input-price-additional`, errors?.precio ? errors.precio[0] : null);

    if (errors) formHasError = true;
    let formEdit = document.getElementById("form-submit-edit-additional")
    if (!formEdit.dataset.listenerAttached) {
        formEdit.addEventListener("submit", (e) => {
            e.preventDefault();
            const data = {
                nombre: document.querySelector(`#input-name-additional`).value,
                precio: document.querySelector(`#input-price-additional`).value.replace(/\./g, '').replace(',', '.'),
            }
            const errors = validate(data, rules2);
            setValidationStyles(`input-name-additional`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-price-additional`, errors?.precio ? errors.precio[0] : null);

            if (errors) formHasError = true;
            else formHasError = false;

            if (!formHasError) {
                let dataFinal = new FormData()
                dataFinal.append(`id`, response[0].id)
                dataFinal.append(`nombre`, document.querySelector(`#input-name-additional`).value)
                dataFinal.append(`precio`, document.querySelector(`#input-price-additional`).value.replace(/\./g, '').replace(',', '.'))
                if (document.querySelector(`#input-image-additional`).value != "") {
                    dataFinal.append(`imagen`, document.querySelector(`#input-image-additional`).files[0])
                    dataFinal.append(`imagen_name`, document.querySelector(`#input-image-additional`).files[0].name)
                }
                updateDataTables(n, dataFinal, "additional", binnacle(session.message.id, "Adicionales", "Actualizacion", "Se actualizo un adicional"))
                bootstrap.Modal.getOrCreateInstance('#edit-additional').hide()
            }
        })
        formEdit.dataset.listenerAttached = "true";
    }
})
    document.getElementById('navbarDropdown').addEventListener('click', function () {
        if (typeof introJs !== 'undefined') {
            let intro = introJs();
            intro.setOptions({
                steps: [
                {
                    element: '.page-title',
                    intro: 'Esta es la sección de productos preparados, donde puedes gestionar los productos disponibles en el sistema.',
                    position: 'bottom'
                },
                {
                    element: '#searchProduct',
                    intro: 'Utiliza este cuadro de búsqueda para filtrar los productos preparados.',
                    position: 'top'
                },
                {
                    element: '.btn-add-tooltip',
                    intro: 'Haz clic aquí para agregar un nuevo producto preparado.',
                    position: 'top'
                },
                {
                    element: '#categories',
                    intro: 'Aquí puedes ver las categorías disponibles para los productos preparados. Selecciona una categoría para filtrar los productos preparados por tipo.',
                    position: 'top'
                },
                {
                    element: '.cont-product',
                    intro: 'Este contenedor muestra los productos preparados disponibles. Puedes editarlos o eliminarlos.',
                    position: 'top'
                },
                {
                    element: '#top-products',
                    intro: 'Esta sección muestra los productos más vendidos y su rendimiento.',
                    position: 'top'
                }
                ],
                showBullets: true,
                exitOnOverlayClick: false,
                showProgress: true
            });
            intro.start();
        }
    });
deleteDatatable(".table_additional", n, () => binnacle(session.message.id, "Adicionales", "Eliminacion", "Se ha eliminado un adicional"))
attachValidationListeners(1);