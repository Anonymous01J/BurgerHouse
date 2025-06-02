import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";

const { InputPrice, selectOptionAll, setValidationStyles, validateField, reindex, resetForm, edit, searchParam, sessionInfo, binnacle } = functionGeneral();
const { elemenFormRecipe, optionsRol, optionsRawMaterial, targetRecipe, itemIngredientes, elemenFormEditRecipe } = Templates()
InputPrice("[input_price]");
selectOptionAll(".select_options_product", "productPrepared", optionsRol)
selectOptionAll(".select_options_rawmaterial", "rawmaterial", optionsRawMaterial)
let session = await sessionInfo()
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
            const add = async () => {
                let pet = await fetch('recipe/add', { method: 'POST', body: data })
                let res = await pet.json()
                if (res.success == true) {
                    Swal.fire({
                        title: `Exito!`,
                        text: "El elemento fue agregado correctamente",
                        icon: "success",
                    });
                    renderizarTarjetas({});
                    binnacle(session.message.id, "Recetas", "Agregar", "Se agrego una nueva receta")
                } else {
                    Swal.fire({
                        title: `Error!`,
                        text: "El elemento no fue agregado",
                        icon: "error",
                    });
                }
            }
            add()
            resetForm("#recipes-container .recipes", form)
            document.getElementById("input-product-recipe").classList.remove("is-invalid", "is-valid");
            document.getElementById("input-product-recipe").value = "Seleccione una opcion";
            document.getElementById("input-product-recipe").setAttribute("data-id", "Seleccione una opcion")
        }
    });
    form.dataset.listenerAttached = "true";
}
attachValidationListeners(1);

async function renderizarTarjetas(param) {
    let templatejk = "";
    const data = await searchParam(param, "recipe")
    data.forEach(async (item) => {
        let data2 = await searchParam({ id_receta: item.id }, "Detallerecipe", 468468468486)
        templatejk += targetRecipe(item, data2);
        document.querySelector(".cont_recipe").innerHTML = templatejk;
        feather.replace();
        edit((response) => {
            let objectActual = response;
            let objectSend = [];
            let data = new FormData();
            let template = "";
            let index = 0;
            document.getElementById("recipe-edit-container").innerHTML = "";
            response.forEach((item, i) => {
                index++;
                template += elemenFormEditRecipe(index, item);
            });
            document.getElementById("recipe-edit-container").innerHTML = template;
            selectOptionAll(".select_options_edit_rawmaterial", "rawmaterial", optionsRawMaterial);
            InputPrice("[input_price]");
            feather.replace();
            document.querySelectorAll(".recipe-edit").forEach((item, i) => {
                item.querySelectorAll("input[type='text'], input[type='button']").forEach((input) => {
                    input.addEventListener("keyup", (e) => validateField(e, rules));
                });
            });
            if (!document.getElementById("add-recipe-edit-btn").dataset.listenerAttached) {
                document.getElementById("add-recipe-edit-btn").addEventListener("click", async () => {
                    index++;
                    document.getElementById("recipe-edit-container").innerHTML += elemenFormEditRecipe(index);
                    feather.replace();
                    selectOptionAll(".select_options_edit_rawmaterial", "rawmaterial", optionsRawMaterial);
                    InputPrice("[input_price]");
                    document.querySelectorAll(".recipe-edit").forEach((item, i) => {
                        item.querySelectorAll("input[type='text'], input[type='button']").forEach((input) => {
                            input.addEventListener("keyup", (e) => validateField(e, rules));
                        });
                    });
                    reindex("#recipe-edit-container .recipe-edit", "recipe-edit", index, "Item");
                    deleteItem();
                });
                document.getElementById("add-recipe-edit-btn").dataset.listenerAttached = "true";
            }
            const deleteItem = async () => {
                document.querySelectorAll(".remove-recipe").forEach((item, i) => {
                    item.addEventListener("click", async function () {
                        item.closest(".recipe-edit").remove();
                        let id = item.getAttribute("data-id");
                        data.append(`id`, id);
                        let pet = await fetch(`Detallerecipe/delete`, { method: "POST", body: data });
                        reindex("#recipe-edit-container .recipe-edit", "recipe-edit", index, "Item");
                    });
                });
            };
            deleteItem();

            let formEdit = document.getElementById("form-submit-edit-recipe");
            if (!formEdit.dataset.listenerAttached) {
                formEdit.addEventListener("submit", function (e) {
                    e.preventDefault();
                    let formHasError = false;
                    let recetaData = [];
                    formEdit.querySelectorAll(".recipe-edit").forEach((recipe, i) => {
                        let index = i + 1;
                        let data = {
                            cantidad: recipe.querySelector(`input[name="cantidad"]`).value.replace(/\./g, '').replace(',', '.'),
                            id_rawmaterial: recipe.querySelector(`input[name="id_rawmaterial"]`).getAttribute("data-id"),
                        };
                        recetaData.push(data);
                        const errors = validate(data, rules);
                        setValidationStyles(`input-edit-quantity-${index}`, errors?.cantidad ? errors.cantidad[0] : null);
                        setValidationStyles(`input-edit-rawmaterial-${index}`, errors?.id_rawmaterial ? errors.id_rawmaterial[0] : null);
                        if (errors) formHasError = true;
                    });
                    if (!formHasError) {
                        let unod = []
                        objectActual.forEach((item, i) => {
                            unod.push({cantidad: item.cantidad, id_rawmaterial: item.id_materia_prima});
                        })
                        const comparation = (a, b) => a.id_rawmaterial === b.id_rawmaterial && a.cantidad === b.cantidad;
                        const unicosEnUno = recetaData.filter(obj1 => !unod.some(obj2 => comparation(obj1, obj2)));
                        const unicosEnDos = unod.filter(obj2 => !recetaData.some(obj1 => comparation(obj1, obj2)));
                        console.log("receta nueva", unicosEnUno);
                        console.log("receta vieja", unicosEnDos);
                    }
                });
                formEdit.dataset.listenerAttached = "true";
            }
        });
    })

}

renderizarTarjetas({});