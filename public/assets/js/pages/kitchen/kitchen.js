import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { print, searchParam, binnacle, sessionInfo } = functionGeneral();
const { targetKitchen } = Templates();
let session = await sessionInfo()
const config = {
    search: () => searchParam({ status: 1 }, "order"),
    template: targetKitchen,
    container: ".kitchen-cont-prepared",
    funtions: () => preparedKitchen()
}
print(config)
const printTargetPreparedOff = async () => {
    let resut = await searchParam({}, "order");
    let template = ""
    if (resut.length > 0) resut.forEach((order) => { if (order.status > 1) template += targetKitchen(order) })
    else {
        template = `
            <div class="col-12">
                <div class="d-flex justify-content-center align-items-center">
                    <img src="./assets/img/bh_logo.png" alt="Logo" class="img-fluid opacity-25">
                </div>
            </div>
            `
    }
    document.querySelector(".kitchen-cont-prepared-off").innerHTML = template
}
printTargetPreparedOff()
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
                        printTargetPreparedOff()
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