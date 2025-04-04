import functionGeneral from "../../Functions.js";
const { validateField, setValidationStyles, SelectOption } = functionGeneral();


// ------------------Funcion de select de categoria y receta---------------------------

SelectOption()

// ------------------Validaciones---------------------------


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

    categoria: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateCategoryAndRecipe: { message: "^es requerido" }
    },
    unidad: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateCategoryAndUnit: { message: "^es requerido" }
    },
};

document.querySelector("#form-submit-rawMaterial input[type='text']").addEventListener("keyup",(e)=>{validateField(e, rules)})
document.querySelector("#form-submit-rawMaterial input[type='text']").addEventListener("blur",(e)=>{validateField(e, rules)})

document.getElementById("form-submit-rawMaterial").addEventListener("submit", (e) => {
    e.preventDefault()

    let data = {
        nombre: document.getElementById("input-name-rawMaterial").value,
        categoria: document.getElementById("input-category-rawMaterial").value,
        unidad: document.getElementById("input-unit-rawMaterial").value,
    }

    const errors = validate(data, rules);

    setValidationStyles("input-name-rawMaterial", errors?.nombre ? errors.nombre[0] : null);
    setValidationStyles("input-category-rawMaterial", errors?.categoria ? errors.categoria[0] : null);
    setValidationStyles("input-unit-rawMaterial", errors?.categoria ? errors.categoria[0] : null);

    if (!errors) {
        alert("Formulario enviado correctamente");
        // this.reset();

        // const inputs = this.querySelectorAll(".is-valid, .is-invalid");
        // inputs.forEach(function (input) {
        //     input.classList.remove("is-valid", "is-invalid");
        // });

        // const errorMessages = this.querySelectorAll(".text-danger");
        // errorMessages.forEach(function (error) {
        //     error.textContent = "";
        // });
    }
})