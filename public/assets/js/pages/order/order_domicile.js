import functionGeneral from "../../Functions.js"
import Templates from "../../templates.js"
const { searchParam, amountDolar, viewImage, InputPrice, selectOptionAll, validateField, setValidationStyles } = functionGeneral()
const { tagFilterProduct, selectProduct, targetDetailProductOrder, targetDetailOtherOrder, targetClienteOrder, optionsRol, elemenFormPaymentOrder } = Templates()
viewImage(".input-image")
InputPrice("[input_price]");
selectOptionAll(".select_options_payment", "paymentMethod", optionsRol);
let toas = (type, msj) => {
    const Toast = Swal.mixin({
        toast: true,
        position: "bottom-end",
        showConfirmButton: false,
        timer: 1000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.onmouseenter = Swal.stopTimer;
            toast.onmouseleave = Swal.resumeTimer;
        }
    });
    Toast.fire({
        icon: `${type}`,
        title: `${msj}`
    });
}
const plusBtn = () => {
    const plusTriggers = document.querySelectorAll(".plusTrigger");
    plusTriggers.forEach((trigger) => {
        const container = trigger.closest(".counter-container");
        const input = container.querySelector("input");
        const plusBtn = container.querySelector(".plusBtn");
        const minusBtn = container.querySelector(".minusBtn");

        let counter = 0;

        if (input.value > 0) {
            counter = input.value;
            container.classList.add("active");
            container.style.width = "110px"
        }

        trigger.addEventListener("click", () => {
            if (counter === 0) {
                counter = 1;
                input.value = counter;
            }
            container.classList.add("active");
            container.style.width = "110px"
            amount()
        });

        plusBtn.addEventListener("click", () => {
            counter++;
            input.value = counter;
            amount()
        });

        minusBtn.addEventListener("click", () => {
            counter--;
            if (counter >= 1) {
                input.value = counter;
                amount()
            } else {
                counter = 0;
                input.value = counter;
                container.classList.remove("active");
                container.style.width = ""
                amount()
            }
        });
    });
}
const initPopover = async () => {
    let data = []
    let pet = await searchParam({ active: 1, tipo: "adicional" }, "additional", 100);
    pet.forEach((item) => {
        data.push({
            value: item.nombre,
            id: item.id,
            precio: item.precio
        });
    })
    // const popoverTriggers = document.querySelectorAll('.popover-button');
    // for (const pop of popoverTriggers) {
    //     let template = "";
    //     let additional = await searchParam({ active: 1, tipo: "adicional" }, "additional", 100);
    //     additional.forEach((item) => {
    //         template += tagAdditional(item);
    //     });
    //     const footer = `
    //         <div class="popover-footer d-flex justify-content-end">
    //             <button type="button" class="btn btn-sm btn-secondary me-2 cancelarPopover">Cancelar</button>
    //             <button type="submit" form="form-popover" class="btn btn-sm bh_1 text-white add_adicional">Agregar</button>
    //         </div>
    //     `;
    //     const contentWrapper = pop.nextElementSibling;
    //     contentWrapper.innerHTML = `
    //         ${template}
    //         ${footer}
    //     `;
    //     const popover = new bootstrap.Popover(pop, {
    //         html: true,
    //         content: contentWrapper.innerHTML,
    //         placement: 'right',
    //         sanitize: false,
    //         customClass: 'w-50'
    //     });

    //     pop.addEventListener('shown.bs.popover', () => {
    //         document.querySelectorAll('.cancelarPopover').forEach((item) => {
    //             item.addEventListener('click', () => {
    //                 bootstrap.Popover.getInstance(pop)?.hide();
    //             })
    //         })
    //         document.querySelectorAll('.add_adicional').forEach((item) => {
    //             item.addEventListener('click', () => {
    //                 let container = item.parentElement.parentElement.querySelectorAll(".form-check");
    //                 let template = "";
    //                 container.forEach((item) => {
    //                     if (item.querySelector('input').checked) {
    //                         pop.parentElement.classList.remove("d-flex");
    //                         pop.parentElement.classList.remove("align-items-center");
    //                         template +=
    //                             `<h4 class="border rounded-pill fs-6 d-flex justify-content-between align-items-center px-2" precio="${item.querySelector('input').getAttribute('precio')}">
    //                                 <p class="m-0">${item.querySelector('input').value}</p>
    //                                 <i style="cursor: pointer;" data-feather="x" class="remove_adicional"></i>
    //                             </h4>`;
    //                     }
    //                 });
    //                 pop.parentElement.innerHTML = template;
    //                 amount()
    //                 bootstrap.Popover.getInstance(pop)?.hide();
    //                 feather.replace();
    //                 document.querySelectorAll('.remove_adicional').forEach((removeItem) => {
    //                     removeItem.addEventListener('click', () => {
    //                         if (removeItem.parentElement.parentElement.childElementCount == 1) {
    //                             removeItem.parentElement.parentElement.classList.add("d-flex");
    //                             removeItem.parentElement.parentElement.classList.add("align-items-center");
    //                             removeItem.parentElement.parentElement.innerHTML = `
    //                             <div class="d-flex flex-column align-items-center justify-content-center p-3 popover-button">
    //                                 <i data-feather="plus-circle"></i>
    //                                 <h4 class="m-0">Adicional</h4>
    //                             </div>
    //                             <div class="popover-content" style="display: none;"></div>
    //                         `
    //                             feather.replace();
    //                             initPopover();
    //                             amount()
    //                         } else {
    //                             removeItem.parentElement.remove();
    //                             amount()
    //                         }
    //                     });
    //                 });
    //             });
    //         })
    //     });
    // }
    document.querySelectorAll('textarea[name="tags"]').forEach((input) => {
        let tagify = new Tagify(input, {
            whitelist: data,
            maxTags: 10,
            dropdown: {
                maxItems: 20,
                classname: 'tags-look',
                enabled: 0,
                closeOnSelect: false
            }
        })

        tagify.on('add', amount);
        tagify.on('remove', amount);
    })
};
const amount = async () => {
    let subT = []
    let priceAdditional = []
    let count1 = document.querySelector(".cont-details-product-order-food").children
    for (const key of count1) {
        let price = parseFloat(key.querySelector("h4").textContent.replace("$", "").replace("Precio:", ""))
        let quantity = parseInt(key.querySelector(".counter-container").querySelector("input").value)
        subT.push(price * quantity)
        // key.querySelectorAll(".count_additional").forEach((item) => {
        //     item.querySelectorAll("h4").forEach((h) => {
        //         if (h.getAttribute("precio")) priceAdditional.push(parseFloat(h.getAttribute("precio")))
        //         else priceAdditional.push(0)
        //     })
        // })
        key.querySelectorAll("tag").forEach((item) => {
            priceAdditional.push(parseFloat(item.getAttribute("precio")))
        })
    }
    let count2 = document.querySelector(".cont-details-product-order-other").children
    for (const key of count2) {
        let price = parseFloat(key.querySelector("h4").textContent.replace("$", "").replace("Precio:", ""))
        let quantity = parseInt(key.querySelector(".counter-container").querySelector("input").value)
        subT.push(price * quantity)
    }

    //MONTOS DE EL DETALLE
    document.querySelector(".subtotal").textContent = "SUBTOTAL: " + (subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)).toFixed(2) + " $"
    document.querySelector(".iva").textContent = "IVA: " + ((subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)) * 0.16).toFixed(2) + " $"
    document.querySelector(".total-amount").textContent = "TOTAL: " + ((subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)) + subT.reduce((a, b) => a + b, 0) * 0.16).toFixed(2) + " $" + " ------ " + (((subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)) + subT.reduce((a, b) => a + b, 0) * 0.16) * await amountDolar()).toFixed(2) + " BS"

    //MONTOS DE EL PAGO
    document.querySelector(".amount_payment_usd").textContent = ((subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)) + subT.reduce((a, b) => a + b, 0) * 0.16).toFixed(2)
    document.querySelector(".amount_payment_bs").textContent = (((subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)) + subT.reduce((a, b) => a + b, 0) * 0.16) * await amountDolar()).toFixed(2)
}
// funcion para los filtros de productos y carga de productos
const filter = () => {
    let inputs = document.querySelectorAll(".btn-check")
    inputs.forEach((input) => {
        input.addEventListener("click", () => {
            let filter = input.getAttribute("data-filter");
            let products = document.querySelectorAll("[data-filter-id]")
            products.forEach((product) => {
                let filterID = product.getAttribute("data-filter-id");
                if (filterID == filter) product.classList.remove("d-none")
                else product.classList.add("d-none")

                if (filter == "all") product.classList.remove("d-none")
            })
        })
    })
}
const categoryFilter = async () => {
    let template = "";
    let category = await searchParam({ active: 1 }, "categoryProducto", 100)
    category.forEach((category) => { template += tagFilterProduct(category); })
    document.querySelector(".cont_category_product_orders").insertAdjacentHTML("beforeend", template)
    filter()
}
const products = async () => {
    let templatePrepared = "";
    let templateProcess = "";
    let productProcess = await searchParam({ active: 1 }, "productProcess", 100)
    let productPrepared = await searchParam({ active: 1 }, "productPrepared", 100)
    productPrepared.forEach((product) => { templatePrepared += selectProduct(product, "productPrepared"); })
    productProcess.forEach((product) => { templateProcess += selectProduct(product, "productProcess"); })
    document.querySelector(".cont-select-product-order").insertAdjacentHTML("beforeend", templatePrepared)
    document.querySelector(".cont-select-product-order").insertAdjacentHTML("beforeend", templateProcess)
    categoryFilter()
    plusBtn()
    productForDetails()
    feather.replace()
}
products()
//valida q si no hay productos, no puede pasar al step 2
const productForDetails = () => {
    let btn = document.querySelector(".select_product_btn_next")
    btn.addEventListener("click", () => {
        let data = []
        let cantidad = []
        let products = document.querySelectorAll("[data-filter-id]")
        products.forEach((product) => {
            let input = product.querySelector(".counter-container").querySelector('input').value
            cantidad.push(input)
        })
        let sum = cantidad.reduce((a, b) => parseFloat(a) + parseFloat(b), 0);
        if (sum == 0) toas("error", "Seleccione al menos un producto")
        else {
            stepper.next()
            products.forEach((product) => {
                let input = product.querySelector(".counter-container").querySelector('input').value
                if (input != 0) {
                    for (let index = 0; index < input; index++) {
                        data.push({
                            id: product.getAttribute("data-id"),
                            type: product.getAttribute("tipo"),
                            nombre: product.getAttribute("nombre"),
                            imagen: product.getAttribute("imagen"),
                            precio: product.getAttribute("precio"),
                            cantidad: input
                        })
                    }
                }
            })
            let templateProduct = "";
            let templateOther = "";
            data.forEach((product) => {
                if (product.type == "producto") templateProduct += targetDetailProductOrder(product)
                else templateOther += targetDetailOtherOrder(product)
            })
            document.querySelector(".cont-details-product-order-food").innerHTML = templateProduct
            document.querySelector(".cont-details-product-order-other").innerHTML = templateOther
            initPopover()
            feather.replace()
            plusBtn()
            amount()
            finalData()
        }
    })
}
//validacion de cliente y pagos--------------------------------------------------------
let formClient = document.getElementById("form-search-client-order")
//validacion de cliente
formClient.addEventListener("submit", async (e) => {
    e.preventDefault()
    document.querySelector(".loader_client_order").querySelector("h3").classList.add("d-none")
    document.querySelector(".loader_client_order").querySelector("div").classList.remove("d-none")
    let data = new FormData()
    data.append("cedula", formClient.querySelector("input").value);
    let pet = await fetch(`login/cedula`, { method: "POST", body: data })
    let res = await pet.json()
    if (res.success == true) {
        let response = res.message
        let pet = await searchParam({ active: 1, documento: response.nacionalidad + "-" + response.cedula }, "clients", 1)
        if (pet.length > 0) {
            let template = targetClienteOrder(pet[0])
            document.querySelector(".cont_client-order").innerHTML = template
        } else {
            let data = new FormData()
            data.append("nombre", response.primer_nombre);
            data.append("apellido", response.primer_apellido);
            data.append("documento", response.nacionalidad + "-" + response.cedula);
            let pet = await fetch(`clients/add`, { method: "POST", body: data })
            let res = await pet.json()
            let pet2 = await searchParam({ active: 1, id: res.last_id }, "clients", 1);
            if (pet2.length > 0) {
                let template = targetClienteOrder(pet2[0])
                document.querySelector(".cont_client-order").innerHTML = template
            } else {
                toas("error", "Error al registrar el cliente")
            }
        }
    } else {
        toas("error", "Cliente no encontrado")
        document.querySelector(".loader_client_order").querySelector("h3").classList.remove("d-none")
        document.querySelector(".loader_client_order").querySelector("div").classList.add("d-none")
    }
})
//validacion de pago ------------------------------------------------------------------
let paymentCount = 1;
function addPayment() {
    paymentCount++;
    document.getElementById("payments-container").insertAdjacentHTML('beforeend', elemenFormPaymentOrder(paymentCount));
    feather.replace();
    selectOptionAll(".select_options_payment", "paymentMethod", optionsRol);
    attachValidationListeners(paymentCount);
    const newProduct = document.getElementById(`payments-${paymentCount}`);
    newProduct.querySelector(".remove-payments").addEventListener("click", function () {
        newProduct.remove();
        reindex("#payments-container .payments", "payments", paymentCount, "Pago");
    });
}
function attachValidationListeners(index) {
    const paymentElement = document.getElementById(`payments-${index}`);
    paymentElement.querySelectorAll("input[type='text'], input[type='button'], input[type='file']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
        input.addEventListener("change", (e) => validateField(e, rules));
    });
}
document.getElementById("add-payment-order-btn").addEventListener("click", () => {
    addPayment();
    reindex("#payments-container .payments", "payments", paymentCount, "Pago");
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
validate.validators.validateCategoryAndRecipe = function (value, options, key, attributes) {
    if (!value) {
        return options.message || "es requerido";
    }
    if (value.toLowerCase() === "seleccione una opcion") {
        return options.message || "es requerido";
    }
};
validate.validators.number = function (value, options, key, attributes) {
    if (!value) return;

    if (!/^[0-9]/.test(value)) {
        return options.notnumber;
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
    id_metodo_pago: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateCategoryAndRecipe: { message: "^es requerido" }
    },
    referencia: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        number: {
            notnumber: "^solo numeros"
        }
    },
    imagen: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        }
    },
};
let btn_next_payment = document.querySelector(".btn_next_payment");
btn_next_payment.addEventListener("click", () => {
    let hasError = false;
    const payment = document.querySelectorAll(".payments");
    payment.forEach((payment, i) => {
        const index = i + 1;
        const data = {
            id_metodo_pago: payment.querySelector(`input[name="id_metodo_pago"]`).getAttribute("data-id"),
            cantidad: payment.querySelector(`input[name="cantidad"]`).value.replace(/\./g, '').replace(',', '.'),
            referencia: payment.querySelector(`input[name="referencia"]`).value,
            imagen: payment.querySelector(`input[name="imagen"]`) ? payment.querySelector(`input[name="imagen"]`).files[0] : ""
        };
        const errors = validate(data, rules);
        setValidationStyles(`input-payment-order-${index}`, errors?.id_metodo_pago ? errors.id_metodo_pago[0] : null);
        setValidationStyles(`input-quantity-order-${index}`, errors?.cantidad ? errors.cantidad[0] : null);
        setValidationStyles(`input-reference-order-${index}`, errors?.referencia ? errors.referencia[0] : null);
        setValidationStyles(`input-comprobante-order-${index}`, errors?.imagen ? errors.imagen[0] : null);
        if (errors) hasError = true
    });
    // if (hasError) toas("error", "Complete los campos requeridos")
    // else {
    stepper.next()
})
const finalData = () => {
    let btn_confirm_order = document.querySelector(".confirm_order")
    btn_confirm_order.addEventListener("click", () => {
        let productProcessData = []
        let productPreparedData = []
        let productPrepared = document.querySelector(".cont-details-product-order-food").children
        let productProcess = document.querySelector(".cont-details-product-order-other").children
        for (const product of productPrepared) {
            let additionalData = []
            let quantity = parseInt(product.querySelector(".counter-container").querySelector("input").value);
            let price = parseFloat(product.querySelector("h4").textContent.replace("$", "").replace("Precio:", ""));
            let name = product.querySelector("h5").textContent;
            let id = product.querySelector("h5").getAttribute("data-id");
            let detalles = product.querySelector(".details").value;
            product.querySelectorAll("tag").forEach((tag) => {
                additionalData.push({
                    id_producto: tag.getAttribute("id"),
                    nombre: tag.getAttribute("value"),
                    precio: tag.getAttribute("precio"),
                    cantidad: 1
                })
            })
            productPreparedData.push({
                id_producto: id,
                nombre: name,
                cantidad: quantity,
                precio: price,
                detalles: detalles,
                adicionales: additionalData
            })
        }
        for (const product of productProcess) {
            let quantity = parseInt(product.querySelector(".counter-container").querySelector("input").value);
            let price = parseFloat(product.querySelector("h4").textContent.replace("$", "").replace("Precio:", ""));
            let name = product.querySelector("h5").textContent;
            let id = product.querySelector("h5").getAttribute("data-id");

            productProcessData.push({
                id_producto: id,
                nombre: name,
                cantidad: quantity,
                precio: price
            })
        }
        let id_cliente = document.querySelector(".cont_client-order").querySelector("h4[id]").getAttribute("id");

    })
}
attachValidationListeners(1)
//<div class="d-flex flex-column align-items-center justify-content-center p-3 popover-button"><i data-feather="plus-circle"></i><h4 class="m-0">Adicional</h4></div><div class="popover-content" style="display: none;"></div>