// ----------------Parse de los inputs de tipo price-----------------------------

import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { InputPrice, SelectOption, viewImage, setValidationStyles,validateField, searchAll, print, add } = functionGeneral();
const { targetCombo, elemenFormCombo } = Templates()

InputPrice("[input_price]");

// ------------------Funcion de select de categoria y receta---------------------------

SelectOption()
viewImage(".input-image")

// ------------------Validacion de Formulario---------------------------




// document.querySelectorAll("#form-submit-edit-combo input[type='text'], #form-submit-edit-combo textarea").forEach(input => {
//     input.addEventListener("keyup", (e) => { validateField(e, rules) });
//     input.addEventListener("blur", (e) => { validateField(e, rules) });
// });

// document.getElementById("form-submit-edit-combo").addEventListener("submit", (e) => {
//     e.preventDefault()

//     let data = {
//         nombre: document.getElementById("input-name-combo").value,
//         precio: document.getElementById("input-price-combo").value,
//         id_categoria: document.getElementById("input-category-combo").value,
//         id_receta: document.getElementById("input-recipe-combo").value,
//         detalles: document.getElementById("input-details-combo").value,
//         imagen: document.getElementById("input-image-combo").files[0]
//     }

//     const errors = validate(data, rules);

//     setValidationStyles("input-name-combo", errors?.nombre ? errors.nombre[0] : null);
//     setValidationStyles("input-price-combo", errors?.precio ? errors.precio[0] : null);
//     setValidationStyles("input-category-combo", errors?.id_categoria ? errors.id_categoria[0] : null);
//     setValidationStyles("input-recipe-combo", errors?.id_receta ? errors.id_receta[0] : null);
//     setValidationStyles("input-details-combo", errors?.detalles ? errors.detalles[0] : null);
//     setValidationStyles("input-image-combo", errors?.imagen ? errors.imagen[0] : null);

//     if (!errors) {
//         alert("Formulario enviado correctamente");
//         // this.reset();

//         // const inputs = this.querySelectorAll(".is-valid, .is-invalid");
//         // inputs.forEach(function (input) {
//         //     input.classList.remove("is-valid", "is-invalid");
//         // });

//         // const errorMessages = this.querySelectorAll(".text-danger");
//         // errorMessages.forEach(function (error) {
//         //     error.textContent = "";
//         // });
//     }
// })


// Contador global de productos. Inicia en 1 porque ya existe un producto por defecto.
let productCount = 1;

function addProduct() {
  productCount++;
  document.getElementById("products-container").insertAdjacentHTML('beforeend', elemenFormCombo(productCount));
  feather.replace();
  viewImage(".input-image")
  InputPrice("[input_price]");
  SelectOption()

  attachValidationListeners(productCount);

  const newProduct = document.getElementById(`product-${productCount}`);
  newProduct.querySelector(".remove-product").addEventListener("click", function () {
    newProduct.remove();
    reindexProducts(); 
  });
}

function attachValidationListeners(index) {
  const productElement = document.getElementById(`product-${index}`);
  productElement.querySelectorAll("input[type='text'], textarea, input[type='button'], input[type='file']").forEach(input => {
    input.addEventListener("keyup", (e) => validateField(e, rules));
    input.addEventListener("blur", (e) => validateField(e, rules));
    input.addEventListener("change", (e) => validateField(e, rules));
  });
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
      precio: product.querySelector(`input[name="precio"]`).value.replace(/\./g, '').replace(',', '.'),
      id_categoria: product.querySelector(`input[name="id_categoria"]`) ? product.querySelector(`input[name="id_categoria"]`).value : "",
      id_receta: product.querySelector(`input[name="id_receta"]`) ? product.querySelector(`input[name="id_receta"]`).value : "",
      detalles: product.querySelector(`textarea[name="detalles"]`) ? product.querySelector(`textarea[name="detalles"]`).value : "",
      imagen: product.querySelector(`input[name="imagen"]`) ? product.querySelector(`input[name="imagen"]`).files[0]: ""
    };
    combo.push(data)

    const errors = validate(data, rules);
    setValidationStyles(`input-name-combo-${index}`, errors?.nombre ? errors.nombre[0] : null);
    setValidationStyles(`input-price-combo-${index}`, errors?.precio ? errors.precio[0] : null);
    setValidationStyles(`input-category-combo-${index}`, errors?.id_categoria ? errors.id_categoria[0] : null);
    setValidationStyles(`input-recipe-combo-${index}`, errors?.id_receta ? errors.id_receta[0] : null);
    setValidationStyles(`input-details-combo-${index}`, errors?.detalles ? errors.detalles[0] : null);
    setValidationStyles(`input-image-combo-${index}`, errors?.imagen ? errors.imagen[0] : null);
    if (errors) {
      formHasError = true;
    }
  });

  if (!formHasError) {
    let form = new FormData()
    combo.forEach((combo, index) => {
      form.append(`combo[${index}][nombre]`, combo.nombre);
      form.append(`combo[${index}][precio]`, combo.precio);
      form.append(`combo[${index}][id_categoria]`, combo.id_categoria);
      form.append(`combo[${index}][id_receta]`, combo.id_receta);
      form.append(`combo[${index}][detalles]`, combo.detalles);
      form.append(`combo[${index}][imagen]`, combo.imagen);
    })
    add('combo', form, targetCombo, ".cont-combos")
    // bootstrap.Modal.getOrCreateInstance('#register-combo').hide()
  }
});

attachValidationListeners(1)

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
  id_categoria: {
    presence: {
      allowEmpty: false,
      message: "^es requerida"
    },
    validateCategoryAndRecipe: { message: "^es requerido" }
  },
  id_receta: {
    presence: {
      allowEmpty: false,
      message: "^es requerida"
    },
    validateCategoryAndRecipe: { message: "^es requerido" }
  },
  detalles: {
    presence: {
      allowEmpty: false,
      message: "^es requerido"
    },
    length: {
      minimum: 15,
      message: "^debe tener al menos 15 caracteres"
    }
  },
  imagen: {
    presence: {
      allowEmpty: false,
      message: "^es requerido"
    }
  },
};


print(searchAll("combo", 1), targetCombo, ".cont-combos")