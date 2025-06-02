import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";

const { print, searchParam, binnacle, sessionInfo } = functionGeneral();
const { targetKitchen } = Templates();
let session = await sessionInfo()
const printTargetPrepared = async () => {
    let template = ""
    let resut = await searchParam({ status: 1 }, "order");
    if (resut.length > 0) {
        resut.forEach((order) => { template += targetKitchen(order) })
        document.querySelector(".kitchen-cont-prepared").innerHTML = template
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
                        let data = new FormData();
                        data.append("id", id)
                        data.append("status", 2)
                        let pet = await fetch('order/update', { method: "POST", body: data })
                        let res = await pet.json()
                        if (res.success == true) {
                            Swal.fire({
                                title: `Exito!`,
                                text: "La orden se preparo correctamente",
                                icon: "success",
                            });
                            printTargetPrepared()
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
    } else {
        template = `
            <div class="col-12">
                <div class="d-flex justify-content-center align-items-center">
                    <img src="./assets/img/bh_logo.png" alt="Logo" class="img-fluid opacity-25">
                </div>
            </div>
            `
        document.querySelector(".kitchen-cont-prepared").innerHTML = template
    }
}
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
printTargetPrepared()
printTargetPreparedOff()