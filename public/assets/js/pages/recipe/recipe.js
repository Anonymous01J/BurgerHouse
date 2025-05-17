import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";

const { InputPrice, SelectOption, setValidationStyles, validateField, reindex, resetForm } = functionGeneral();
const { elemenFormRecipe } = Templates()
InputPrice("[input_price]");
SelectOption()

let RecipeCount = 1;
function addRecipe() {
    RecipeCount++;
    document.getElementById("recipe-container").insertAdjacentHTML('beforeend', elemenFormRecipe(RecipeCount));
    feather.replace();
    SelectOption()
    InputPrice("[input_price]");
    attachValidationListeners(RecipeCount);

    const newProduct = document.getElementById(`recipe-${RecipeCount}`);
    newProduct.querySelector(".remove-recipe").addEventListener("click", function () {
        newProduct.remove();
        reindex("#recipe-container .recipe", "recipe", RecipeCount, "Receta");
    });
}
function attachValidationListeners(index) {
    const recipeElement = document.getElementById(`recipe-${index}`);
    recipeElement.querySelectorAll("input[type='text'], input[type='button']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
    });
}
document.getElementById("input-recipe-recipe").addEventListener("change", (e) => validateField(e, rules2));

document.getElementById("add-recipe-btn").addEventListener("click", addRecipe);
validate.validators.nombreValidator = function (value, options, key, attributes) {
    if (!value) return;

    if (!/^[A-Z]/.test(value)) {
        return options.uppercaseMessage;
    }

    if (!/^[A-Za-z0-9\s]*$/.test(value)) {
        return options.specialCharMessage;
    }
};
validate.validators.cantidad = function (value, options, key, attributes) {
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
validate.validators.validateRecipe = function (value, options, key, attributes) {
    if (!value) {
        return options.message || "es requerido";
    }
    if (value.toLowerCase() === "seleccione una opcion") {
        return options.message || "es requerido";
    }
};
const rules = {
    cantidad: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        cantidad: { message: "^debe ser un número mayor a 0" }
    },
    id_rawmaterial: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateRecipe: { message: "^es requerido" }
    },
};
const rules2 = {
    cantidad: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        cantidad: { message: "^debe ser un número mayor a 0" }
    },
    id_rawmaterial: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateRecipe: { message: "^es requerido" }
    },
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
    id_receta: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateRecipe: { message: "^es requerido" }
    },
};
let form = document.getElementById("form-submit-recipe")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", function (e) {
        e.preventDefault();
        const recipe = document.querySelectorAll(".recipe");
        let formHasError = false;

        recipe.forEach((recipe, i) => {
            const index = i + 1;
            const data = {
                cantidad: recipe.querySelector(`input[name="cantidad"]`).value,
                id_rawmaterial: recipe.querySelector(`input[name="id_rawmaterial"]`) ? recipe.querySelector(`input[name="id_rawmaterial"]`).value : "",
            };
            const errors = validate(data, rules);
            setValidationStyles(`input-quantity-recipe-${index}`, errors?.cantidad ? errors.cantidad[0] : null);
            setValidationStyles(`input-rawmaterial-recipe-${index}`, errors?.id_rawmaterial ? errors.id_rawmaterial[0] : null);
            if (errors) {
                formHasError = true;
            }
        });
        const recipeName = document.getElementById("input-recipe-recipe").value;
        const errorsName = validate({ id_receta: recipeName }, { id_receta: rules2.id_receta });
        setValidationStyles("input-recipe-recipe", errorsName?.id_receta ? errorsName.id_receta[0] : null);
        if (errorsName) {
            formHasError = true;
        }
        if (!formHasError) {
            resetForm("#recipe-container .recipe", form)
            document.getElementById("input-recipe-recipe").classList.remove("is-invalid", "is-valid");
            document.getElementById("input-recipe-recipe").value = "Seleccione una opcion";
        }
    });
    form.dataset.listenerAttached = "true";
}
attachValidationListeners(1);

const nose = async () => {
    let data = new FormData();
    data.append(`lista[0][id_producto]`, combo.nombre);
    data.append(`lista[0][id_receta]`, combo.precio);
    data.append(`lista[0][id_categoria]`, combo.id_categoria);
    data.append(`lista[0][detalles]`, combo.detalles);
    data.append(`lista[0][imagen_name]`, combo.imagen.name);
    data.append(`lista[0][imagen]`, combo.imagen);
    data.append(`lista[0][tipo]`, "producto");
    let pet = await fetch('recipe/add_many', {
        method: 'POST',
        body: data
    })
    let res = await pet.json()
    console.log(res);
}