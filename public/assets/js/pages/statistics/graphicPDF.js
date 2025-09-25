import { Poppins_normal } from "../../../libs/libs/jspdf/poppins.js"
import { poppins_bold } from "../../../libs/libs/jspdf/poppins_bold.js"
export const printPDF = () => {
    document.querySelectorAll(".btn_print_graphic").forEach((btn) => {
        if (!btn.dataset.listenerAttached) {
            btn.addEventListener("click", () => {
                let graphic = btn.getAttribute("graphic")
                let temporality = btn.closest(".card").querySelector(".type_flter_date").textContent
                let canvas = btn.closest(".card").querySelector("canvas");
                if (graphic == "Gasto Promedio") pdfGraphic1({ ...window.currentGraphic1Data, temporality: temporality, canvas: canvas })
                else if (graphic == "Total de ventas") pdfGraphic2(window.currentGraphic2Data, { temporality: temporality, canvas: canvas })
                else if (graphic == "productos mas vendidos") pdfGraphic5({ ...window.currentGraphic5Data, temporality: temporality, canvas: canvas })
                else if (graphic == "Utilidad neta") pdfGraphic1Dashboard({ ...window.currentGraphic1DashboardData, temporality: temporality, canvas: canvas })
                else if (graphic == "Ingresos") pdfGraphic2Dashboard({ ...window.currentGraphic2DashboardData, temporality: temporality, canvas: canvas })
                else if (graphic == "productos menos vendidos") pdfGraphic6({ ...window.currentGraphic6Data, temporality: temporality, canvas: canvas })
            })
            btn.dataset.listenerAttached = true
        }
    })
}
const pdfGraphic1 = (data) => {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    const imgData = data.canvas.toDataURL('image/png');
    doc.addFileToVFS("Poppins-Regular.ttf", Poppins_normal);
    doc.addFont("Poppins-Regular.ttf", "Poppins", "normal");
    doc.addFileToVFS("Poppins-Bold.ttf", poppins_bold);
    doc.addFont("Poppins-Bold.ttf", "Poppins", "bold");
    doc.setFont("Poppins", "normal");
    doc.setFontSize(33, 7);
    doc.setFont("Poppins", "bold");
    doc.setTextColor(41, 40, 37)
    doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    doc.text(`GASTO PROMEDIO`, 60, 43);
    doc.text(`CLIENTE`, 60, 55);
    doc.internal.events.subscribe('addPage', () => {
        doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    });
    doc.setTextColor(255, 75, 0)
    doc.setFontSize(16);
    doc.text(`${(data.temporality).toUpperCase()}`, 10, 85);
    doc.setTextColor(41, 40, 37)
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`FECHA DE IMPRESION: ${new Date().toLocaleDateString()}`, 140, 85);
    doc.setFontSize(10);
    doc.setTextColor(41, 40, 37)
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
    let diasMax = `MAS GASTO:` + " " + data.gasto_max_labels + " con " + data.gasto_max.toFixed(2) + " $"
    let diasMin = `MENOS GASTO:` + " " + data.gasto_min_labels + " con " + data.gasto_min.toFixed(2) + " $"

    doc.addImage(imgData, 'PNG', 10, 100, 185, 100)
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 210, 2, 'F');
    doc.text(doc.splitTextToSize(diasMax, 180), 14, 211);
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 220, 2, 'F');
    doc.text(doc.splitTextToSize(diasMin, 180), 14, 221);
    doc.setFillColor(255, 178, 0);
    doc.circle(10, 230, 2, 'F');
    doc.text(`PROMEDIO DE GASTO: ${(data.promedio).toFixed(2)} $`, 14, 231);

    let nota = `# NOTA: LOS VALORES POR ENCIMA DEL PROMEDIO, INDICAN UN GASTO SUPERIOR AL ESPERADO. LOS VALORES POR DEBAJO DEL PROMEDIO INDICAN UN GASTO INFERIOR AL ESPERADO`
    doc.text(doc.splitTextToSize(nota, 190), 10, 250);
    window.open(doc.output('bloburl'), '_blank');
}
const pdfGraphic2 = (data, { canvas, temporality }) => {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    const imgData = canvas.toDataURL('image/png');
    doc.addFileToVFS("Poppins-Regular.ttf", Poppins_normal);
    doc.addFont("Poppins-Regular.ttf", "Poppins", "normal");
    doc.addFileToVFS("Poppins-Bold.ttf", poppins_bold);
    doc.addFont("Poppins-Bold.ttf", "Poppins", "bold");
    doc.setFont("Poppins", "normal");
    doc.setFontSize(33, 7);
    doc.setFont("Poppins", "bold");
    doc.setTextColor(41, 40, 37)
    doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    doc.text(`TOTAL DE VENTAS`, 60, 55);
    doc.internal.events.subscribe('addPage', () => {
        doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    });
    doc.setTextColor(255, 75, 0)
    doc.setFontSize(16);
    doc.text(`${(temporality).toUpperCase()}`, 10, 85);
    doc.setTextColor(41, 40, 37)
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`FECHA DE IMPRESION: ${new Date().toLocaleDateString()}`, 140, 85);
    doc.setFontSize(10);
    doc.setTextColor(41, 40, 37)
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
    doc.addImage(imgData, 'PNG', 65, 100, 80, 80)
    let color = ["#FF4B00", "#FFB200", "#b41a1a"]
    data.forEach((item, index) => {
        doc.setFillColor(color[index]);
        doc.circle(10, 200 + (index * 10), 2, 'F');
        doc.text(doc.splitTextToSize((item.tipo_orden + ": con " + item.total_ordenes + " ordenes " + " recaudando " + item.total_recaudado.toFixed(2) + " $").toUpperCase(), 180), 14, 201 + (index * 10));
    })
    doc.setFillColor("#0B1B21");
    doc.circle(10, 230, 2, 'F');
    doc.text(doc.splitTextToSize(`TOTAL DE ORDENES: ${data.reduce((a, b) => a + b.total_ordenes, 0)}`, 180), 14, 231);
    window.open(doc.output('bloburl'), '_blank');
}
const pdfGraphic5 = (data) => {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    const imgData = data.canvas.toDataURL('image/png');
    doc.addFileToVFS("Poppins-Regular.ttf", Poppins_normal);
    doc.addFont("Poppins-Regular.ttf", "Poppins", "normal");
    doc.addFileToVFS("Poppins-Bold.ttf", poppins_bold);
    doc.addFont("Poppins-Bold.ttf", "Poppins", "bold");
    doc.setFont("Poppins", "normal");
    doc.setFontSize(28);
    doc.setFont("Poppins", "bold");
    doc.setTextColor(41, 40, 37)
    doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    doc.text(`PRODUCTOS MAS VENDIDOS`, 60, 55);
    doc.internal.events.subscribe('addPage', () => {
        doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    });
    doc.setTextColor(255, 75, 0)
    doc.setFontSize(16);
    doc.text(`${(data.temporality).toUpperCase()}`, 10, 85);
    doc.setTextColor(41, 40, 37)
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`FECHA DE IMPRESION: ${new Date().toLocaleDateString()}`, 140, 85);
    doc.setFontSize(10);
    doc.setTextColor(41, 40, 37)
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
    let diasMax = `MAS VENDIDOS:` + " " + data.valor_max_label + " con " + data.valor_max + " unidades vendidas"
    let diasMin = `MENOS VENDIDOS:` + " " + data.valor_min_label + " con " + data.valor_min + " unidades vendidas"

    doc.addImage(imgData, 'PNG', 10, 100, 195, 100)
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 210, 2, 'F');
    doc.text(doc.splitTextToSize(diasMax, 180), 14, 211);
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 220, 2, 'F');
    doc.text(doc.splitTextToSize(diasMin, 180), 14, 221);
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 230, 2, 'F');
    doc.text(`PRODUCTO MAS VENDIDO: ${(data.dias_max).toUpperCase()}`, 14, 231);
    doc.setFillColor(255, 178, 0);
    doc.circle(10, 240, 2, 'F');
    doc.text(`PROMEDIO DE GASTO: ${(data.promedio).toFixed(2)} $`, 14, 241);
    let nota = `# NOTA: LOS VALORES POR ENCIMA DEL PROMEDIO, INDICAN UN VENTAS SUPERIORES A LAS ESPERADAS. LOS VALORES POR DEBAJO DEL PROMEDIO INDICAN UN VENTAS INFERIORES A LAS ESPERADAS`
    doc.text(doc.splitTextToSize(nota, 190), 10, 250);
    window.open(doc.output('bloburl'), '_blank');
}
const pdfGraphic6 = (data) => {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    const imgData = data.canvas.toDataURL('image/png');
    doc.addFileToVFS("Poppins-Regular.ttf", Poppins_normal);
    doc.addFont("Poppins-Regular.ttf", "Poppins", "normal");
    doc.addFileToVFS("Poppins-Bold.ttf", poppins_bold);
    doc.addFont("Poppins-Bold.ttf", "Poppins", "bold");
    doc.setFont("Poppins", "normal");
    doc.setFontSize(25);
    doc.setFont("Poppins", "bold");
    doc.setTextColor(41, 40, 37)
    doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    doc.text(`PRODUCTOS MENOS VENDIDOS`, 60, 55);
    doc.internal.events.subscribe('addPage', () => {
        doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    });
    doc.setTextColor(255, 75, 0)
    doc.setFontSize(16);
    doc.text(`${(data.temporality).toUpperCase()}`, 10, 85);
    doc.setTextColor(41, 40, 37)
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`FECHA DE IMPRESION: ${new Date().toLocaleDateString()}`, 140, 85);
    doc.setFontSize(10);
    doc.setTextColor(41, 40, 37)
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
    let diasMax = `MAS VENDIDOS:` + " " + data.valor_max_label + " con " + data.valor_max + " unidades vendidas"
    let diasMin = `MENOS VENDIDOS:` + " " + data.valor_min_label + " con " + data.valor_min + " unidades vendidas"

    doc.addImage(imgData, 'PNG', 10, 100, 195, 100)
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 210, 2, 'F');
    doc.text(doc.splitTextToSize(diasMax, 180), 14, 211);
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 220, 2, 'F');
    doc.text(doc.splitTextToSize(diasMin, 180), 14, 221);
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 230, 2, 'F');
    doc.text(`PRODUCTO MENOS VENDIDO: ${(data.dias_max).toUpperCase()}`, 14, 231);
    doc.setFillColor(255, 178, 0);
    doc.circle(10, 240, 2, 'F');
    doc.text(`PROMEDIO DE GASTO: ${(data.promedio).toFixed(2)} $`, 14, 241);
    let nota = `# NOTA: LOS VALORES POR ENCIMA DEL PROMEDIO, INDICAN UN VENTAS SUPERIORES A LAS ESPERADAS. LOS VALORES POR DEBAJO DEL PROMEDIO INDICAN UN VENTAS INFERIORES A LAS ESPERADAS`
    doc.text(doc.splitTextToSize(nota, 190), 10, 250);
    window.open(doc.output('bloburl'), '_blank');
}
const pdfGraphic1Dashboard = (data) => {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    const imgData = data.canvas.toDataURL('image/png');
    doc.addFileToVFS("Poppins-Regular.ttf", Poppins_normal);
    doc.addFont("Poppins-Regular.ttf", "Poppins", "normal");
    doc.addFileToVFS("Poppins-Bold.ttf", poppins_bold);
    doc.addFont("Poppins-Bold.ttf", "Poppins", "bold");
    doc.setFont("Poppins", "normal");
    doc.setFontSize(33, 7);
    doc.setFont("Poppins", "bold");
    doc.setTextColor(41, 40, 37)
    doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    doc.text(`UTILIDAD NETA`, 60, 55);
    doc.internal.events.subscribe('addPage', () => {
        doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    });
    doc.setTextColor(255, 75, 0)
    doc.setFontSize(16);
    doc.text(`${(data.temporality).toUpperCase()}`, 10, 85);
    doc.setTextColor(41, 40, 37)
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`FECHA DE IMPRESION: ${new Date().toLocaleDateString()}`, 140, 85);
    doc.setFontSize(10);
    doc.setTextColor(41, 40, 37)
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
    let diasMax = `UTILIDAD MAS ALTA:` + " " + data.max_labels + " con " + data.max.toFixed(2) + " $"
    let diasMin = `UTILIDAD MAS BAJA:` + " " + data.min_labels + " con " + data.min.toFixed(2) + " $"

    doc.addImage(imgData, 'PNG', 10, 100, 185, 100)
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 210, 2, 'F');
    doc.text(doc.splitTextToSize(diasMax, 180), 14, 211);
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 220, 2, 'F');
    doc.text(doc.splitTextToSize(diasMin, 180), 14, 221);
    doc.setFillColor(255, 178, 0);
    doc.circle(10, 230, 2, 'F');
    doc.text(`PROMEDIO DE UTILIDAD: ${(data.promedio).toFixed(2)} $`, 14, 231);

    let nota = `# NOTA: LOS VALORES POR ENCIMA DEL PROMEDIO, INDICAN UNA UTILIDAD NETA ESTABLE. LOS VALORES POR DEBAJO DEL PROMEDIO INDICAN UNA UTILIDAD NETA INESTABLE`
    doc.text(doc.splitTextToSize(nota, 190), 10, 250);
    window.open(doc.output('bloburl'), '_blank');
}
const pdfGraphic2Dashboard = (data) => {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    const imgData = data.canvas.toDataURL('image/png');
    doc.addFileToVFS("Poppins-Regular.ttf", Poppins_normal);
    doc.addFont("Poppins-Regular.ttf", "Poppins", "normal");
    doc.addFileToVFS("Poppins-Bold.ttf", poppins_bold);
    doc.addFont("Poppins-Bold.ttf", "Poppins", "bold");
    doc.setFont("Poppins", "normal");
    doc.setFontSize(33, 7);
    doc.setFont("Poppins", "bold");
    doc.setTextColor(41, 40, 37)
    doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    doc.text(`INGRESOS`, 60, 55);
    doc.internal.events.subscribe('addPage', () => {
        doc.addImage("./assets/img/reportes_banners/reporte_estadisticas.webp", 'WEBP', 0, 0, 210, 297);
    });
    doc.setTextColor(255, 75, 0)
    doc.setFontSize(16);
    doc.text(`${(data.temporality).toUpperCase()}`, 10, 85);
    doc.setTextColor(41, 40, 37)
    doc.setFont("Poppins", "normal");
    doc.setFontSize(10);
    doc.text(`FECHA DE IMPRESION: ${new Date().toLocaleDateString()}`, 140, 85);
    doc.setFontSize(10);
    doc.setTextColor(41, 40, 37)
    doc.text(`..................................................................................................................................................................................................................................................................`, 10, 90);
    let diasMax = `MAS INGRESOS:` + " " + data.max_labels + " con " + data.max.toFixed(2) + " $"
    let diasMin = `MENOS INGRESOS:` + " " + data.min_labels + " con " + data.min.toFixed(2) + " $"

    doc.addImage(imgData, 'PNG', 10, 100, 185, 100)
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 210, 2, 'F');
    doc.text(doc.splitTextToSize(diasMax, 180), 14, 211);
    doc.setFillColor(255, 75, 0);
    doc.circle(10, 220, 2, 'F');
    doc.text(doc.splitTextToSize(diasMin, 180), 14, 221);
    doc.setFillColor(255, 178, 0);
    doc.circle(10, 230, 2, 'F');
    doc.text(`PROMEDIO DE INGRESOS: ${(data.promedio).toFixed(2)} $`, 14, 231);

    let nota = `# NOTA: LOS VALORES POR ENCIMA DEL PROMEDIO, INDICAN UNOS INGRESOS ESTABLES. LOS VALORES POR DEBAJO DEL PROMEDIO INDICAN UNOS INGRESOS INESTABLES`
    doc.text(doc.splitTextToSize(nota, 190), 10, 250);
    window.open(doc.output('bloburl'), '_blank');
}