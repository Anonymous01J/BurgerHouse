export async function local(functions, templates) {
    const { searchParam, amountDolar, viewImage, InputPrice, selectOptionAll, validateField, setValidationStyles, reindex, CheckCash, sessionInfo, binnacle, resetForm } = functions()
    const { tagFilterProduct, selectProduct, targetDetailProductOrder, targetDetailOtherOrder, targetClienteOrder, optionsRol, elemenFormPaymentOrder, selectTable } = templates()
    viewImage(".input-image")
    InputPrice("[input_price]");
    selectOptionAll(".select_options_payment", "paymentMethod", optionsRol);
    const resetFormModal = () => {
        document.querySelector(".cont-select-product-order").innerHTML = ""
        const container = document.querySelector(".cont_category_product_orders");
        container.innerHTML = container.children[0].outerHTML
        document.querySelector(".target_client_order").innerHTML = ""
        document.querySelector(".loader_client_order").querySelector("h3").classList.remove("d-none")
        document.querySelector(".target_client_order").classList.add("d-none")
        document.querySelector(".loader_client_order").querySelector(".loader").classList.add("d-none")
        document.getElementById('form-search-client-order').reset()
        document.querySelector(".direction_sale").value = ""
        resetForm(".payments", document.getElementById("form-submit-payment"))
    }
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
        let count1 = document.querySelector(".cont-details-product-order-food_local").children
        for (const key of count1) {
            let price = parseFloat(key.querySelector("h4").textContent.replace("$", "").replace("Precio:", ""))
            let quantity = parseInt(key.querySelector(".counter-container").querySelector("input").value)
            subT.push(price * quantity)
            key.querySelectorAll("tag").forEach((item) => {
                priceAdditional.push(parseFloat(item.getAttribute("precio")) * quantity)
            })
        }
        let count2 = document.querySelector(".cont-details-product-order-other_local").children
        for (const key of count2) {
            let price = parseFloat(key.querySelector("h4").textContent.replace("$", "").replace("Precio:", ""))
            let quantity = parseInt(key.querySelector(".counter-container").querySelector("input").value)
            subT.push(price * quantity)
        }

        //MONTOS DE EL DETALLE
        document.querySelector(".subtotal_local").textContent = "SUBTOTAL: " + (subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)).toFixed(2) + " $"
        document.querySelector(".iva_local").textContent = "IVA: " + ((subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)) * 0.16).toFixed(2) + " $"
        document.querySelector(".total-amount_local").textContent = "TOTAL: " + ((subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)) + subT.reduce((a, b) => a + b, 0) * 0.16).toFixed(2) + " $" + " ------ " + (((subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)) + subT.reduce((a, b) => a + b, 0) * 0.16) * await amountDolar()).toFixed(2) + " BS"

        //MONTOS DE EL PAGO
        // document.querySelector(".amount_payment_usd").textContent = ((subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)) + subT.reduce((a, b) => a + b, 0) * 0.16).toFixed(2)
        // document.querySelector(".amount_payment_bs").textContent = (((subT.reduce((a, b) => a + b, 0) + priceAdditional.reduce((a, b) => a + b, 0)) + subT.reduce((a, b) => a + b, 0) * 0.16) * await amountDolar()).toFixed(2)
    }
    // funcion para los filtros de productos y carga de productos
    const filter = () => {
        let inputs = document.querySelectorAll(".btn-filter-product")
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
        document.querySelector(".cont_category_product_orders_local").insertAdjacentHTML("beforeend", template)
        filter()
    }
    const products = async () => {
        let templatePrepared = "";
        let templateProcess = "";
        let productProcess = await searchParam({ active: 1 }, "productProcess", 100)
        let productPrepared = await searchParam({ active: 1, tipo: "producto" }, "productPrepared", 100)
        productPrepared.forEach((product) => { templatePrepared += selectProduct(product, "productPrepared"); })
        productProcess.forEach((product) => { templateProcess += selectProduct(product, "productProcess"); })
        document.querySelector(".cont-select-product-order_local").insertAdjacentHTML("beforeend", templatePrepared)
        document.querySelector(".cont-select-product-order_local").insertAdjacentHTML("beforeend", templateProcess)
        categoryFilter()
        plusBtn()
        productForDetails()
        feather.replace()
    }
    //valida q si no hay productos, no puede pasar al step 2
    const productForDetails = () => {
        let btn = document.querySelector(".select_product_btn_next_local")
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
                stepper2.next()
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
                document.querySelector(".cont-details-product-order-food_local").innerHTML = templateProduct
                document.querySelector(".cont-details-product-order-other_local").innerHTML = templateOther
                initPopover()
                feather.replace()
                plusBtn()
                amount()
            }
        })
    }
    const tablesOrder = async () => {
        let pet = await searchParam({ active: 1, estado: "LIBRE" }, "table", 100)
        let template = "";
        pet.forEach((table) => { template += selectTable(table) })
        document.querySelector(".cont_table").innerHTML = template
    }
    const verifyTables = async () => {
        let btn = document.querySelector(".btn_tables_order_local")
        btn.addEventListener("click", () => {
            let count = 0
            document.querySelector(".cont_table").querySelectorAll(".btn_table_order").forEach((btn) => { if (btn.checked) count++ })
            if (count == 0) toas("error", "Seleccione una mesa")
            else {
                stepper2.next()
                finalData(printConfirmDetailsOrder)
            }
        })
    }
    const finalData = (funtion = null) => {
        let productProcessData = []
        let productPreparedData = []
        let tablesData = []
        let productPrepared = document.querySelector(".cont-details-product-order-food_local").children
        let productProcess = document.querySelector(".cont-details-product-order-other_local").children
        let tables = document.querySelector(".cont_table").children
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
        for (const table of tables) {
            let input = table.querySelector("input")
            if (input.checked) {
                tablesData.push({
                    id: input.getAttribute("id_table"),
                    nombre: input.getAttribute("table_name"),
                })
            }
        }
        if (funtion) funtion(productPreparedData, productProcessData, tablesData)
        else return { productPreparedData, productProcessData, tablesData }
    }
    const printConfirmDetailsOrder = (productPreparedData, productProcessData, tablesData) => {
        document.querySelector(".table_confirm_order_local").textContent = tablesData.map((index) => index.nombre).join(", ")
        let templateProductPrepared = "";
        let templateProductProcess = "";
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
        document.querySelector(".cont_confirm_product_order_local").innerHTML = templateProductPrepared;
        document.querySelector(".cont_confirm_product_order_local").innerHTML += templateProductProcess;
    }
    const sendOrder = async () => {
        document.querySelector(".confirm_order_local").addEventListener("click", async () => {
            let { productPreparedData, productProcessData, tablesData } = finalData()
            // let order = new FormData();
            // let nro_orden = Math.floor(Math.random() * (99999999 - 10000000 + 1)) + 10000000
            // order.append("tipo", 'local')
            // order.append("nro_orden", nro_orden)
            // order.append("status", 1)
            // let index = 0;
            // productPreparedData.forEach((product) => {
            //     let additionalText = product.adicionales.map((index) => index.nombre).join(",");
            //     order.append(`lista_detalle_preparado[${index}][id_producto]`, product.id_producto);
            //     order.append(`lista_detalle_preparado[${index}][cantidad]`, product.cantidad);
            //     order.append(`lista_detalle_preparado[${index}][adicionales]`, additionalText);
            //     order.append(`lista_detalle_preparado[${index}][descripcion]`, product.detalles);
            //     index++
            // })
            // productProcessData.forEach((product, i) => {
            //     order.append(`lista_detalle_procesado[${i}][id_producto]`, product.id_producto);
            //     order.append(`lista_detalle_procesado[${i}][cantidad]`, product.cantidad);
            // })
            // let groupedAdicionales = {};
            // productPreparedData.forEach((product) => {
            //     product.adicionales.forEach((aditional) => {
            //         const key = aditional.id_producto;
            //         if (!groupedAdicionales[key]) groupedAdicionales[key] = { ...aditional };
            //         else groupedAdicionales[key].cantidad += aditional.cantidad;
            //     });
            // });
            // let result = Object.values(groupedAdicionales);
            // result.forEach((aditional) => {
            //     order.append(`lista_detalle_preparado[${index}][id_producto]`, aditional.id_producto);
            //     order.append(`lista_detalle_preparado[${index}][cantidad]`, aditional.cantidad);
            //     index++
            // })
            // let petOrder = await fetch("order/check", { method: "POST", body: order })
            // let resOrder = await petOrder.json()
            let lastId = 1
            let order_table = tablesData.map((table) => { return { id_mesa: table.id, id_order: lastId } })

            console.log(order_table);
        })
    }

    sendOrder()

    verifyTables()
    tablesOrder()
    products()
}