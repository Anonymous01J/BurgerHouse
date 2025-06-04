import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { InputPrice, update, selectOptionAll, viewImage, setValidationStyles, validateField, searchParam, Delete, edit, print, add, reindex, resetForm, permission, searchFilter, sessionInfo, binnacle } = functionGeneral();
const { targetProductPrepared, elemenFormCombo, optionsRol } = Templates()
const tooltip = new bootstrap.Tooltip(document.querySelector(".btn-add-tooltip"))
InputPrice("[input_price]");
selectOptionAll(".select_options_category_combo", "categoryProducto", optionsRol)
viewImage(".input-image")
let session = await sessionInfo();
const config = {
  search: () => searchParam({ active: 1, tipo: "producto" }, "productPrepared"),
  template: targetProductPrepared,
  container: ".cont-product",
  funtions: () => {
    Delete(config, () => binnacle(session.message.id, 'Productos Preparados', 'Eliminacion', 'Se elimino un producto preparado'));
    edit((response) => editData(response));
    document.querySelectorAll(".edit_btn, .trash_btn").forEach((element) => { let tooltip = new bootstrap.Tooltip(element) });
  },
}
searchFilter("#searchProduct", (e) => {
  if (e.target.value == "") print(config)
  else print({ ...config, search: () => searchParam({ active: 1, tipo: "producto", nombre_like: e.target.value }, "productPrepared") })
})
// ------------------Validacion de Formulario---------------------------

