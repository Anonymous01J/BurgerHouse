// ----------------Parse de los inputs de tipo price-----------------------------

import functionGeneral from "../../Functions.js";
const { InputPrice, SelectOption, viewImage, setValidationStyles } = functionGeneral();

InputPrice("[input_price]");

// ------------------Funcion de select de categoria y receta---------------------------

SelectOption()
viewImage(".input-image")

// ------------------Validacion de Formulario---------------------------

// validate.validators.precio = function (value, options, key, attributes) {
//     if (!value) return;
//     const cleanValue = value.replace(/\./g, '').replace(',', '.');
//     const numberValue = parseFloat(cleanValue);

//     if (isNaN(numberValue)) {
//         return options.message || "no es un número válido";
//     }
//     if (numberValue <= 0) {
//         return options.message || "debe ser un número mayor a 0";
//     }
// };

// validate.validators.validateCategoryAndRecipe = function (value, options, key, attributes) {
//     if (!value) {
//         return options.message || "es requerido";
//     }
//     if (value.toLowerCase() === "seleccione una opcion") {
//         return options.message || "es requerido'";
//     }
// };

// validate.validators.nombreValidator = function (value, options, key, attributes) {
//     if (!value) return;

//     if (!/^[A-Z]/.test(value)) {
//         return options.uppercaseMessage;
//     }

//     if (!/^[A-Za-z0-9\s]*$/.test(value)) {
//         return options.specialCharMessage;
//     }
// };


// const rules = {
//     nombre: {
//         nombreValidator: {
//             uppercaseMessage: "^debe tener la primera letra en mayúscula.",
//             specialCharMessage: "^No se permiten signos como puntos (.) o comas (,)."
//         },
//         presence: {
//             allowEmpty: false,
//             message: "^es requerido"
//         },
//         length: {
//             minimum: 4,
//             message: "^debe tener al menos 4 caracteres"
//         },
//         format: {
//             pattern: /^[A-Z].*/,
//             message: "^debe empezar con mayuscula"
//         },
//     },
//     precio: {
//         presence: {
//             allowEmpty: false,
//             message: "^es requerido"
//         },
//         precio: { message: "^debe ser un número mayor a 0" }
//     },
//     categoria: {
//         presence: {
//             allowEmpty: false,
//             message: "^es requerida"
//         },
//         validateCategoryAndRecipe: { message: "^es requerido" }
//     },
//     receta: {
//         presence: {
//             allowEmpty: false,
//             message: "^es requerida"
//         },
//         validateCategoryAndRecipe: { message: "^es requerido" }
//     },
//     descripcion: {
//         presence: {
//             allowEmpty: false,
//             message: "^es requerido"
//         },
//         length: {
//             minimum: 15,
//             message: "^debe tener al menos 15 caracteres"
//         }
//     },
//     img: {
//         presence: {
//             allowEmpty: false,
//             message: "^es requerido"
//         }
//     },
// };

// document.querySelectorAll("#form-submit-combo input[type='text'], #form-submit-combo textarea").forEach(input => {
//     input.addEventListener("keyup", (e) => { validateField(e, rules) });
//     input.addEventListener("blur", (e) => { validateField(e, rules) });
// });

// document.getElementById("form-submit-combo").addEventListener("submit", (e) => {
//     e.preventDefault()

//     let data = {
//         nombre: document.getElementById("input-name-combo").value,
//         precio: document.getElementById("input-price-combo").value,
//         categoria: document.getElementById("input-category-combo").value,
//         receta: document.getElementById("input-recipe-combo").value,
//         descripcion: document.getElementById("input-description-combo").value,
//         img: document.getElementById("input-img-combo").value
//     }

//     const errors = validate(data, rules);

