import functionGeneral from "../../Functions.js";
const { fecha, hora, amountDolar } = functionGeneral()
import { Poppins_normal } from "../../../libs/libs/jspdf/poppins.js"
import { poppins_bold } from "../../../libs/libs/jspdf/poppins_bold.js"

export async function invoice(productPrepared, productProcess, clientData, id_order, direccion, totalAmount, info, paymentData) {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    doc.addFileToVFS("Poppins-Regular.ttf", Poppins_normal);
    doc.addFont("Poppins-Regular.ttf", "Poppins", "normal");
    doc.addFileToVFS("Poppins-Bold.ttf", poppins_bold);
    doc.addFont("Poppins-Bold.ttf", "Poppins", "bold");
    doc.setFont("Poppins", "normal");
    doc.setTextColor(255, 75, 0)
    doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    doc.internal.events.subscribe('addPage', () => {
        doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    });
    doc.setFontSize(18);
    doc.setFont("Poppins", "bold");
    doc.text(`NRO DE FACTURA: ${id_order.toString().padStart(5, '0')}`, 10, 85);
    doc.setTextColor(41, 40, 37)
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`FECHA DE IMPRESION: ${fecha(info[0].fecha)}`, 140, 85);
    doc.setFontSize(10);
    doc.setTextColor(41, 40, 37)
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
    doc.text(`CLIENTE: ${clientData.nameClient.toUpperCase() ?? "POR ASIGNAR"}`, 10, 100);
    doc.text(`DIRECCION: ${direccion}`, 10, 108);
    doc.text(`TELEFONO: ${clientData.telefonoClient}`, 10, 115);

    doc.setFontSize(11);
    doc.setFont("Poppins", "bold");
    doc.text(`${totalAmount.subtotal} USD`, 100, 100);
    doc.text(`${totalAmount.iva} USD`, 100, 108);
    doc.text(`TOTAL DE ORDEN ${totalAmount.total_dolares + " USD" + " (" + totalAmount.total_bs + " Bs)"}`, 100, 115);

    doc.setFont("Poppins", "normal");
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 122);
    doc.setFontSize(18);
    doc.setFont("Poppins", "bold");
    doc.text(`DETALLES DE ORDEN`, 75, 132);
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 138);
    let currentY = 150;
    const startX = 180;
    const lineHeight = 10;
    const pageHeight = doc.internal.pageSize.height;
    let adicionales = [];
    productPrepared.forEach((item) => {
        if (item.tipo == "adicional") adicionales.push(item)
        if (item.tipo != "adicional" || item.tipo == undefined) {
            if (currentY + lineHeight > pageHeight - 20) {
                doc.addPage();
                currentY = 85;
            }
            doc.setFontSize(18);
            doc.setFont("Poppins", "bold");
            doc.text(`${item.cantidad + " x " + item.nombre}`, 10, currentY);
            doc.setFont("Poppins", "normal");
            doc.setFontSize(13);
            doc.text(`${"..........................................................................."}`, 95, currentY);
            doc.text(`${item.precio * item.cantidad + " USD"}`, 175, currentY);
            currentY += 8
            doc.setFont("Poppins", "normal");
            doc.setFontSize(12);
            item.detalles != "" && item.detalles != null ? doc.text(`DETALLES: ${item.detalles}`, 15, currentY) : ""
            item.detalles != "" && item.detalles != null ? currentY += 6 : ""
            item.adicionales != "" && item.adicionales != null ? doc.text(`ADICIONALES: ${adicionales.map((adicional) => adicional.nombre).join(", ")}`, 15, currentY) : ""
            item.adicionales != "" && item.adicionales != null ? doc.text(`................................ ${adicionales.reduce((total, adicional) => total + parseFloat(adicional.precio), 0)} USD`, 120, currentY) : ""
            item.adicionales != "" && item.adicionales != null ? currentY += 6 : ""
            currentY += 4;
        }
    })
    let group = {}
    productProcess.forEach((item) => {
        if (!group[item.nombre]) group[item.nombre] = item;
        else group[item.nombre] = { ...item, cantidad: parseInt(group[item.nombre].cantidad) + parseInt(item.cantidad) };
    })
    group = Object.entries(group).map(([key, value]) => ({ nombre: key, ...value }));
    group.forEach((item) => {
        if (currentY + lineHeight > pageHeight - 20) {
            doc.addPage();
            currentY = 85;
        }
        doc.setFontSize(18);
        doc.setFont("Poppins", "bold");
        doc.text(`${item.cantidad + " x " + item.nombre}`, 10, currentY);
        doc.setFont("Poppins", "normal");
        doc.setFontSize(13);
        doc.text(`${"..........................................................................."}`, 95, currentY);
        doc.text(`${item.precio * item.cantidad + " USD"}`, 175, currentY);
        currentY += 8
    })

    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, currentY);
    currentY += 10;
    doc.setFontSize(18);
    doc.setFont("Poppins", "bold");
    doc.text(`DETALLES DE PAGO`, 75, currentY);
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    currentY += 8
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, currentY);
    currentY += 10;
    paymentData.payments.forEach((item) => {
        let signo = item.metodo_pago.toLowerCase() == "efectivo" || item.metodo_pago.toLowerCase() == "transferencia" || item.metodo_pago.toLowerCase() == "pago movil" ? "Bs" : "$";
        if (currentY + lineHeight > pageHeight - 20) {
            doc.addPage();
            currentY = 85;
        }
        doc.setFontSize(18);
        doc.setFont("Poppins", "bold");
        doc.text(`${item.metodo_pago}`, 10, currentY);
        doc.setFont("Poppins", "normal");
        doc.setFontSize(13);
        doc.text(`${item.monto} ${signo}`, 70, currentY);
        currentY += 8
    })
    paymentData.reservation.forEach((item) => {
        let signo = item.metodo_pago.toLowerCase() == "efectivo" || item.metodo_pago.toLowerCase() == "transferencia" || item.metodo_pago.toLowerCase() == "pago movil" ? "Bs" : "$";
        if (currentY + lineHeight > pageHeight - 20) {
            doc.addPage();
            currentY = 85;
        }
        doc.setFontSize(18);
        doc.setFont("Poppins", "bold");
        doc.text(`${item.metodo_pago}`, 10, currentY);
        doc.setFont("Poppins", "normal");
        doc.setFontSize(13);
        doc.text(`${item.monto} ${signo}`, 70, currentY);
        currentY += 8
    })


    window.open(doc.output('bloburl'), '_blank');
}