// Contador global de productos. Inicia en 1 porque ya existe un producto por defecto.
let productCount = 1;
function addProduct() {
  productCount++;
  document.getElementById("products-container").insertAdjacentHTML('beforeend', elemenFormCombo(productCount));
  feather.replace();
  selectOptionAll(".select_options_category_combo", "categoryProducto", optionsRol)

  viewImage(".input-image")
  InputPrice("[input_price]");

  attachValidationListeners(productCount);

  const newProduct = document.getElementById(`product-${productCount}`);
  newProduct.querySelector(".remove-product").addEventListener("click", function () {
    newProduct.remove();
    reindex("#products-container .product", "product", productCount, "Producto");
  });
}
function attachValidationListeners(index) {
  const productElement = document.getElementById(`product-${index}`);
  productElement.querySelectorAll("input[type='text'], textarea, input[type='button'], input[type='file']").forEach(input => {
    input.addEventListener("keyup", (e) => validateField(e, rules));
    input.addEventListener("blur", (e) => validateField(e, rules));
    input.addEventListener("change", (e) => validateField(e, rules));
  });

  const productElement2 = document.getElementById(`product-container`);
  productElement2.querySelectorAll("input[type='text'], textarea, input[type='button']").forEach(input => {
    input.addEventListener("keyup", (e) => validateField(e, rules));
    input.addEventListener("blur", (e) => validateField(e, rules));
    input.addEventListener("change", (e) => validateField(e, rules));
  });
}
document.getElementById("add-product-btn").addEventListener("click", () => {
  addProduct();
  reindex("#products-container .product", "product", productCount, "Producto");
});
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
const rules2 = {
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
};
let form = document.getElementById("form-submit-combo")
if (!form.dataset.listenerAttached) {
  form.addEventListener("submit", function (e) {
    e.preventDefault();
    const products = document.querySelectorAll(".product");
    let formHasError = false;
    let combo = []

    products.forEach((product, i) => {
      const index = i + 1;
      const data = {
        nombre: product.querySelector(`input[name="nombre"]`).value,
        precio: product.querySelector(`input[name="precio"]`).value.replace(/\./g, '').replace(',', '.'),
        id_categoria: product.querySelector(`input[name="id_categoria"]`).getAttribute("data-id"),
        detalles: product.querySelector(`textarea[name="detalles"]`) ? product.querySelector(`textarea[name="detalles"]`).value : "",
        imagen: product.querySelector(`input[name="imagen"]`) ? product.querySelector(`input[name="imagen"]`).files[0] : ""
      };
      combo.push(data)
      const errors = validate(data, rules);
      setValidationStyles(`input-name-combo-${index}`, errors?.nombre ? errors.nombre[0] : null);
      setValidationStyles(`input-price-combo-${index}`, errors?.precio ? errors.precio[0] : null);
      setValidationStyles(`input-category-combo-${index}`, errors?.id_categoria ? errors.id_categoria[0] : null);
      setValidationStyles(`input-details-combo-${index}`, errors?.detalles ? errors.detalles[0] : null);
      setValidationStyles(`input-image-combo-${index}`, errors?.imagen ? errors.imagen[0] : null);
      if (errors) {
        formHasError = true;
      }
    });

    if (!formHasError) {
      let data = new FormData()
      combo.forEach((combo, index) => {
        data.append(`lista[${index}][nombre]`, combo.nombre);
        data.append(`lista[${index}][precio]`, combo.precio);
        data.append(`lista[${index}][id_categoria]`, combo.id_categoria);
        data.append(`lista[${index}][detalles]`, combo.detalles);
        data.append(`lista[${index}][imagen_name]`, combo.imagen.name);
        data.append(`lista[${index}][imagen]`, combo.imagen);
        data.append(`lista[${index}][tipo]`, "producto");
      })
      resetForm("#products-container .product", form)
      add(config, 'productPrepared', data, () => binnacle(session.message.id, "Productos Preparados", "Agregar", "Se agrego un producto preparado")
      )
      bootstrap.Modal.getOrCreateInstance('#register-product').hide()
    }
  });
  form.dataset.listenerAttached = "true";
}
attachValidationListeners(1)
print(config)
function editData(response) {
  let hasError = false
  document.querySelector("#input-name-combo").value = response[0].nombre
  document.querySelector("#input-id-combo").value = response[0].id
  document.querySelector("#input-price-combo").value = (response[0].precio).toString().replace(/\./g, ',')
  document.querySelector("#input-category-combo").value = response[0].nombre_categoria
  document.querySelector("#input-category-combo").setAttribute("data-id", response[0].id_categoria)
  document.querySelector("#input-details-combo").value = response[0].detalles
  document.querySelector("#img-combo-response").src = `media/productPrepared/${response[0].imagen}`
  let data = {
    nombre: document.querySelector(`#input-name-combo`).value,
    precio: document.querySelector(`#input-price-combo`).value.replace(/\./g, '').replace(',', '.'),
    id_categoria: document.querySelector(`#input-category-combo`).getAttribute("data-id"),
    detalles: document.querySelector(`#input-details-combo`) ? document.querySelector(`#input-details-combo`).value : "",
  }
  const errors = validate(data, rules2);
  if (errors) hasError = true
  setValidationStyles(`input-name-combo`, errors?.nombre ? errors.nombre[0] : null);
  setValidationStyles(`input-price-combo`, errors?.precio ? errors.precio[0] : null);
  setValidationStyles(`input-category-combo`, errors?.id_categoria ? errors.id_categoria[0] : null);
  setValidationStyles(`input-details-combo`, errors?.detalles ? errors.detalles[0] : null);

  let formEdit = document.getElementById("form-submit-edit-combo")
  if (!formEdit.dataset.listenerAttached) {
    formEdit.addEventListener("submit", function (e) {
      e.preventDefault();
      let data = {
        nombre: document.querySelector(`#input-name-combo`).value,
        precio: document.querySelector(`#input-price-combo`).value.replace(/\./g, '').replace(',', '.'),
        id_categoria: document.querySelector(`#input-category-combo`).getAttribute("data-id"),
        detalles: document.querySelector(`#input-details-combo`) ? document.querySelector(`#input-details-combo`).value : "",
      }
      const errors = validate(data, rules2);
      if (errors) hasError = true
      else hasError = false
      setValidationStyles(`input-name-combo`, errors?.nombre ? errors.nombre[0] : null);
      setValidationStyles(`input-price-combo`, errors?.precio ? errors.precio[0] : null);
      setValidationStyles(`input-category-combo`, errors?.id_categoria ? errors.id_categoria[0] : null);
      setValidationStyles(`input-details-combo`, errors?.detalles ? errors.detalles[0] : null);

      if (!hasError) {
        let datafinal = new FormData()
        datafinal.append("nombre", document.querySelector("#input-name-combo").value)
        datafinal.append("precio", document.querySelector("#input-price-combo").value.replace(/\./g, '').replace(',', '.'))
        datafinal.append("id_categoria", document.querySelector("#input-category-combo").getAttribute("data-id"))
        datafinal.append("detalles", document.querySelector("#input-details-combo").value)
        datafinal.append("id", document.querySelector("#input-id-combo").value)
        if (document.querySelector("#input-image-combo").value != "") {
          console.log("object");
          datafinal.append("imagen_name", document.querySelector("#input-image-combo").files[0].name)
          datafinal.append("imagen", document.querySelector("#input-image-combo").files[0])
        }
        update(config, 'productPrepared', datafinal, () => binnacle(session.message.id, "Productos Preparados", "Actualizacion", "Se actualizo un producto preparado")
        )
        bootstrap.Modal.getOrCreateInstance('#edit-product').hide()
      }
    })
    form.dataset.listenerAttached = "true";
  }
}