//     setValidationStyles("input-name-combo", errors?.nombre ? errors.nombre[0] : null);
//     setValidationStyles("input-price-combo", errors?.precio ? errors.precio[0] : null);
//     setValidationStyles("input-category-combo", errors?.categoria ? errors.categoria[0] : null);
//     setValidationStyles("input-recipe-combo", errors?.receta ? errors.receta[0] : null);
//     setValidationStyles("input-description-combo", errors?.descripcion ? errors.descripcion[0] : null);
//     setValidationStyles("input-img-combo", errors?.img ? errors.img[0] : null);

//     if (!errors) {
//         alert("Formulario enviado correctamente");
//         // this.reset();

//         const inputs = this.querySelectorAll(".is-valid, .is-invalid");
//         inputs.forEach(function (input) {
//             input.classList.remove("is-valid", "is-invalid");
//         });

//         const errorMessages = this.querySelectorAll(".text-danger");
//         errorMessages.forEach(function (error) {
//             error.textContent = "";
//         });
//     }
// })


// Contador global de productos. Inicia en 1 porque ya existe un producto por defecto.
let productCount = 1;

// Función para crear y agregar un nuevo grupo de inputs (producto)
function addProduct() {
  productCount++;
  const productHTML = `
      <div class="row g-2 product" id="product-${productCount}">
        <div class="d-flex align-items-center gap-4 mb-3">
            <h2 class="m-0">Combo ${productCount}</h2>
            <button type="button" class="btn btn-circle btn-secondary remove-product">
                <i data-feather="trash"></i>
            </button>
        </div>

        <div class="col-md-3">
          <label for="input-name-combo-${productCount}" class="form-label">Nombre</label>
          <input type="text" class="form-control" placeholder="Nombre" id="input-name-combo-${productCount}" name="nombre">
          <div class="text-danger mt-1 fs-6" id="error-input-name-combo-${productCount}"></div>
        </div>
        <div class="col-md-3">
          <label for="input-price-combo-${productCount}" class="form-label">Precio</label>
          <div class="input-group">
            <span class="input-group-text">$</span>
            <input type="text" class="form-control w-75" placeholder="Precio" input_price id="input-price-combo-${productCount}" name="precio">
            <div class="text-danger mt-1 fs-6" id="error-input-price-combo-${productCount}"></div>
          </div>
        </div>
        <div class="col-md-3">
          <label for="input-category-combo-${productCount}" class="form-label">Categoria</label>
          <div class="dropdown">
            <div class="dropdown">
              <div class="btn-group w-100" bis_skin_checked="1">
                <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-category-combo-${productCount}" name="categoria">
                <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span><i data-feather="chevron-down"></i></span>
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
          <div class="text-danger mt-1 fs-6" id="error-input-category-combo-${productCount}"></div>
        </div>
        <div class="col-md-3">
          <label for="input-recipe-combo-${productCount}" class="form-label">Receta</label>
          <div class="dropdown">
            <div class="dropdown">
              <div class="btn-group w-100" bis_skin_checked="1">
                <input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-recipe-combo-${productCount}" name="receta">
                <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span><i data-feather="chevron-down"></i></span>
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
          <div class="text-danger mt-1 fs-6" id="error-input-recipe-combo-${productCount}"></div>
        </div>
        <div class="col-12">
          <label for="input-description-combo-${productCount}" class="form-label">Descripcion</label>
          <textarea placeholder="Descripcion" class="form-control" id="input-description-combo-${productCount}" rows="5" name="descripcion"></textarea>
          <div class="text-danger mt-1 fs-6" id="error-input-description-combo-${productCount}"></div>
        </div>
        <div class="col-12">
          <label for="input-img-combo-${productCount}" class="form-label">Imagen</label>
          <input class="form-control input-image" type="file" id="input-img-combo-${productCount}" name="img">
          <div class="text-danger mt-1 fs-6" id="error-input-img-combo-${productCount}"></div>
          <img src="" alt="Vista previa" style="max-width: 200px; display: none;">
        </div>
        <div class="bg-secondary my-5" style="font-size: 1px;"> 2</div>
        <input type="submit" class="d-none" id="submit-combo">
      </div>
    `;
  document.getElementById("products-container").insertAdjacentHTML('beforeend', productHTML);
  feather.replace();
  viewImage(".input-image")
  InputPrice("[input_price]");
  SelectOption()



  // Asigna validación a los nuevos inputs
  attachValidationListeners(productCount);

  // Asigna listener para el botón de eliminación
  const newProduct = document.getElementById(`product-${productCount}`);
  newProduct.querySelector(".remove-product").addEventListener("click", function () {
    newProduct.remove();  // Elimina el producto del DOM
    reindexProducts();    // Reindexa los productos restantes
  });
}

