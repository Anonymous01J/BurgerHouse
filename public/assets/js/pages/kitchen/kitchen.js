import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
import { report } from "./report.js"
const { print, searchParam, binnacle, sessionInfo, searchFilter } = functionGeneral();
const { targetKitchen, infoKitchenDelivery, detailsKitchenDelivery } = Templates();
let session = await sessionInfo()
const config = {
    search: () => searchParam({ status: 1 }, "order", 1000000000),
    template: targetKitchen,
    container: ".kitchen-cont-prepared",
    funtions: () => {
        preparedKitchen()
        modalDetails()
    }
}
print(config)
searchFilter("#searchKitchenPending", (e) => {
    if (e.target.value == "") print(config)
    else print({ ...config, search: () => searchParam({ status: 1, nombre_like: e.target.value }, "order") })
})
searchFilter("#searchKitchenPrepared", (e) => {
    if (e.target.value == "") printTargetPreparedOff("search", null, order => order.status > 1)
    else printTargetPreparedOff("like", e.target.value, order => order.status > 1)
})

const printTargetPreparedOff = async (type, type_filter, condition) => {
    let templateCharge = "";
    templateCharge = `
          <div class="col-12 d-flex justify-content-center align-items-center fs-1" style="height: 50vh;">
            <div class="spinner-border" role="status" style="width: 150px; height: 150px; color: #c1c1c1;">
              <span class="visually-hidden">Loading...</span>
            </div>
          </div>
          `
    document.querySelector(".kitchen-cont-prepared-off").innerHTML = templateCharge;
    let result
    if (type == "search") result = await searchParam({}, "order");
    else if (type == "like") result = await searchParam({ nombre_like: type_filter }, "order");
    else result = await searchParam({ tipo: type_filter }, "order", 1000000000);
    let template = ""
    let template2 = ""
    if (result.length > 0) result.forEach((order) => {
        if (condition(order)) {
            template += targetKitchen(order)
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
        document.querySelector(".kitchen-cont-prepared-off").innerHTML = template
        modalDetails()
    }
    else {
        document.querySelector(".kitchen-cont-prepared-off").innerHTML = template2
        modalDetails()
    }
}
printTargetPreparedOff("search", null, order => order.status > 1)
const preparedKitchen = () => {
    document.querySelectorAll(".btn_prepared").forEach(item => {
        item.addEventListener("click", async () => {
            Swal.fire({
                title: "¿La orden  esta lista?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Si, estoy seguro",
                cancelButtonText: "Cancelar",
                confirmButtonColor: "#FF4B00",
            }).then(async (result) => {
                if (result.isConfirmed) {
                    let id = item.getAttribute("id_order")
                    let type = item.getAttribute("type_order")
                    let data = new FormData();
                    data.append("id", id)
                    if (type == "llevar") data.append("status", 3)
                    else data.append("status", 2)
                    let pet = await fetch('order/update', { method: "POST", body: data })
                    let res = await pet.json()
                    if (res.success == true) {
                        Swal.fire({
                            title: `Exito!`,
                            text: "La orden se preparo correctamente",
                            icon: "success",
                        });
                        print(config)
                        printTargetPreparedOff("search", null, order => order.status > 1)
                        binnacle(session.message.id, 'Orden de cocina', 'Preparado', 'Se preparo una orden de cocina')
                    } else {
                        Swal.fire({
                            title: `Error!`,
                            text: "No se pudo preparar la orden",
                            icon: "error",
                        });
                    }
                }
            });
        })
    })
}
//filtro
document.querySelectorAll(".btn_check_pending").forEach(item => {
    item.addEventListener("click", () => {
        let type = item.id
        if (type == "kitchen_all_pending") print(config)
        else if (type == "kitchen_delivery_pending") print({ ...config, search: () => searchParam({ tipo: "delivery", status: 1 }, "order", 1000000000) })
        else if (type == "kitchen_takeaway_pending") print({ ...config, search: () => searchParam({ tipo: "llevar", status: 1 }, "order", 1000000000) })
        else if (type == "kitchen_local_pending") print({ ...config, search: () => searchParam({ tipo: "local", status: 1 }, "order", 1000000000) })
    })
})
document.querySelectorAll(".btn_check_off").forEach(item => {
    item.addEventListener("click", () => {
        let type = item.id
        if (type == "kitchen_all_off") printTargetPreparedOff("search", null, order => order.status > 1)
        else if (type == "kitchen_delivery_off") printTargetPreparedOff("filter", "delivery", order => order.status > 1)
        else if (type == "kitchen_takeaway_off") printTargetPreparedOff("filter", "llevar", order => order.status > 1)
        else if (type == "kitchen_local_off") printTargetPreparedOff("filter", "local", order => order.status > 1)
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
// IntroJs
document.getElementById('navbarDropdown').addEventListener('click', function () {
    if (typeof introJs !== 'undefined') {
        let intro = introJs();
        intro.setOptions({
            steps: [
                {
                    element: document.querySelector('.page-wrapper'),
                    intro: 'Bienvenido a la seccion de cocina, aqui podras ver todas las ordenes por preparar de tu negocio.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('#home-tab'),
                    intro: 'Aqui podras ver todas las ordenes por preparar pendientes.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('#profile-tab'),
                    intro: 'Aqui podras ver las ordenes que ya han sido preparadas.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('.card'),
                    intro: 'Tarjeta de ordenes a domicilio pendientes, puedes ver los detalles de la orden y confirmar la preparación de dicha orden.',
                    position: 'bottom'
                }
            ],
            showBullets: true,
            exitOnOverlayClick: false,
            showProgress: true
        });
        intro.start();
    }
});