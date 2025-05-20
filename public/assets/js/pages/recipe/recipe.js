import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";

const { InputPrice, selectOptionAll, setValidationStyles, validateField, reindex, resetForm } = functionGeneral();
const { elemenFormRecipe, optionsRol, optionsRawMaterial } = Templates()
InputPrice("[input_price]");
// SelectOption()
selectOptionAll(".select_options_product", "productPrepared", optionsRol)
selectOptionAll(".select_options_rawmaterial", "rawmaterial", optionsRawMaterial)
let RecipeCount = 1;
function addRecipe() {
    RecipeCount++;
    document.getElementById("recipes-container").insertAdjacentHTML('beforeend', elemenFormRecipe(RecipeCount));
    feather.replace();
    selectOptionAll(".select_options_product", "productPrepared", optionsRol)
    selectOptionAll(".select_options_rawmaterial", "rawmaterial", optionsRawMaterial)
    InputPrice("[input_price]");
    attachValidationListeners(RecipeCount);

    const newProduct = document.getElementById(`recipes-${RecipeCount}`);
    newProduct.querySelector(".remove-recipe").addEventListener("click", function () {
        newProduct.remove();
        reindex("#recipes-container .recipes", "recipes", RecipeCount, "Item");
    });
}
function attachValidationListeners(index) {
    const recipeElement = document.getElementById(`recipes-${index}`);
    recipeElement.querySelectorAll("input[type='text'], input[type='button']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
    });
}
document.getElementById("input-product-recipe").addEventListener("change", (e) => validateField(e, rules2));

document.getElementById("add-recipe-btn").addEventListener("click", () => {
    addRecipe()
    reindex("#recipes-container .recipes", "recipes", RecipeCount, "Item")
});
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
    id_producto: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateRecipe: { message: "^es requerido" }
    },
};
let form = document.getElementById("form-submit-recipes")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", function (e) {
        e.preventDefault();
        const recipe = document.querySelectorAll(".recipes");
        let formHasError = false;
        let recetaData = [];
        recipe.forEach((recipe, i) => {
            const index = i + 1;
            const data = {
                cantidad: recipe.querySelector(`input[name="cantidad"]`).value.replace(/\./g, '').replace(',', '.'),
                id_rawmaterial: recipe.querySelector(`input[name="id_rawmaterial"]`).getAttribute("data-id"),
            };
            const errors = validate(data, rules);
            setValidationStyles(`input-quantity-recipe-${index}`, errors?.cantidad ? errors.cantidad[0] : null);
            setValidationStyles(`input-rawmaterial-recipe-${index}`, errors?.id_rawmaterial ? errors.id_rawmaterial[0] : null);
            if (errors) {
                formHasError = true;
            }
            recetaData.push(data)
        });
        const productId = document.getElementById("input-product-recipe").getAttribute("data-id");
        const errorsName = validate({ id_producto: productId }, { id_producto: rules2.id_producto });
        setValidationStyles("input-product-recipe", errorsName?.id_producto ? errorsName.id_producto[0] : null);
        if (errorsName) {
            formHasError = true;
        }
        if (!formHasError) {
            let data = new FormData();
            data.append(`id_producto`, productId);
            recetaData.forEach((item, index) => {
                data.append(`lista[${index}][id_materia_prima]`, item.id_rawmaterial);
                data.append(`lista[${index}][cantidad]`, item.cantidad);
            })
            const nose = async () => {
                let pet = await fetch('recipe/add', { method: 'POST', body: data })
                let res = await pet.json()
                console.log(res);
            }
            nose()
            resetForm("#recipes-container .recipes", form)
            document.getElementById("input-product-recipe").classList.remove("is-invalid", "is-valid");
            document.getElementById("input-product-recipe").value = "Seleccione una opcion";
            document.getElementById("input-product-recipe").setAttribute("data-id", "Seleccione una opcion")
        }
    });
    form.dataset.listenerAttached = "true";
}
attachValidationListeners(1);

async function renderizarTarjetas() {
    // 1) Obtener datos
    const resp = await fetch("Detallerecipe/get_all/0/10000000/id/asc");
    const data = await resp.json();
  
    const agrupado = data.reduce((acum, item) => {
      const nombre = item.nombre+"-"+"id_receta:"+item.id_receta+"-"+"active:"+item.active;
      if (!acum[nombre]) acum[nombre] = [];
      acum[nombre].push(item);
      return acum;
    }, {});
  
    Object.entries(agrupado).forEach(([receta, ingredientes]) => {
      if (receta.split("-")[2].split(":")[1] != 0) {
        console.log(receta, ingredientes);
      }
    });
  }

renderizarTarjetas();