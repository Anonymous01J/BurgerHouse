import functionGeneral from "../../Functions.js";
const { fecha, hora } = functionGeneral()
import { Poppins_normal } from "../../../libs/libs/jspdf/poppins.js"
import { poppins_bold } from "../../../libs/libs/jspdf/poppins_bold.js"
export function report(info, productPrepared, productProcess) {
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
        doc.addImage("./assets/img/reportes_banners/reporte_detalle_orden.webp", 'WEBP', 0, 0, 210, 297);
        doc.internal.events.subscribe('addPage', () => {
            doc.addImage("./assets/img/reportes_banners/reporte_detalle_orden.webp", 'WEBP', 0, 0, 210, 297);
        });
        doc.setFontSize(18);
        doc.setFont("Poppins", "bold");
        doc.text(`NRO DE ORDEN: ${info[0].nro_orden}`, 10, 85);
        doc.setTextColor(41, 40, 37)
        doc.setFont("Poppins", "normal");
        doc.setFontSize(10);
        doc.text(`FECHA DE IMPRESION: ${new Date().toLocaleDateString()}`, 140, 85);
        doc.setFontSize(10);
        doc.setTextColor(41, 40, 37)
        doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
        doc.text(`CLIENTE: ${info[0].cliente ? (info[0].cliente_nombre + " " + info[0].cliente_apellido).toUpperCase() : "POR ASIGNAR"}`, 10, 100);
        doc.text(`FECHA: ${fecha(info[0].fecha) + " A LAS " + hora(info[0].fecha)}`, 80, 100);
        doc.text(`DIRECCION: ${info[0].direccion || "POR ASIGNAR"}`, 10, 108);
        doc.text(`TELEFONO: ${info[0].cliente_telefono || "S/T"}`, 10, 115);
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
        productPrepared.forEach((item) => {
            if (item.tipo != "adicional" || item.tipo == undefined) {
                if (currentY + lineHeight > pageHeight - 20) {
                    doc.addPage();
                    currentY = 85;
                }
                doc.setFontSize(18);
                doc.setFont("Poppins", "bold");
                doc.text(`${item.cantidad + " x " + item.nombre}`, 10, currentY);
                currentY += 8
                doc.setFont("Poppins", "normal");
                doc.setFontSize(12);
                item.descripcion != "" && item.descripcion != null ? doc.text(`DETALLES: ${(item.descripcion).toUpperCase()}`, 15, currentY) : ""
                item.descripcion != "" && item.descripcion != null ? currentY += 6 : ""
                item.adicionales != "" && item.adicionales != null ? doc.text(`ADICIONALES: ${(item.adicionales).toUpperCase()}`, 15, currentY) : ""
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
            currentY += 8
        })
        window.open(doc.output('bloburl'), '_blank');
    });
}
