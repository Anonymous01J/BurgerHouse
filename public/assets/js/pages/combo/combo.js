// ----------------Parse de los inputs de tipo price-----------------------------

import functionGeneral from "../../Functions.js";
const { InputPrice, validateField, setValidationStyles, SelectOption } = functionGeneral();

InputPrice("[input_price]");

// ------------------Funcion de select de categoria y receta---------------------------

SelectOption()

// ------------------Validacion de Formulario---------------------------

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

validate.validators.validateCategoryAndRecipe = function (value, options, key, attributes) {
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
    precio: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        precio: { message: "^debe ser un número mayor a 0" }
    },
    categoria: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateCategoryAndRecipe: { message: "^es requerido" }
    },
    receta: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateCategoryAndRecipe: { message: "^es requerido" }
    },
    descripcion: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        length: {
            minimum: 15,
            message: "^debe tener al menos 15 caracteres"
        }
    },
    img: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        }
    },
};

document.querySelectorAll("#form-submit-combo input[type='text'], #form-submit-combo textarea").forEach(input => {
    input.addEventListener("keyup", (e) => { validateField(e, rules) });
    input.addEventListener("blur", (e) => { validateField(e, rules) });
});

document.getElementById("form-submit-combo").addEventListener("submit", (e) => {
    e.preventDefault()

    let data = {
        nombre: document.getElementById("input-name-combo").value,
        precio: document.getElementById("input-price-combo").value,
        categoria: document.getElementById("input-category-combo").value,
        receta: document.getElementById("input-recipe-combo").value,
        descripcion: document.getElementById("input-description-combo").value,
        img: document.getElementById("input-img-combo").value
    }

    const errors = validate(data, rules);

    setValidationStyles("input-name-combo", errors?.nombre ? errors.nombre[0] : null);
    setValidationStyles("input-price-combo", errors?.precio ? errors.precio[0] : null);
    setValidationStyles("input-category-combo", errors?.categoria ? errors.categoria[0] : null);
    setValidationStyles("input-recipe-combo", errors?.receta ? errors.receta[0] : null);
    setValidationStyles("input-description-combo", errors?.descripcion ? errors.descripcion[0] : null);
    setValidationStyles("input-img-combo", errors?.img ? errors.img[0] : null);

    if (!errors) {
        alert("Formulario enviado correctamente");
        // this.reset();

        const inputs = this.querySelectorAll(".is-valid, .is-invalid");
        inputs.forEach(function (input) {
            input.classList.remove("is-valid", "is-invalid");
        });

        const errorMessages = this.querySelectorAll(".text-danger");
        errorMessages.forEach(function (error) {
            error.textContent = "";
        });
    }
})