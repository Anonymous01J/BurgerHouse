import functionGeneral from "../../Functions.js"
import Templates from "../../templates.js"
const { searchParam, amountDolar, viewImage, InputPrice, selectOptionAll, validateField, setValidationStyles, reindex, CheckCash, sessionInfo, binnacle } = functionGeneral()
const { tagFilterProduct, selectProduct, targetDetailProductOrder, targetDetailOtherOrder, targetClienteOrder, optionsRol, elemenFormPaymentOrder } = Templates()
viewImage(".input-image")
InputPrice("[input_price]");
selectOptionAll(".select_options_payment", "paymentMethod", optionsRol);
let session = await sessionInfo()
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
        key.querySelectorAll("tag").forEach((item) => {
            priceAdditional.push(parseFloat(item.getAttribute("precio")) * quantity)
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
            console.log(pet2);
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
    viewImage(".input-image")
    InputPrice("[input_price]");
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
    if (!document.querySelector(".cont_client-order").querySelector("h4")) {
        toas("error", "Seleccione un cliente");
    } else if (hasError) {
        toas("error", "Complete todos los campos");
    } else {
        stepper.next()
        finalData(printConfirmDetailsOrder);
    }
})
const finalData = (funtion = null) => {
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
                cantidad: 1 * quantity
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
    let clientData = {
        id_cliente: document.querySelector(".cont_client-order").querySelector("h4[id]").getAttribute("id"),
        nameClient: document.querySelector(".cont_client-order").querySelector(".nombre_client").textContent,
        documentClient: document.querySelector(".cont_client-order").querySelector(".document_client").textContent
    };
    let amountTotal = {
        total_dolares: document.querySelector(".amount_payment_usd").textContent,
        total_bs: document.querySelector(".amount_payment_bs").textContent
    }
    let directionSale = document.querySelector(".direction_sale").value;
    let dataPayment = [];
    const payment = document.querySelectorAll(".payments");
    payment.forEach((payment) => {
        const data = {
            id_metodo_pago: payment.querySelector(`input[name="id_metodo_pago"]`).getAttribute("data-id"),
            metodo: payment.querySelector(`input[name="id_metodo_pago"]`).value,
            cantidad: payment.querySelector(`input[name="cantidad"]`).value.replace(/\./g, '').replace(',', '.'),
            referencia: payment.querySelector(`input[name="referencia"]`).value,
            imagen: payment.querySelector(`input[name="imagen"]`) ? payment.querySelector(`input[name="imagen"]`).files[0] : ""
        };
        dataPayment.push(data)
    });
    if (funtion) funtion(productPreparedData, productProcessData, clientData, dataPayment)
    else return { productPreparedData, productProcessData, clientData, dataPayment, directionSale, amountTotal }
}
const printConfirmDetailsOrder = (productPreparedData, productProcessData, clientData, dataPayment) => {
    document.querySelector(".name_client_confirm_order").textContent = clientData.nameClient.toUpperCase();
    document.querySelector(".document_client_confirm_order").textContent = clientData.documentClient;
    let templateProductPrepared = "";
    let templateProductProcess = "";
    let templatePayment = "";
    productPreparedData.forEach((product) => {
        let additional = product.adicionales.map((index) => index.nombre).join(",");
        templateProductPrepared +=
            `<tr>
            <td>${product.nombre}</td>
            <td>${product.cantidad}</td></td>
            <td>${product.detalles == "" ? "S/D" : product.detalles}</td>
            <td>${additional ? additional : "S/A"}</td>
        </tr>`
    });
    productProcessData.forEach((product) => {
        templateProductProcess +=
            `<tr>
            <td>${product.nombre}</td>
            <td>${product.cantidad}</td></td>
            <td>S/D</td>
            <td>S/A</td>
        </tr>`
    });
    dataPayment.forEach((payment) => {
        const file = payment.imagen;
        const reader = new FileReader();
        let cantidad
        if (payment.metodo.toLowerCase() == "efectivo") {
            cantidad = payment.cantidad + " Bs";
        } else if (payment.metodo.toLowerCase() == "transferencia") {
            cantidad = payment.cantidad + " Bs";
        } else if (payment.metodo.toLowerCase() == "pago movil") {
            cantidad = payment.cantidad + " Bs";
        } else {
            cantidad = payment.cantidad + " $";
        }
        reader.onload = (event) => {
            const imgresult = event.target.result;
            templatePayment +=
                `<tr>
                    <td>${payment.metodo}</td>
                    <td>${cantidad}</td>
                    <td>${payment.referencia}</td>
                    <td><img src="${imgresult}" alt="Comprobante" style="max-width: 100px; max-height: 100px;"></td>
                </tr>`;

            document.querySelector(".cont_confirm_payment_order").innerHTML = templatePayment;
        };
        reader.readAsDataURL(file);
    });

    document.querySelector(".cont_confirm_product_order").innerHTML = templateProductPrepared;
    document.querySelector(".cont_confirm_product_order").innerHTML += templateProductProcess;
}
attachValidationListeners(1)
//enviar orden
let btnSendOrder = document.querySelector(".confirm_order");
btnSendOrder.addEventListener("click", async () => {
    let order = new FormData();
    const { productPreparedData, productProcessData, clientData, dataPayment, directionSale, amountTotal } = finalData()
    let nro_orden = Math.floor(Math.random() * (99999999 - 10000000 + 1)) + 10000000
    order.append("id_cliente", clientData.id_cliente);
    order.append("tipo", "delivery")
    order.append("nro_orden", nro_orden)
    let index = 0;
    productPreparedData.forEach((product) => {
        let additionalText = product.adicionales.map((index) => index.nombre).join(",");
        order.append(`lista_detalle_preparado[${index}][id_producto]`, product.id_producto);
        order.append(`lista_detalle_preparado[${index}][cantidad]`, product.cantidad);
        order.append(`lista_detalle_preparado[${index}][adicionales]`, additionalText);
        index++
    })
    let groupedAdicionales = {};
    productPreparedData.forEach((product) => {
        product.adicionales.forEach((aditional) => {
            const key = aditional.id_producto;
            if (!groupedAdicionales[key]) groupedAdicionales[key] = { ...aditional };
            else groupedAdicionales[key].cantidad += aditional.cantidad;
        });
    });
    let result = Object.values(groupedAdicionales);
    result.forEach((aditional) => {
        order.append(`lista_detalle_preparado[${index}][id_producto]`, aditional.id_producto);
        order.append(`lista_detalle_preparado[${index}][cantidad]`, aditional.cantidad);
        index++
    })
    let petOrder = await fetch("order/add", { method: "POST", body: order })
    let resOrder = await petOrder.json()
    console.log(resOrder);
    let id_orden = resOrder.last_id

    let dataSale = new FormData();
    dataSale.append("id_orden", id_orden)
    dataSale.append("id_caja", await CheckCash())
    dataSale.append("monto_final", amountTotal.total_dolares)
    dataSale.append("direccion", directionSale)
    let petSale = await fetch("sale/add", { method: "POST", body: dataSale })
    let resSale = await petSale.json()
    console.log(resSale);
    let id_venta = resSale.last_id

    let dolar = await amountDolar()
    let paymentData = new FormData();
    dataPayment.forEach((payment, index) => {
        paymentData.append(`lista[${index}][id_venta]`, id_venta)
        paymentData.append(`lista[${index}][id_metodo_pago]`, payment.id_metodo_pago)
        paymentData.append(`lista[${index}][monto]`, payment.cantidad)
        paymentData.append(`lista[${index}][tasa]`, dolar)
        paymentData.append(`lista[${index}][referencia]`, payment.referencia)
        paymentData.append(`lista[${index}][imagen]`, payment.imagen)
        paymentData.append(`lista[${index}][imagen_name]`, payment.imagen.name)
    })
    let petPayment = await fetch("payment/add_many", { method: "POST", body: paymentData })
    let resPayment = await petPayment.json()
    console.log(resPayment);
    if (resPayment.success == true) {
        bootstrap.Modal.getOrCreateInstance('#domicile').hide()
        Swal.fire({
            title: `Exito!`,
            text: "Se creo la orden de domicilio",
            icon: "success",
        });
        binnacle(session.message.id, 'Orden de domicilio', 'Creacion', 'Se creo una orden de domicilio')
        setTimeout(() => {
            window.location.href = "order";
        }, 1000);
    } else {
        Swal.fire({
            title: `Error!`,
            text: "Hubo un error al crear la orden",
            icon: "error",
        });
    }
})

let algo = async () => {
    let pet = await fetch("order/get_all")
    let res = await pet.json()
    console.log(res)
}
algo()