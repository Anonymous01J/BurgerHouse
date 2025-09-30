import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
import { invoice } from "./report.js"

const { print, searchParam, searchFilter, amountDolar } = functionGeneral()
const { targetInvoice, targetInvoiceReservation } = Templates()
const dolar = parseFloat(await amountDolar())
const config = {
    search: () => searchParam({ status: 'entregada', tipo: 'delivery' }, "order", 12),
    template: targetInvoice,
    container: ".cont_invoice",
    funtions: () => {
        viewDetails()
    },
}
const configRes = {
    search: () => searchParam({ status: 'finalizada' }, "calendar", 12),
    template: targetInvoiceReservation,
    container: ".cont_invoice_reservation",
    funtions: () => {
        viewDetails()
    },
}
print(config)
print(configRes)

searchFilter("#searchInvoice", (e) => {
    if (e.target.value == "") print(config)
    else print({ ...config, search: () => searchParam({ nombre_like: e.target.value }, "order", 12) })
})
searchFilter("#searchInvoiceRes", (e) => {
    if (e.target.value == "") print(configRes)
    else print({
        ...config,
        search: () => searchParam({ nombre_like: e.target.value }, "calendar", 12),
        container: ".cont_invoice_reservation",
        template: targetInvoiceReservation
    })
})

