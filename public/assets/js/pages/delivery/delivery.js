import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
import { report } from "./report.js"
const { searchParam, binnacle, sessionInfo, print, searchFilter } = functionGeneral();
const { targetDelivery, infoKitchenDelivery, detailsKitchenDelivery } = Templates();
let session = await sessionInfo()
const config = {
    search: () => searchParam({ status: 2 }, "order"),
    template: targetDelivery,
    container: ".cont-delivery-pending",
    funtions: () => {
        saleBTN(config, () => binnacle(session.message.id, 'Orden de delivery', 'Orden aceptada', 'Se acepto una orden de delivery'))
    },
}
searchFilter("#searchDeliveryPending", (e) => {
    if (e.target.value == "") print(config)
    else print({ ...config, search: () => searchParam({ status: 2, nombre_like: e.target.value }, "order") })
})
searchFilter("#searchDeliveryOff", (e) => {
    if (e.target.value == "") printDeliveyOff("search", null, order => order.status > 2)
    else printDeliveyOff("like", e.target.value, order => order.status > 2)
})
const saleBTN = async (config, binnacleSale) => {
    document.querySelectorAll(".btn_sale").forEach(item => {
        item.addEventListener("click", async () => {
            Swal.fire({
                title: "¿Deseas entregar esta orden?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Si, estoy seguro",
                cancelButtonText: "Cancelar",
                confirmButtonColor: "#FF4B00",
            }).then(async (result) => {
                if (result.isConfirmed) {
                    let id = item.getAttribute("id_order")
                    let data = new FormData();
                    data.append("id", id)
                    let verify = await searchParam({ id: id, status: 2 }, "order")
                    if (verify.length == 0) {
                        Swal.fire({
                            title: `Error!`,
                            text: "No se puede aceptar la orden",
                            icon: "error",
                        });
                    } else {
                        data.append("status", 3)
                        let pet = await fetch('order/update', { method: "POST", body: data })
                        let res = await pet.json()
                        if (res.success == true) {
                            Swal.fire({
                                title: `Exito!`,
                                text: "La orden se acepto correctamente",
                                icon: "success",
                            });
                            print(config)
                            printDeliveyOff("search", null, order => order.status > 2)
                            binnacleSale()
                            let deliveryData = new FormData();
                            deliveryData.append("id_venta", item.getAttribute("id_venta"))
                            deliveryData.append("id_usuario_delivery", session.message.id)
                            let deliveryName = await fetch("delivery/add", { method: "POST", body: deliveryData })
                        } else {
                            Swal.fire({
                                title: `Error!`,
                                text: "No se puede aceptar la orden",
                                icon: "error",
                            });
                        }
                    }
                }
            });
        })
    })
}
const printDeliveyOff = async (type, type_filter, condition) => {
    let templateCharge = "";
    templateCharge = `
          <div class="col-12 d-flex justify-content-center align-items-center fs-1" style="height: 50vh;">
            <div class="spinner-border" role="status" style="width: 150px; height: 150px; color: #c1c1c1;">
              <span class="visually-hidden">Loading...</span>
            </div>
          </div>
          `
    document.querySelector(".cont-delivery-off").innerHTML = templateCharge;
    let result
    if (type == "search") result = await searchParam({}, "order");
    else if (type == "like") result = await searchParam({ nombre_like: type_filter }, "order");
    else result = await searchParam({ tipo: type_filter }, "order", 1000000000);
    let template = ""
    let template2 = ""
    if (result.length > 0) result.forEach((order) => {
        if (condition(order)) {
            template += targetDelivery(order)
        } else {
            template2 = `
                <div class="col-12">
                    <div class="d-flex justify-content-center align-items-center">
                        <img src="./assets/img/bh_logo.png" alt="Logo" class="img-fluid opacity-25">
                    </div>
                </div>
                `
        }
    })
    else {
        template = `
            <div class="col-12">
                <div class="d-flex justify-content-center align-items-center">
                    <img src="./assets/img/bh_logo.png" alt="Logo" class="img-fluid opacity-25">
                </div>
            </div>
            `
    }
    if (template != "") {
        document.querySelector(".cont-delivery-off").innerHTML = template
        modalDetails()
    }
    else {
        document.querySelector(".cont-delivery-off").innerHTML = template2
        modalDetails()
    }
}
print(config)
printDeliveyOff("search", null, order => order.status > 2)
document.querySelectorAll(".btn_check_pending").forEach(item => {
    item.addEventListener("click", () => {
        let type = item.id
        if (type == "delivery_all_pending") print(config)
        else if (type == "delivery_delivery_pending") print({ ...config, search: () => searchParam({ tipo: "delivery", status: 2 }, "order", 1000000000) })
        else if (type == "delivery_takeaway_pending") print({ ...config, search: () => searchParam({ tipo: "llevar", status: 2 }, "order", 1000000000) })
        else if (type == "delivery_local_pending") print({ ...config, search: () => searchParam({ tipo: "local", status: 2 }, "order", 1000000000) })
    })
})
document.querySelectorAll(".btn_check_off").forEach(item => {
    item.addEventListener("click", () => {
        let type = item.id
        if (type == "delivery_all_off") printDeliveyOff("search", null, order => order.status > 2)
        else if (type == "delivery_delivery_off") printDeliveyOff("filter", "delivery", order => order.status > 2)
        else if (type == "delivery_takeaway_off") printDeliveyOff("filter", "llevar", order => order.status > 2)
        else if (type == "delivery_local_off") printDeliveyOff("filter", "local", order => order.status > 2)
    })
})
//modal de detalles
const modalDetails = () => {
    document.querySelectorAll(".btn-details-kitchen-delivery").forEach(item => {
        item.addEventListener("click", async () => {
            let id = item.getAttribute('data-id')
            let info = await searchParam({ id: id }, "order")
            let detailsPrepered = await searchParam({ id_orden: id }, "Detalle_orden_producto_preparado")
            let detailsProcess = await searchParam({ id_orden: id }, "Detalle_orden_producto_procesado")
            document.querySelector(".cont_info_kitchen_delivery").innerHTML = infoKitchenDelivery(info[0])
            feather.replace()
            new bootstrap.Tooltip(document.querySelector('.btn_print'))
            report(info, detailsPrepered, detailsProcess)
            let template = ""
            detailsPrepered.forEach(item => {
                template += detailsKitchenDelivery(item, "prepared")
            })
            detailsProcess.forEach(item => {
                template += detailsKitchenDelivery(item, "process")
            })
            document.querySelector(".cont_details_kitchen_delivery_process").innerHTML = template
        })
    })
}