import functionGeneral from "../../Functions.js";
import { Poppins_normal } from "../../../libs/libs/jspdf/poppins.js"
import { poppins_bold } from "../../../libs/libs/jspdf/poppins_bold.js"
export function recipe_detail(name, data) {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    doc.addFileToVFS("Poppins-Regular.ttf", Poppins_normal);
    doc.addFont("Poppins-Regular.ttf", "Poppins", "normal");
    doc.addFileToVFS("Poppins-Bold.ttf", poppins_bold);
    doc.addFont("Poppins-Bold.ttf", "Poppins", "bold");
    doc.setFont("Poppins", "normal");
    // doc.setTextColor(255, 75, 0)
    doc.setTextColor(41, 40, 37)

    doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    doc.internal.events.subscribe('addPage', () => {
        doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    });
    doc.setFontSize(25);
    doc.setFont("Poppins", "bold");
    doc.text(`RECETA`, 60, 43);
    doc.text(`${name}`, 60, 55);
    doc.setTextColor(41, 40, 37)
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`FECHA DE IMPRESION: ${new Date().toLocaleDateString()}`, 140, 85);
    doc.setFontSize(10);
    doc.setTextColor(41, 40, 37)
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
    doc.setFontSize(18);
    doc.setFont("Poppins", "bold");
    doc.text(`DETALLES DE RECETA`, 75, 100);
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 105);
    let currentY = 120;
    const startX = 180;
    const lineHeight = 10;
    const pageHeight = doc.internal.pageSize.height;
    data.forEach((item) => {
        if (currentY + lineHeight > pageHeight - 20) {
            doc.addPage();
            currentY = 85;
        }
        doc.setFontSize(18);
        doc.setFont("Poppins", "bold");
        doc.setFillColor("#FF4B00");
        doc.circle(12, currentY - 2, 2, 'F');
        doc.text(`${item.ingrediente + " x " + item.cantidad} ${item.unidad}`, 18, currentY);
        currentY += 10
    })
    window.open(doc.output('bloburl'), '_blank');
}
export function recipe_detail_all(data) {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    doc.addFileToVFS("Poppins-Regular.ttf", Poppins_normal);
    doc.addFont("Poppins-Regular.ttf", "Poppins", "normal");
    doc.addFileToVFS("Poppins-Bold.ttf", poppins_bold);
    doc.addFont("Poppins-Bold.ttf", "Poppins", "bold");
    doc.setFont("Poppins", "normal");
    // doc.setTextColor(255, 75, 0)
    doc.setTextColor(41, 40, 37)

    doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    doc.internal.events.subscribe('addPage', () => {
        doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    });
    doc.setFontSize(28);
    doc.setFont("Poppins", "bold");
    doc.text(`RECETAS`, 60, 54);
    doc.setTextColor(41, 40, 37)
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`FECHA DE IMPRESION: ${new Date().toLocaleDateString()}`, 140, 85);
    doc.setFontSize(10);
    doc.setTextColor(41, 40, 37)
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
    doc.setFontSize(18);
    doc.setFont("Poppins", "bold");
    doc.text(`DETALLES DE RECETA`, 75, 100);
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 105);
    let currentY = 120;
    const startX = 180;
    const lineHeight = 10;
    const pageHeight = doc.internal.pageSize.height;
    data.forEach((item) => {
        if (currentY + lineHeight > pageHeight - 20) {
            doc.addPage();
            currentY = 85;
        }
        doc.setFontSize(18);
        doc.setFont("Poppins", "bold");
        doc.text(`${item.name}`, 10, currentY);
        currentY += 9
        doc.setFont("Poppins", "normal");
        doc.setFontSize(12);
        item.data.forEach((item) => {
            if (currentY + lineHeight > pageHeight - 20) {
                doc.addPage();
                currentY = 85;
            }
            doc.setFillColor("#FF4B00");
            doc.circle(15, currentY - 2, 1, 'F');
            doc.text(`${item.ingrediente + " x " + item.cantidad} ${item.unidad}`, 20, currentY);
            currentY += 8
        })
    })
    window.open(doc.output('bloburl'), '_blank');
}