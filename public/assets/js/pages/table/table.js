import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { setValidationStyles, validateField, reindex, resetForm, viewImage, searchParam, print, add, update, permission, searchFilter, sessionInfo, binnacle, edit, Delete } = functionGeneral();
const { elemenFormTables, targetTable } = Templates()
let session = await sessionInfo()
const config = {
    search: () => searchParam({ active: 1, estado: "LIBRE" }, "table"),
    template: targetTable,
    container: ".cont_tables_free",
    funtions: () => {
        Delete(config, () => binnacle(session.message.id, "Mesas", "Eliminacion", "Se Elimino un mesa"));
        edit((response) => editData(response));
        document.querySelectorAll(".edit_btn, .trash_btn").forEach((element) => { let tooltip = new bootstrap.Tooltip(element) });
    }
}
viewImage(".input-image")
searchFilter("#SearchTablesFREE", (e) => {
    if (e.target.value == "") print(config)
    else print({ ...config, search: () => searchParam({ active: 1, nombre_like: e.target.value, estado: "LIBRE" }, "table") })
})
searchFilter("#SearchTablesOCCUPIED", (e) => {
    if (e.target.value == "") print({ ...config, search: () => searchParam({ active: 1, estado: "OCUPADA" }, "table"), container: ".cont_tables_occupied" })
    else print({ ...config, search: () => searchParam({ active: 1, nombre_like: e.target.value, estado: "OCUPADA" }, "table"), container: ".cont_tables_occupied" })
})

