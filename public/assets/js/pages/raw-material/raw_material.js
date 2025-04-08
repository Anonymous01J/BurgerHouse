import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";

const { validateField, setValidationStyles, SelectOption, reindex, resetForm } = functionGeneral();
const { elemenFormRawMaterial } = Templates()



// ------------------Funcion de select de categoria y receta---------------------------

SelectOption()

// ------------------Validaciones---------------------------

let RawmaterialCount = 1;

function addRawMaterial() {
    RawmaterialCount++;
    document.getElementById("rawmaterial-container").insertAdjacentHTML('beforeend', elemenFormRawMaterial(RawmaterialCount));
    feather.replace();
    SelectOption()

    attachValidationListeners(RawmaterialCount);

    const newProduct = document.getElementById(`rawmaterial-${RawmaterialCount}`);
    newProduct.querySelector(".remove-rawmaterial").addEventListener("click", function () {
        newProduct.remove();
        reindex("#rawmaterial-container .rawmaterial", "rawmaterial", RawmaterialCount, "Materia Prima");
    });
}
function attachValidationListeners(index) {
    const RawmaterialElement = document.getElementById(`rawmaterial-${index}`);
    RawmaterialElement.querySelectorAll("input[type='text']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
    });
}

document.getElementById("add-rawmaterial-btn").addEventListener("click", addRawMaterial);

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
};

let form = document.getElementById("form-submit-rawMaterial")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", function (e) {
        e.preventDefault()
        const rawmaterial = document.querySelectorAll(".rawmaterial");
        let formHasError = false;
        let material = []
        rawmaterial.forEach((rawmaterial, i) => {
            const index = i + 1;
            let data = {
                nombre: rawmaterial.querySelector(`input[name="nombre"]`).value,
                id_categoria: rawmaterial.querySelector(`input[name="id_categoria"]`).value ? rawmaterial.querySelector(`input[name="id_categoria"]`).value : "",
                id_unidad: rawmaterial.querySelector(`input[name="id_unidad"]`).value ? rawmaterial.querySelector(`input[name="id_unidad"]`).value : "",
            }
            material.push(data)

            const errors = validate(data, rules);
            setValidationStyles(`input-name-rawMaterial-${index}`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-category-rawMaterial-${index}`, errors?.id_categoria ? errors.id_categoria[0] : null);
            setValidationStyles(`input-unit-rawMaterial-${index}`, errors?.id_unidad ? errors.id_unidad[0] : null);
            if (errors) {
                formHasError = true;
            }
        })

        if (!formHasError) {
            resetForm("#rawmaterial-container .rawmaterial", form)
            console.log(material);
        }
    });
    form.dataset.listenerAttached = "true";
}
attachValidationListeners(1)