function attachValidationListeners(index) {
  const productElement = document.getElementById(`product-${index}`);
  productElement.querySelectorAll("input[type='text'], textarea, input[type='button'], input[type='file']").forEach(input => {
    input.addEventListener("keyup", (e) => validateField(e, index));
    input.addEventListener("blur", (e) => validateField(e, index));
    input.addEventListener("change", (e) => validateField(e, index));
  });
}

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

function reindexProducts() {
  const products = document.querySelectorAll("#products-container .product");
  productCount = products.length;

  products.forEach((product, index) => {
    const newIndex = index + 1;
    product.id = `product-${newIndex}`;

    product.querySelectorAll("input, textarea").forEach(input => {
      const parts = input.id.split("-");
      const baseId = parts.slice(0, parts.length - 1).join("-");
      const newId = `${baseId}-${newIndex}`;
      input.id = newId;
    });
    product.querySelectorAll("[id^='error-input']").forEach(errorDiv => {
      const parts = errorDiv.id.split("-");
      const newId = `${parts[0]}-${parts[1]}-${parts[2]}-${parts[3]}-${newIndex}`;
      errorDiv.id = newId;
    });

    const header = product.querySelector("h2");
    if (header) {
      header.textContent = `Combo ${newIndex}`;
    }
  });
}

// Asigna listener al botón para agregar nuevos productos
document.getElementById("add-product-btn").addEventListener("click", addProduct);

// Evento submit para validar todos los productos
document.getElementById("form-submit-combo").addEventListener("submit", function (e) {
  e.preventDefault();
  const products = document.querySelectorAll(".product");
  let formHasError = false;
  let combo = []

  products.forEach((product, i) => {
    const index = i + 1;
    const data = {
      nombre: product.querySelector(`input[name="nombre"]`).value,
      precio: product.querySelector(`input[name="precio"]`).value,
      categoria: product.querySelector(`input[name="categoria"]`) ? product.querySelector(`input[name="categoria"]`).value : "",
      receta: product.querySelector(`input[name="receta"]`) ? product.querySelector(`input[name="receta"]`).value : "",
      descripcion: product.querySelector(`textarea[name="descripcion"]`) ? product.querySelector(`textarea[name="descripcion"]`).value : "",
      img: product.querySelector(`input[name="img"]`) ? product.querySelector(`input[name="img"]`).value : ""
    };
    combo.push(data)

    const errors = validate(data, rules);
    setValidationStyles(`input-name-combo-${index}`, errors?.nombre ? errors.nombre[0] : null);
    setValidationStyles(`input-price-combo-${index}`, errors?.precio ? errors.precio[0] : null);
    setValidationStyles(`input-category-combo-${index}`, errors?.categoria ? errors.categoria[0] : null);
    setValidationStyles(`input-recipe-combo-${index}`, errors?.receta ? errors.receta[0] : null);
    setValidationStyles(`input-description-combo-${index}`, errors?.descripcion ? errors.descripcion[0] : null);
    setValidationStyles(`input-img-combo-${index}`, errors?.img ? errors.img[0] : null);
    if (errors) {
      formHasError = true;
    }
  });

  if (!formHasError) {
    alert("Todos los productos fueron validados correctamente");
    // Aquí enviarías los datos al servidor
    $.ajax({
      type: "POST",
      url: "combo/add_many",
      data: { combo },
      success: function (response) {
        console.log(response);
       
      }
    })
  }
});

// Si se desea, asigna validación inicial al producto por defecto
attachValidationListeners(1);



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

