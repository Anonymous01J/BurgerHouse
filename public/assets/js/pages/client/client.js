import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { SelectOption, setValidationStyles, validateField, searchAll, print, add, reindex, resetForm } = functionGeneral();
const { elemenFormClient } = Templates()

SelectOption()
let iti = window.intlTelInput(document.querySelector("#input-tel-client-1"), { initialCountry: "ve", separateDialCode: true, utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js" });

// ------------------Validacion de Formulario---------------------------
let ClientCount = 1;
function addClient() {
    ClientCount++;
    document.getElementById("client-container").insertAdjacentHTML('beforeend', elemenFormClient(ClientCount));
    feather.replace();
    SelectOption()
    let iti = window.intlTelInput(document.querySelector(`#input-tel-client-${ClientCount}`), { initialCountry: "ve", separateDialCode: true, utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js" });

    attachValidationListeners(ClientCount);

    const newClient = document.getElementById(`client-${ClientCount}`);
    newClient.querySelector(".remove-client").addEventListener("click", function () {
        newClient.remove();
        reindex("#client-container .client", "client", ClientCount, "Cliente");
    });
}
function attachValidationListeners(index) {
    const productElement = document.getElementById(`client-${index}`);
    productElement.querySelectorAll("input[type='text'], textarea, input[type='button'], input[type='tel']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
        input.addEventListener("change", (e) => validateField(e, rules));
    });
}
document.getElementById("add-client-btn").addEventListener("click", () => {
    addClient()
    reindex("#client-container .client", "client", ClientCount, "Cliente");
});

validate.validators.telefonoValido = function (value) {
    if (!value) return
    if (!iti.isValidNumber()) {
        const pais = iti.getSelectedCountryData().name;
        return `^Número inválido para ${pais}`;
    }
};
validate.validators.validateTD = function (value, options, key, attributes) {
    if (!value) {
        return options.message || "es requerido";
    }
    if (value.toLowerCase() === "seleccione una opcion") {
        return options.message || "es requerido";
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
            message: "^debe tener al menos 3 caracteres"
        },
    },
    apellido: {
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
            message: "^debe tener al menos 3 caracteres"
        },
    },
    documento: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        format: {
            pattern: "^[0-9]+$",
            message: "^solo puede tener numeros"
        }
    },
    telefono: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        telefonoValido: true

    },
    direccion: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
    },
    tipo_documento: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateTD: { message: "^es requerido" }
    }
};

let form = document.getElementById("form-submit-client")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", function (e) {
        e.preventDefault();
        const client = document.querySelectorAll(".client");
        let formHasError = false;
        let dataClient = []

        client.forEach((client, i) => {
            const index = i + 1;
            const data = {
                nombre: client.querySelector(`input[name="nombre"]`).value,
                apellido: client.querySelector(`input[name="apellido"]`).value,
                tipo_documento: client.querySelector(`input[name="tipo_documento"]`) ? client.querySelector(`input[name="tipo_documento"]`).value : "",
                telefono: window.intlTelInput(client.querySelector(`input[name="telefono"]`), { initialCountry: "ve", separateDialCode: true, utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js" }).getNumber(),
                documento: client.querySelector(`input[name="documento"]`) ? client.querySelector(`input[name="documento"]`).value : "",
                direccion: client.querySelector(`textarea[name="direccion"]`) ? client.querySelector(`textarea[name="direccion"]`).value : "",
            };
            dataClient.push(data)
            const errors = validate(data, rules);
            setValidationStyles(`input-name-client-${index}`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-lastname-client-${index}`, errors?.apellido ? errors.apellido[0] : null);
            setValidationStyles(`input-td-client-${index}`, errors?.tipo_documento ? errors.tipo_documento[0] : null);
            setValidationStyles(`input-doc-client-${index}`, errors?.documento ? errors.documento[0] : null);
            setValidationStyles(`input-tel-client-${index}`, errors?.telefono ? errors.telefono[0] : null);
            setValidationStyles(`input-direction-client-${index}`, errors?.direccion ? errors.direccion[0] : null);
            if (errors) {
                formHasError = true;
            }
        });

        if (!formHasError) {
            let dataFinal = []
            dataClient.forEach((client) => {
                dataFinal.push({
                    nombre: client.nombre,
                    apellido: client.apellido,
                    telefono: client.telefono,
                    direccion: client.direccion,
                    documento: client.tipo_documento + client.documento
                })
            })
            resetForm("#client-container .client", form)
        }
    });
    form.dataset.listenerAttached = "true";
}
attachValidationListeners(1)