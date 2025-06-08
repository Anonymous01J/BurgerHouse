import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { searchParam, binnacle, sessionInfo, print } = functionGeneral();
const { targetDelivery } = Templates();
let session = await sessionInfo()
const config = {
    search: () => searchParam({ status: 2 }, "order"),
    template: targetDelivery,
    container: ".cont-delivery-pending",
    funtions: () => {
        saleBTN(config, () => binnacle(session.message.id, 'Orden de delivery', 'Orden aceptada', 'Se acepto una orden de delivery'))
    },
}
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
                            printDeliveyOff()
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
const printDeliveyOff = async () => {
    let resut = await searchParam({}, "order");
    let template = ""
    let data = []
    if (resut.length > 0) resut.forEach((order) => { if (order.status > 2) data.push({ ...order }) })
    if (data.length > 0) data.forEach((order) => { template += targetDelivery(order) })
    else {
        template = `
        <div class="col-12">
            <div class="d-flex justify-content-center align-items-center">
                <img src="./assets/img/bh_logo.png" alt="Logo" class="img-fluid opacity-25">
            </div>
        </div>
        `
    }
    document.querySelector(".cont-delivery-off").innerHTML = template
}
// IntroJs
document.getElementById('navbarDropdown').addEventListener('click', function () {
    if (typeof introJs !== 'undefined') {
        let intro = introJs();
        intro.setOptions({
            steps: [
                {
                    element: document.querySelector('.page-wrapper'),
                    intro: 'Bienvenido a la seccion de delivery, aqui podras ver todas las ordenes a domicilio de tu negocio.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('#home-tab'),
                    intro: 'Aqui podras ver todas las ordenes a domicilio, pendientes para entregar.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('#profile-tab'),
                    intro: 'Aqui podras ver todas las ordenes para llevar ya entregadas.',
                    position: 'bottom'
                },
                {
                    element: document.querySelector('.card'),
                    intro: 'Tarjeta de ordenes a domicilio pendientes, puedes ver los detalles de la orden y aceptar la entrega.',
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
print(config)
printDeliveyOff()