document.querySelectorAll(".btn_check").forEach(item => {
    item.addEventListener("click", () => {
        let type = item.id
        if (type == "invoice_delivery") print(config)
        else if (type == "invoice_takeaway") print({ ...config, search: () => searchParam({ tipo: "llevar", status: "entregada" }, "order", 12) })
        else if (type == "invoice_local") print({ ...config, search: () => searchParam({ tipo: "local", status: "pagado" }, "order", 12) })
    })
})
const viewDetails = () => {
    const btnDetails = document.querySelectorAll(".btn-details-invoice")
    btnDetails.forEach(btn => {
        btn.addEventListener("click", async () => {
            if (btn.getAttribute("type") == "order") {
                document.querySelector(".btn-print-invoice").setAttribute("data-id", btn.getAttribute("data-id"))
                document.querySelector(".btn-print-invoice").setAttribute("type", "order")
                document.querySelector(".btn-print-invoice").setAttribute("data-id-sale", btn.getAttribute("data-id-sale"))
                const id = btn.getAttribute("data-id")
                const id_venta = btn.getAttribute("data-id-sale")
                let petOrder = await searchParam({ id: id }, "order")
                document.querySelector(".nro_invoice").textContent = "Factura: " + petOrder[0].id.toString().padStart(8, "0")
                bootstrap.Modal.getOrCreateInstance(document.querySelector("#modal-details-invoice")).show()
                const { templateProductPrepared, templateProductProcess } = await detailsProduct(id)
                document.querySelector(".tbody-detail-invoice").innerHTML = templateProductPrepared
                document.querySelector(".tbody-detail-invoice").innerHTML += templateProductProcess
                const templatePay = await detailsPay(id_venta)
                document.querySelector(".cont-detail-payment").innerHTML = templatePay
                amount(id)
            } else {
                document.querySelector(".btn-print-invoice").setAttribute("data-id-order", btn.getAttribute("data-id-order"))
                document.querySelector(".btn-print-invoice").setAttribute("data-id-reservation", btn.getAttribute("data-id-reservation"))
                document.querySelector(".btn-print-invoice").setAttribute("type", "reservation")

                const id_order = btn.getAttribute("data-id-order")
                const id_reservation = btn.getAttribute("data-id-reservation")
                let petOrder = await searchParam({ id: id_order }, "order")
                document.querySelector(".nro_invoice").textContent = "Factura: " + petOrder[0].id.toString().padStart(8, "0")
                const { templateProductPrepared, templateProductProcess } = await detailsProduct(id_order)
                document.querySelector(".tbody-detail-invoice").innerHTML = templateProductPrepared
                document.querySelector(".tbody-detail-invoice").innerHTML += templateProductProcess
                let template = ""
                const templateSale = await detailsPay(petOrder[0].id_venta)
                const templateReservation = await detailsPayRes(id_reservation)
                template += templateSale
                template += templateReservation
                document.querySelector(".cont-detail-payment").innerHTML = template
                amount(id_order)
                bootstrap.Modal.getOrCreateInstance(document.querySelector("#modal-details-invoice")).show()
            }
        })
    })
}
const detailsProduct = async (id_order) => {
    let data = new FormData();
    data.append("id_orden", id_order)
    let dataProductPrepared = []
    let templateProductPrepared = ""
    let templateProductProcess = ""
    let pet1 = await fetch("Detalle_orden_producto_preparado/get_all", { method: "POST", body: data })
    let pet2 = await fetch("Detalle_orden_producto_procesado/get_all", { method: "POST", body: data })
    let res = await pet1.json()
    let res2 = await pet2.json()
    let group = {}
    res.forEach((productPrepared) => { if (productPrepared.tipo == "producto") dataProductPrepared.push(productPrepared) })
    dataProductPrepared.forEach((productPrepared) => {
        templateProductPrepared += `
            <tr>
              <td>${productPrepared.nombre}</td>
              <td>${productPrepared.cantidad}</td>
              <td>${productPrepared.precio} $</td>
              <td>${productPrepared.descripcion == null ? "S/D" : productPrepared.descripcion}</td>
              <td>${productPrepared.adicionales == null ? "S/A" : productPrepared.adicionales}</td>
            </tr>
          `
    })
    res2.forEach((productProcess) => {
        if (!group[productProcess.id_producto]) group[productProcess.id_producto] = productProcess
        else group[productProcess.id_producto] = { ...group[productProcess.id_producto], cantidad: parseInt(group[productProcess.id_producto].cantidad) + parseInt(productProcess.cantidad) }
    })
    group = Object.entries(group).map(([key, value]) => ({ id_producto: key, ...value }));
    group.forEach((productProcess) => {
        templateProductProcess += `
            <tr>
              <td>${productProcess.nombre}</td>
              <td>${productProcess.cantidad}</td>
              <td>${productProcess.precio} $</td>
            </tr>
          `
    })
    return {
        templateProductPrepared,
        templateProductProcess
    }

}
const detailsPay = async (id_venta) => {
    let data = new FormData();
    data.append("id_venta", id_venta)
    let dataPayment = []
    let templatePayment = ""
    let pet = await fetch("paymentSale/get_all/0/10000000/id/asc", { method: "POST", body: data })
    let res = await pet.json()
    res.forEach((payment) => {
        templatePayment += `
      <div class="col-md-7 mt-3 d-flex align-items-center justify-content-between">
          <h3>Tipo de pago: ${payment.metodo_pago}</h3>
          <h3>Monto: ${payment.monto}</h3>
      </div>`
    })
    return templatePayment

}
const detailsPayRes = async (id_reservation) => {
    let data = new FormData();
    data.append("id_reserva", id_reservation)
    let templatePayment = ""
    let pet = await fetch("paymentReservation/get_all/0/10000000/id/asc", { method: "POST", body: data })
    let res = await pet.json()
    res.forEach((payment) => {
        templatePayment += `
      <div class="col-md-7 mt-3 d-flex align-items-center justify-content-between">
          <h3>Tipo de pago: ${payment.metodo_pago}</h3>
          <h3>Monto: ${payment.monto}</h3>
      </div>`
    })
    return templatePayment
}
const amount = async (id_order) => {
    let detailsPrepered = await searchParam({ id_orden: id_order }, "Detalle_orden_producto_preparado")
    let detailsProcess = await searchParam({ id_orden: id_order }, "Detalle_orden_producto_procesado")
    let totalAmountPrepared = detailsPrepered.map(item => item.precio * item.cantidad).reduce((a, b) => a + b, 0)
    let totalAmountProcess = detailsProcess.map(item => item.precio * item.cantidad).reduce((a, b) => a + b, 0)
    let iva = (totalAmountPrepared + totalAmountProcess) * 0.16

    let amountTotal = {
        total_dolares: (((totalAmountPrepared + totalAmountProcess) + iva).toFixed(2)),
        total_bs: (((totalAmountPrepared + totalAmountProcess) + iva) * dolar).toFixed(2),
        subtotal: ((totalAmountPrepared + totalAmountProcess).toFixed(2)),
        iva: (iva.toFixed(2))
    }
    document.querySelector(".iva-invoice").textContent = amountTotal.iva + " $"
    document.querySelector(".subtotal-invoice").textContent = amountTotal.subtotal + " $"
    document.querySelector(".total-invoice").textContent = amountTotal.total_dolares + " $" + " / " + amountTotal.total_bs + " Bs"
}
const printInvoice = async () => {
    let btn = document.querySelector(".btn-print-invoice")
    btn.addEventListener("click", async () => {
        if (btn.getAttribute("type") == "order") {
            let id = btn.getAttribute("data-id")
            let info = await searchParam({ id: id }, "order")
            let detailsPrepered = await searchParam({ id_orden: id }, "Detalle_orden_producto_preparado")
            let detailsProcess = await searchParam({ id_orden: id }, "Detalle_orden_producto_procesado")
            let totalAmountPrepared = detailsPrepered.map(item => item.precio * item.cantidad).reduce((a, b) => a + b, 0)
            let totalAmountProcess = detailsProcess.map(item => item.precio * item.cantidad).reduce((a, b) => a + b, 0)
            let iva = (totalAmountPrepared + totalAmountProcess) * 0.16
            let clientData = {
                id_cliente: info[0].id_cliente ?? "POR ASIGNAR",
                nameClient: info[0].cliente_nombre ? info[0].cliente_nombre + " " + info[0].cliente_apellido : "POR ASIGNAR",
                telefonoClient: info[0].cliente_telefono ?? "POR ASIGNAR"
            };
            let amountTotal = {
                total_dolares: "TOTAL: " + (((totalAmountPrepared + totalAmountProcess) + iva).toFixed(2)),
                total_bs: (((totalAmountPrepared + totalAmountProcess) + iva) * await amountDolar()).toFixed(2),
                subtotal: "SUBTOTAL: " + ((totalAmountPrepared + totalAmountProcess).toFixed(2)),
                iva: "IVA: " + (iva.toFixed(2))
            }

            let dataPayment = new FormData();
            dataPayment.append("id_venta", document.querySelector(".btn-print-invoice").getAttribute("data-id-sale"))
            let pet = await fetch("paymentSale/get_all/0/10000000/id/asc", { method: "POST", body: dataPayment })
            let payments = await pet.json()

            invoice(detailsPrepered, detailsProcess, clientData, id, info[0].direccion, amountTotal, info, { payments, reservation: [] })
        } else {
            let id = btn.getAttribute("data-id-order")
            let id_reservation = btn.getAttribute("data-id-reservation")
            let info = await searchParam({ id: id }, "order")
            let detailsPrepered = await searchParam({ id_orden: id }, "Detalle_orden_producto_preparado")
            let detailsProcess = await searchParam({ id_orden: id }, "Detalle_orden_producto_procesado")
            let totalAmountPrepared = detailsPrepered.map(item => item.precio * item.cantidad).reduce((a, b) => a + b, 0)
            let totalAmountProcess = detailsProcess.map(item => item.precio * item.cantidad).reduce((a, b) => a + b, 0)
            let iva = (totalAmountPrepared + totalAmountProcess) * 0.16
            let clientData = {
                id_cliente: info[0].id_cliente ?? "POR ASIGNAR",
                nameClient: info[0].cliente_nombre ? info[0].cliente_nombre + " " + info[0].cliente_apellido : "POR ASIGNAR",
                telefonoClient: info[0].cliente_telefono ?? "POR ASIGNAR"
            };
            let amountTotal = {
                total_dolares: "TOTAL: " + (((totalAmountPrepared + totalAmountProcess) + iva).toFixed(2)),
                total_bs: (((totalAmountPrepared + totalAmountProcess) + iva) * await amountDolar()).toFixed(2),
                subtotal: "SUBTOTAL: " + ((totalAmountPrepared + totalAmountProcess).toFixed(2)),
                iva: "IVA: " + (iva.toFixed(2))
            }

            let dataPayment = new FormData();
            dataPayment.append("id_venta", info[0].id_venta)
            let pet = await fetch("paymentSale/get_all/0/10000000/id/asc", { method: "POST", body: dataPayment })
            let payments = await pet.json()

            let dataAbove = new FormData();
            dataAbove.append("id_reserva", id_reservation)
            let pet2 = await fetch("paymentReservation/get_all/0/10000000/id/asc", { method: "POST", body: dataAbove })
            let reservation = await pet2.json()

            invoice(detailsPrepered, detailsProcess, clientData, id, info[0].direccion, amountTotal, info, { payments, reservation })
        }

    })

}
printInvoice()