let TableCount = 1;
function addTable() {
    TableCount++;
    document.getElementById("tables-container").insertAdjacentHTML('beforeend', elemenFormTables(TableCount));
    feather.replace();
    viewImage(".input-image")
    attachValidationListeners(TableCount);
    const newTable = document.getElementById(`tables-${TableCount}`);
    newTable.querySelector(".remove-table").addEventListener("click", function () {
        newTable.remove();
        reindex("#tables-container .tables", "tables", TableCount, "Mesas");
    });
}
function attachValidationListeners(index) {
    const productElement = document.getElementById(`tables-${index}`);
    productElement.querySelectorAll("input[type='text'], input[type='file'], input[type='number']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
        input.addEventListener("change", (e) => validateField(e, rules));
    });
    const table2 = document.getElementById(`table`);
    table2.querySelectorAll("input[type='text'], input[type='number']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules2));
        input.addEventListener("blur", (e) => validateField(e, rules2));
    });
}
document.getElementById("add-table-btn").addEventListener("click", () => { addTable(), reindex("#tables-container .tables", "tables", TableCount, "Mesas") });
validate.validators.numero = function (value, options, key, attributes) {
    if (!value) return;
    const numberValue = parseFloat(value);

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
}
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
    sillas: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        numero: { message: "^debe ser un número mayor a 0" }
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
            minimum: 2,
            message: "^debe tener al menos 2 caracteres"
        },
    },
    sillas: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        numero: { message: "^debe ser un número mayor a 0" }
    },
};
let form = document.getElementById("form-submit-tables")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        const tables = document.querySelectorAll(".tables");
        let formHasError = false;
        let tablesData = []

        tables.forEach((table, i) => {
            const index = i + 1;
            const data = {
                nombre: table.querySelector(`input[name="nombre"]`).value,
                sillas: table.querySelector(`input[name="sillas"]`).value,
                imagen: table.querySelector(`input[name="imagen"]`) ? table.querySelector(`input[name="imagen"]`).files[0] : "",
                vip: table.querySelector(`input[name="vip"]`).checked,
            };
            tablesData.push(data)

            const errors = validate(data, rules);
            setValidationStyles(`input-name-tables-${index}`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-chair-tables-${index}`, errors?.sillas ? errors.sillas[0] : null);
            setValidationStyles(`input-image-tables-${index}`, errors?.imagen ? errors.imagen[0] : null);
            if (errors) {
                formHasError = true;
            }
        });

        if (!formHasError) {
            let data = new FormData()
            tablesData.forEach((table, index) => {
                data.append(`lista[${index}][nombre]`, table.nombre);
                data.append(`lista[${index}][sillas]`, table.sillas);
                data.append(`lista[${index}][imagen_name]`, table.imagen.name);
                data.append(`lista[${index}][imagen]`, table.imagen);
                data.append(`lista[${index}][vip]`, table.vip == true ? 1 : 0);
            })
            resetForm("#tables-container .tables", form)
            add(config, "table", data, () => binnacle(session.message.id, "Mesas", "Agregar", "Se agrego una mesa"))
            bootstrap.Modal.getOrCreateInstance('#register-table').hide()
        }
    });
    form.dataset.listenerAttached = "true";
}
const editData = (response) => {
    let hasError = false
    document.querySelector("#input-name-table").value = response[0].nombre;
    document.querySelector("#input-chair-table").value = response[0].sillas;
    document.querySelector("#img-table-response").src = "media/table/" + response[0].imagen;
    document.querySelector("#input-vip-table").checked = response[0].vip == 1 ? true : false;
    document.querySelector("#input-id-table").value = response[0].id;
    const data = {
        nombre: document.querySelector(`#input-name-table`).value,
        sillas: document.querySelector(`#input-chair-table`).value,
        imagen: document.querySelector(`#input-image-table`) ? document.querySelector(`#input-image-table`).files[0] : "",
        vip: document.querySelector(`#input-vip-table`).checked,
    };
    const errors = validate(data, rules2);
    setValidationStyles(`input-name-table`, errors?.nombre ? errors.nombre[0] : null);
    setValidationStyles(`input-chair-table`, errors?.sillas ? errors.sillas[0] : null);
    if (errors) hasError = true;

    let formEdit = document.querySelector("#form-submit-edit-table")
    if (!formEdit.dataset.listenerAttached) {
        formEdit.addEventListener("submit", (e) => {
            e.preventDefault()
            const data = {
                nombre: document.querySelector(`#input-name-table`).value,
                sillas: document.querySelector(`#input-chair-table`).value,
                imagen: document.querySelector(`#input-image-table`) ? document.querySelector(`#input-image-table`).files[0] : "",
                vip: document.querySelector(`#input-vip-table`).checked,
            };
            const errors = validate(data, rules2);
            setValidationStyles(`input-name-table`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-chair-table`, errors?.sillas ? errors.sillas[0] : null);
            if (errors) hasError = true;
            else hasError = false
            if (!hasError) {
                let dataFinal = new FormData()
                dataFinal.append(`id`, document.querySelector("#input-id-table").value);
                dataFinal.append(`nombre`, data.nombre);
                dataFinal.append(`sillas`, data.sillas);
                dataFinal.append(`vip`, data.vip == true ? 1 : 0);
                if (document.querySelector(`#input-image-table`).value != "") {
                    dataFinal.append(`imagen`, data.imagen);
                    dataFinal.append(`imagen_name`, data.imagen.name);
                }
                update(config, "table", dataFinal, () => binnacle(session.message.id, "Mesas", "Edicion", "Se Edito un mesa"))
                bootstrap.Modal.getOrCreateInstance('#edit-table').hide()
            }
        })
        form.dataset.listenerAttached = "true";
    }
}
// IntroJs
document.getElementById('navbarDropdown').addEventListener('click', function () {
    if (typeof introJs !== 'undefined') {
        let intro = introJs();
        intro.setOptions({
            steps: [
                {
                    element: document.querySelector('.page-wrapper'),
                    intro: 'Bienvenido a la seccion de mesas, aqui podras ver y gestionr todas las mesas registradas de tu negocio.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('#home-tab'),
                    intro: 'Aqui podrás ver las mesas que estan libres, puedes agregar, editar o eliminar mesas.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('#profile-tab'),
                    intro: 'Aqui podras ver las mesas que estan ocupadas, puedes ver los detalles de las mesas.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('#SearchTablesFREE'),
                    intro: 'Puedes buscar mesas por nombre, si no hay resultados se mostrará una marca de agua con el logo del negocio.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('#register-table-button'),
                    intro: 'Puedes registrar una nueva mesa, debes ingresar el nombre de la mesa, la cantidad de sillas, una imagen representativa de la mesa y si es VIP.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('.card'),
                    intro: 'Puedes ver los detalles de la mesa, puedes editar o eliminar la mesa.',
                    position: 'bottom'
                }
            ],
            showBullets: true,
            exitOnOverlayClick: false,
            showProgress: true
        });
        intro.start();
    }
});
attachValidationListeners(1);
print(config);
print({ ...config, search: () => searchParam({ active: 1, estado: "OCUPADA" }, "table"), container: ".cont_tables_occupied" });