import functionGeneral from "../../Functions.js";
const { searchParam, fecha } = functionGeneral()
import { Poppins_normal } from "../../../libs/libs/jspdf/poppins.js"
import { poppins_bold } from "../../../libs/libs/jspdf/poppins_bold.js"
export function report(amountCash, detailsCash, totalBs, totalDolar) {
    let btn = document.querySelector(".btn_print");
    btn.addEventListener("click", async () => {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
        doc.addFileToVFS("Poppins-Regular.ttf", Poppins_normal);
        doc.addFont("Poppins-Regular.ttf", "Poppins", "normal");
        doc.addFileToVFS("Poppins-Bold.ttf", poppins_bold);
        doc.addFont("Poppins-Bold.ttf", "Poppins", "bold");
        doc.setFont("Poppins", "normal");
        doc.setTextColor(255, 75, 0)
        doc.addImage("./assets/img/reportes_banners/reporte_caja.webp", 'WEBP', 0, 0, 210, 297);
        doc.internal.events.subscribe('addPage', () => {
            doc.addImage("./assets/img/reportes_banners/reporte_caja.webp", 'WEBP', 0, 0, 210, 297);
        });
        let infoCash = await searchParam({ id: btn.getAttribute("data-id") }, "cash")
        let user = await searchParam({ id: infoCash[0].id_usuario }, "users", 1)
        doc.setFontSize(18);
        doc.setFont("Poppins", "bold");
        doc.text(`CAJA NRO: ${infoCash[0].id}`, 10, 85);
        doc.setTextColor(41, 40, 37)
        doc.setFont("Poppins", "normal");
        doc.setFontSize(10);
        doc.text(`FECHA DE IMPRESION: ${new Date().toLocaleDateString()}`, 140, 85);
        doc.setFontSize(10);
        doc.setTextColor(41, 40, 37)
        doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
        doc.text(`USUARIO: ${(user[0].nombre + " " + user[0].apellido).toUpperCase()}`, 10, 100);
        doc.text(`FECHA DE APERTURA: ${fecha(infoCash[0].fecha_apertura)}`, 80, 100);
        doc.setFont("Poppins", "bold");
        doc.text(`MONTO INICIAL BS: ${infoCash[0].monto_inicial_bs}`, 10, 108);
        doc.text(`MONTO INICIAL $: ${infoCash[0].monto_inicial_dolar}`, 10, 115);
        doc.setFont("Poppins", "normal");
        doc.text(`ESTADO: ${infoCash[0].estado == 1 ? "ABIERTA" : "CERRADA"}`, 80, 108);
        doc.text(`..................................................................................................................................................................................................................................................................`, 10, 122);
        doc.setFontSize(18);
        doc.setFont("Poppins", "bold");
        doc.text(`CUADRE DE CAJA`, 75, 132);
        doc.setFont("Poppins", "normal");
        doc.setFontSize(10);
        doc.text(`..................................................................................................................................................................................................................................................................`, 10, 138);
        amountCash.forEach((element, index) => {
            let money
            if (element.metodo_pago.toLowerCase() == "transferencia" || element.metodo_pago.toLowerCase() == "pago movil") money = "Bs"
            else money = "$"
            doc.setFont("Poppins", "bold");
            doc.text(`${element.metodo_pago}`, 20 + index * 30, 150, { align: "center" });
            doc.setFont("Poppins", "normal");
            doc.text(`${element.monto.toFixed(2)} ${money}`, 20 + index * 30, 158, { align: "center" });
        })
        doc.setFont("Poppins", "bold");
        doc.text(`TOTAL: ${(totalDolar.reduce((acc, item) => acc + item, 0) + infoCash[0].monto_inicial_dolar).toFixed(2)} $ --- ${(totalBs.reduce((acc, item) => acc + item, 0) + infoCash[0].monto_inicial_bs).toFixed(2)} BS`, 10, 170);
        doc.setFontSize(18);
        doc.text(`DETALLES DEL CUADRE DE CAJA`, 53, 185);
        doc.setFont("Poppins", "normal");
        doc.setFontSize(10);

        let currentY = 198;
        const startX = 180;
        const lineHeight = 10;
        const pageHeight = doc.internal.pageSize.height;
        Object.keys(detailsCash).forEach((key) => {
            if (currentY + lineHeight > pageHeight - 20) {
                doc.addPage();
                currentY = 85;
            }
            doc.setFont("Poppins", "bold");
            doc.setFontSize(12);
            doc.text(`INGRESOS POR ${key.toUpperCase()}`, 15, currentY);
            currentY += 10;
            detailsCash[key].forEach((item) => {
                let money = (item.metodo_pago.toLowerCase() == "transferencia" || item.metodo_pago.toLowerCase() == "pago movil") ? "Bs" : "$";
                if (currentY + lineHeight > pageHeight - 20) {
                    doc.addPage();
                    currentY = 85;
                }
                doc.setFont("Poppins", "normal");
                doc.setFontSize(10);
                doc.text(`● PAGO DE VENTA DE ${item.cliente.toUpperCase()} POR ORDEN NRO: ${item.nro_orden}`, 20, currentY);
                doc.setFont("Poppins", "bold");
                let monto = item.metodo_pago.toLowerCase() == "transferencia" || item.metodo_pago.toLowerCase() == "pago movil" ? item.monto : item.monto
                doc.text(`${monto.toFixed(2)} ${money}`, startX, currentY, { align: "right" });
                currentY += 7;
            });
            currentY += 10;
        });
        window.open(doc.output('bloburl'), '_blank');
    });
}
