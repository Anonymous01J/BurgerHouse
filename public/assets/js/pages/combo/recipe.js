import functionGeneral from "../../Functions.js";
const { InputPrice, SelectOption, setValidationStyles } = functionGeneral();
InputPrice("[input_price]");
SelectOption()


let RecipeCount = 1;

function addRecipe() {
    RecipeCount++;
    const productHTML = `
    <div class="row g-2 recipe" id="recipe-${RecipeCount}">
        <div class="col-md-5 ">
            <label for="inputCity" class="form-label">Receta</label>
            <div class="dropdown">
                <div class="dropdown">
                    <div class="btn-group w-100" bis_skin_checked="1">
                        <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-recipe-recipe-${RecipeCount}" name="receta">
                        <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span> <i data-feather="chevron-down"></i></span>
                        </button>
                        <div class="dropdown-menu p-2" bis_skin_checked="1">
                            <div>
                                <input class="form-control" type="text" placeholder="Buscar">
                            </div>
                            <a class="dropdown-item">Action</a>
                            <a class="dropdown-item">Another action</a>
                            <a class="dropdown-item">Something else here</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-danger mt-1 fs-6" id="error-input-recipe-recipe-${RecipeCount}"></div>
        </div>

        <div class="col-md-6">
            <label for="inputEmail4" class="form-label">Cantidad</label>
            <div class="input-group">
                <span class="input-group-text">G</span>
                <input type="text" class="form-control w-75" placeholder="Cantidad" input_price id="input-quantity-recipe-${RecipeCount}" name="cantidad">
                <div class="text-danger mt-1 fs-6" id="error-input-quantity-recipe-${RecipeCount}"></div>
            </div>
        </div>
        
        <div class="col-md-1">
            <label for="inputEmail4" class="form-label"></label>

            <div class="input-group">
                <button type="button" class="btn btn-circle btn-secondary remove-recipe">
                <i data-feather="trash"></i>
            </button>
            </div>
             
        </div>
        <input type="submit" class="d-none" id="submit-recipe">
    </div>
    `;
    document.getElementById("recipe-container").insertAdjacentHTML('beforeend', productHTML);
    feather.replace();

    attachValidationListeners(RecipeCount);

    const newProduct = document.getElementById(`recipe-${RecipeCount}`);
    newProduct.querySelector(".remove-recipe").addEventListener("click", function () {
        newProduct.remove(); 
        reindexRecipe();   
    });
}

function attachValidationListeners(index) {
    const recipeElement = document.getElementById(`recipe-${index}`);
    recipeElement.querySelectorAll("input[type='text'], input[type='button']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, index));
        input.addEventListener("blur", (e) => validateField(e, index));
    });
}
document.getElementById("input-name-recipe").addEventListener("keyup",(e)=> validateField(e))
document.getElementById("input-name-recipe").addEventListener("blur",(e)=> validateField(e))

function validateField(event, index) {
    const field = event.target;
    const fieldName = field.name;
    const fieldValue = field.value;
    const data = { [fieldName]: fieldValue };
    const fieldRules = { [fieldName]: rules[fieldName] };

    const errors = validate(data, fieldRules);
    const errorMessage = errors ? errors[fieldName][0] : null;
    setValidationStyles(field.id, errorMessage);
}

function reindexRecipe() {
    const recipe = document.querySelectorAll("#recipe-container .recipe");
    RecipeCount = recipe.length;

    recipe.forEach((recipe, index) => {
        const newIndex = index + 1;
        recipe.id = `recipe-${newIndex}`;

        recipe.querySelectorAll("input").forEach(input => {
            const parts = input.id.split("-");
            const baseId = parts.slice(0, parts.length - 1).join("-");
            const newId = `${baseId}-${newIndex}`;
            input.id = newId;
        });
        recipe.querySelectorAll("[id^='error-input']").forEach(errorDiv => {
            const parts = errorDiv.id.split("-");
            const newId = `${parts[0]}-${parts[1]}-${parts[2]}-${parts[3]}-${newIndex}`;
            errorDiv.id = newId;
        });
    });
}

document.getElementById("add-recipe-btn").addEventListener("click", addRecipe);

document.getElementById("form-submit-recipe").addEventListener("submit", function (e) {
    e.preventDefault();
    const recipe = document.querySelectorAll(".recipe");
    let formHasError = false;

    recipe.forEach((recipe, i) => {
        const index = i + 1;
        const data = {
            precio: recipe.querySelector(`input[name="cantidad"]`).value,
            receta: recipe.querySelector(`input[name="receta"]`) ? recipe.querySelector(`input[name="receta"]`).value : "",
        };

        const errors = validate(data, rules);
        setValidationStyles(`input-quantity-recipe-${index}`, errors?.cantidad ? errors.cantidad[0] : null);
        setValidationStyles(`input-recipe-recipe-${index}`, errors?.receta ? errors.receta[0] : null);
        if (errors) {
            formHasError = true;
        }
    });

    const recipeName = document.getElementById("input-name-recipe").value;
    const errorsName = validate({ nombre: recipeName }, { nombre: rules.nombre });
    setValidationStyles("input-name-recipe", errorsName?.nombre ? errorsName.nombre[0] : null);
    if (errorsName) {
        formHasError = true;
    }

    if (!formHasError) {
        alert("Todos los productos fueron validados correctamente");
        // Aquí enviarías los datos al servidor
    }
});

// Si se desea, asigna validación inicial al producto por defecto
attachValidationListeners(1);

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
    receta: {
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
};