import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
import { report } from "./report.js"
const { print, searchParam, binnacle, sessionInfo, searchFilter, permission, pagination } = functionGeneral();
const { targetKitchen, infoKitchenDelivery, detailsKitchenDelivery } = Templates();
let session = await sessionInfo()
const config = {
    search: () => searchParam({ status: "en cocina" }, "order", 12),
    template: targetKitchen,
    container: ".kitchen-cont-prepared",
    funtions: () => {
        preparedKitchen()
        modalDetails()
        permission("cocina")
    }
}
print(config)
print({ ...config, search: () => searchParam({ status: "en preparacion" }, "order"), container: ".kitchen-cont-inprepared" })
print({ ...config, search: () => searchParam({ status: "para despachar" }, "order"), container: ".kitchen-cont-prepared-off" })

searchFilter("#searchKitchenPending", (e) => {
    if (e.target.value == "") print(config)
    else print({ ...config, search: () => searchParam({ status: "en cocina", nombre_like: e.target.value }, "order") })
})
searchFilter("#searchKitchenPrepared", (e) => {
    if (e.target.value == "") print({ ...config, search: () => searchParam({ status: "para despachar" }, "order"), container: ".kitchen-cont-prepared-off" })
    else print({ ...config, search: () => searchParam({ status: "para despachar", nombre_like: e.target.value }, "order"), container: ".kitchen-cont-prepared-off" })
})
searchFilter("#searchKitchenInPrepared", (e) => {
    if (e.target.value == "") print({ ...config, search: () => searchParam({ status: "en preparacion" }, "order"), container: ".kitchen-cont-inprepared" })
    else print({ ...config, search: () => searchParam({ status: "en preparacion", nombre_like: e.target.value }, "order"), container: ".kitchen-cont-inprepared" })
})
const preparedKitchen = () => {
    document.querySelectorAll(".btn_prepared").forEach(item => {
        if (!item.dataset.listenerAttached) {
            item.addEventListener("click", async () => {
                let action = item.getAttribute("action")
                Swal.fire({
                    title: action == "en cocina" ? "¿Deseas preparar la orden?" : "¿La orden ya se encuentra lista?",
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
                        let verify = await searchParam({ id: id }, "order")
                        if (verify[0].status == "en preparacion" && action == "en cocina") {
                            Swal.fire({
                                title: `Error!`,
                                text: "La orden ya se encuentra en preparacion",
                                icon: "error",
                            });
                        } else {
                            data.append("id", id)
                            if (action == "en cocina") data.append("status", "en preparacion")
                            else data.append("status", "para despachar")
                            let pet = await fetch('order/update', { method: "POST", body: data })
                            let res = await pet.json()
                            if (res.success == true) {
                                Swal.fire({
                                    title: `Exito!`,
                                    text: action == "en cocina" ? "Se ha enviado a preparar la orden" : "Se ha enviado a despachar la orden",
                                    icon: "success",
                                });
                                print(config)
                                print({ ...config, search: () => searchParam({ status: "en preparacion" }, "order"), container: ".kitchen-cont-inprepared" })

                                // printTargetPreparedOff("search", null, order => order.status != "en cocina" && order.status != "por verificar")
                                binnacle(session.message.id, 'Orden de cocina', action == "en cocina" ? "La orden se encuentra en preparacion" : 'La orden se encuentra para despachar', action == "en cocina" ? 'Se envio una orden a preparar' : 'Se envio una orden a despachar')
                            } else {
                                Swal.fire({
                                    title: `Error!`,
                                    text: "No se pudo preparar la orden",
                                    icon: "error",
                                });
                            }
                        }
                    }
                });
            })
            item.dataset.listenerAttached = "true"
        }
    })
}
//filtro
document.querySelectorAll(".btn_check_pending").forEach(item => {
    item.addEventListener("click", () => {
        let type = item.id
        if (type == "kitchen_all_pending") print(config)
        else if (type == "kitchen_delivery_pending") print({ ...config, search: () => searchParam({ tipo: "delivery", status: "en cocina" }, "order", 1000000000) })
        else if (type == "kitchen_takeaway_pending") print({ ...config, search: () => searchParam({ tipo: "llevar", status: "en cocina" }, "order", 1000000000) })
        else if (type == "kitchen_local_pending") print({ ...config, search: () => searchParam({ tipo: "local", status: "en cocina" }, "order", 1000000000) })
    })
})
document.querySelectorAll(".btn_check_off").forEach(item => {
    item.addEventListener("click", () => {
        let type = item.id
        if (type == "kitchen_all_off") print({ ...config, search: () => searchParam({ status: "para despachar" }, "order"), container: ".kitchen-cont-prepared-off" })
        else if (type == "kitchen_delivery_off") print({ ...config, search: () => searchParam({ status: "para despachar", tipo: "delivery" }, "order"), container: ".kitchen-cont-prepared-off" })
        else if (type == "kitchen_takeaway_off") print({ ...config, search: () => searchParam({ status: "para despachar", tipo: "llevar" }, "order"), container: ".kitchen-cont-prepared-off" })
        else if (type == "kitchen_local_off") print({ ...config, search: () => searchParam({ status: "para despachar", tipo: "local" }, "order"), container: ".kitchen-cont-prepared-off" })
    })
})
document.querySelectorAll(".btn_check_inprepared").forEach(item => {
    item.addEventListener("click", () => {
        let type = item.id
        if (type == "kitchen_all_inprepared") print({ ...config, search: () => searchParam({ status: "en preparacion" }, "order"), container: ".kitchen-cont-inprepared" })
        else if (type == "kitchen_delivery_inprepared") print({ ...config, search: () => searchParam({ status: "en preparacion", tipo: "delivery" }, "order"), container: ".kitchen-cont-inprepared" })
        else if (type == "kitchen_takeaway_inprepared") print({ ...config, search: () => searchParam({ status: "en preparacion", tipo: "llevar" }, "order"), container: ".kitchen-cont-inprepared" })
        else if (type == "kitchen_local_inprepared") print({ ...config, search: () => searchParam({ status: "en preparacion", tipo: "local" }, "order"), container: ".kitchen-cont-inprepared" })
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
            let group = {}
            detailsPrepered.forEach(item => {
                template += detailsKitchenDelivery(item, "prepared")
            })
            detailsProcess.forEach(item => {
                if (!group[item.id_producto]) group[item.id_producto] = item
                else group[item.id_producto] = { ...item, cantidad: parseInt(group[item.id_producto].cantidad) + parseInt(item.cantidad) }
            })
            group = Object.entries(group).map(([key, value]) => ({ nombre: key, ...value }));
            group.forEach(item => {
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

pagination((page) => {
    print({ ...config, search: () => searchParam({ status: "en cocina" }, "order", 12, page) })
}, ".pagination_prepared")

// const printTargetPreparedOff = async (
//     type,
//     type_filter,
//     condition,
//     pageSize = 12,
//     currentPage = 1
// ) => {
//     document.querySelector(".kitchen-cont-prepared-off").innerHTML = `
//     <div class="col-12 d-flex justify-content-center align-items-center fs-1" style="height: 50vh;">
//       <div class="spinner-border" role="status" style="width: 150px; height: 150px; color: #c1c1c1;">
//         <span class="visually-hidden">Loading...</span>
//       </div>
//     </div>`;

//     let result;
//     if (type === "search") {
//         result = await searchParam({}, "order", 10000000, 0);
//     } else if (type === "like") {
//         result = await searchParam({ nombre_like: type_filter }, "order", 10000000, null);
//     } else {
//         result = await searchParam({ tipo: type_filter }, "order", 10000000, null);
//     }

//     const filtered = result.filter(condition);
//     const totalPages = Math.max(Math.ceil(filtered.length / pageSize), 1);
//     currentPage = Math.min(Math.max(currentPage, 1), totalPages);
//     const start = (currentPage - 1) * pageSize;
//     const pageData = filtered.slice(start, start + pageSize);
//     let template = pageData.map(order => targetKitchen(order)).join("");
//     if (!template) {
//         template = `
//       <div class="col-12">
//         <div class="d-flex justify-content-center align-items-center">
//           <img src="./assets/img/bh_logo.png" alt="Logo" class="img-fluid opacity-25">
//         </div>
//       </div>`;
//     }
//     document.querySelector(".kitchen-cont-prepared-off").innerHTML = template;
//     modalDetails();
//     buildPreparedOffPager(totalPages, currentPage, page =>
//         printTargetPreparedOff(type, type_filter, condition, pageSize, page)
//     );
// };
// function buildPreparedOffPager(totalPages, currentPage, onChange) {
//     const ul = document.querySelector(".pagination_preparedoff");
//     ul.innerHTML = "";
//     const makeItem = (label, page, disabled = false, active = false) => {
//         const li = document.createElement("li");
//         li.className = `page-item ${disabled ? "disabled" : ""} ${active ? "active" : ""}`;
//         const a = document.createElement("a");
//         a.className = "page-link";
//         a.href = "#";
//         a.innerHTML = label;
//         if (!disabled) a.addEventListener("click", () => onChange(page));
//         li.appendChild(a);
//         ul.appendChild(li);
//     };
//     makeItem("&laquo;", currentPage - 1, currentPage === 1);
//     for (let i = 1; i <= totalPages; i++) {
//         makeItem(i, i, false, i === currentPage);
//     }
//     makeItem("&raquo;", currentPage + 1, currentPage === totalPages);
// }
// printTargetPreparedOff("search", null, (order) => order.status != "en cocina" && order.status != "por verificar", 12, 1);


// const preparedKitchen = () => {
//     document.querySelectorAll(".btn_prepared").forEach(item => {
//         item.addEventListener("click", async () => {
//             Swal.fire({
//                 title: "¿Deseas preparar la orden?",
//                 icon: "warning",
//                 showCancelButton: true,
//                 confirmButtonText: "Si, estoy seguro",
//                 cancelButtonText: "Cancelar",
//                 confirmButtonColor: "#FF4B00",
//             }).then(async (result) => {
//                 if (result.isConfirmed) {
//                     let id = item.getAttribute("id_order")
//                     let type = item.getAttribute("type_order")
//                     let data = new FormData();
//                     data.append("id", id)
//                     if (type == "llevar") data.append("status", "por despachar")
//                     else data.append("status", "en delivery")
//                     let pet = await fetch('order/update', { method: "POST", body: data })
//                     let res = await pet.json()
//                     if (res.success == true) {
//                         Swal.fire({
//                             title: `Exito!`,
//                             text: "La orden se preparo correctamente",
//                             icon: "success",
//                         });
//                         print(config)
//                         printTargetPreparedOff("search", null, order => order.status != "en cocina" && order.status != "por verificar")
//                         binnacle(session.message.id, 'Orden de cocina', 'Preparado', 'Se preparo una orden de cocina')
//                     } else {
//                         Swal.fire({
//                             title: `Error!`,
//                             text: "No se pudo preparar la orden",
//                             icon: "error",
//                         });
//                     }
//                 }
//             });
//         })
//     })
// }