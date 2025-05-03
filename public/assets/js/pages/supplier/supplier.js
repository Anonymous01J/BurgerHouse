// ----------------Parse de los inputs de tipo price-----------------------------
import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { SelectOption,selectOptionAll, setValidationStyles, validateField, searchAll, print, add, reindex, resetForm } = functionGeneral();
const { elemenFormSupplier } = Templates()

selectOptionAll(".select_options_td_edit", null)
selectOptionAll(".select_options_td", null)

let iti = window.intlTelInput(document.querySelector("#input-num1-supplier-1"), { initialCountry: "ve", separateDialCode: true, utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js" });
window.intlTelInput(document.querySelector("#input-num2-supplier-1"), { initialCountry: "ve", separateDialCode: true, utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js", });
window.intlTelInput(document.querySelector("#input-num2-supplier"), { initialCountry: "ve", separateDialCode: true, utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js", });
window.intlTelInput(document.querySelector("#input-num2-supplier"), { initialCountry: "ve", separateDialCode: true, utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js", });

// ------------------Validacion de Formulario---------------------------
let SupplierCount = 1;
function addSupplier() {
    SupplierCount++;
    document.getElementById("suppliers-container").insertAdjacentHTML('beforeend', elemenFormSupplier(SupplierCount));
    feather.replace();
    selectOptionAll(".select_options_td", null)
    const input = document.querySelector(`#input-num1-supplier-${SupplierCount}`);
    const iti = window.intlTelInput(input, {
        initialCountry: "ve",
        separateDialCode: true,
        utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js"
    });
    const input2 = document.querySelector(`#input-num2-supplier-${SupplierCount}`);
    const iti2 = window.intlTelInput(input2, {
        initialCountry: "ve",
        separateDialCode: true,
        utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js",
    });
    attachValidationListeners(SupplierCount);

    const newSupplier = document.getElementById(`suppliers-${SupplierCount}`);
    newSupplier.querySelector(".remove-supplier").addEventListener("click", function () {
        newSupplier.remove();
        reindex("#suppliers-container .suppliers", "supplier", SupplierCount, "Proveedor");
    });
}
function attachValidationListeners(index) {
    const productElement = document.getElementById(`suppliers-${index}`);
    productElement.querySelectorAll("input[type='text'], textarea, input[type='button'], input[type='tel']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
        input.addEventListener("change", (e) => validateField(e, rules));
    });
}
document.getElementById("add-supplier-btn").addEventListener("click", () => {
    addSupplier()
    reindex("#suppliers-container .suppliers", "supplier", SupplierCount, "Proveedor");
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
            message: "^debe tener al menos 4 caracteres"
        },
    },
    razonSocial: {
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
    rif: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        format: {
            pattern: "^[0-9]+$",
            message: "^solo puede tener numeros"
        }
    },
    n_telefono1: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        telefonoValido: true

    },
    n_telefono2: {
        presence: {
            allowEmpty: true,
        },
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
let form = document.getElementById("form-submit-suppliers")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", function (e) {
        e.preventDefault();
        const supplier = document.querySelectorAll(".suppliers");
        let formHasError = false;
        let dataSupplier = []

        supplier.forEach((supplier, i) => {
            const index = i + 1;
            const data = {
                nombre: supplier.querySelector(`input[name="nombre"]`).value,
                razonSocial: supplier.querySelector(`input[name="razonSocial"]`).value,
                tipo_documento: supplier.querySelector(`input[name="tipo_documento"]`) ? supplier.querySelector(`input[name="tipo_documento"]`).value : "",
                n_telefono1: window.intlTelInput(supplier.querySelector(`input[name="n_telefono1"]`), { initialCountry: "ve", separateDialCode: true, utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js" }).getNumber(),
                n_telefono2: window.intlTelInput(supplier.querySelector(`input[name="n_telefono2"]`), { initialCountry: "ve", separateDialCode: true, utilsScript: "./assets/libs/libs/intl-tel-input/js/utils.js" }).getNumber(),
                rif: supplier.querySelector(`input[name="rif"]`) ? supplier.querySelector(`input[name="rif"]`).value : "",
                direccion: supplier.querySelector(`textarea[name="direccion"]`) ? supplier.querySelector(`textarea[name="direccion"]`).value : "",
            };
            dataSupplier.push(data)
            const errors = validate(data, rules);
            setValidationStyles(`input-name-supplier-${index}`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-razonSocial-supplier-${index}`, errors?.razonSocial ? errors.razonSocial[0] : null);
            setValidationStyles(`input-td-supplier-${index}`, errors?.tipo_documento ? errors.tipo_documento[0] : null);
            setValidationStyles(`input-rif-supplier-${index}`, errors?.rif ? errors.rif[0] : null);
            setValidationStyles(`input-num1-supplier-${index}`, errors?.n_telefono1 ? errors.n_telefono1[0] : null);
            setValidationStyles(`input-num2-supplier-${index}`, errors?.n_telefono2 ? errors.n_telefono2[0] : null);
            setValidationStyles(`input-direction-supplier-${index}`, errors?.direccion ? errors.direccion[0] : null);
            if (errors) {
                formHasError = true;
            }
        });

        if (!formHasError) {
            resetForm("#suppliers-container .suppliers", form)
        }
    });
    form.dataset.listenerAttached = "true";
}
attachValidationListeners(1)