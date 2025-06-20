import graphicInstance from "./graphicInstance.js";
import { printPDF } from "./graphicPDF.js"
const { instance, graphic1, graphic2, graphic5, graphic6 } = graphicInstance()
Chart.register(ChartDataLabels);
instance()
function formatearFecha(fecha, modo = "semana") {
    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    const getNumeroSemana = (fecha) => {
        const inicioAño = new Date(fecha.getFullYear(), 0, 1);
        const diasTranscurridos = Math.floor((fecha - inicioAño) / (24 * 60 * 60 * 1000));
        const numeroSemana = Math.ceil((diasTranscurridos + inicioAño.getDay() + 1) / 7);
        return numeroSemana;
    };
    const mesNombre = meses[fecha.getMonth()];
    const año = fecha.getFullYear();
    switch (modo.toLowerCase()) {
        case "semana":
            const semana = getNumeroSemana(fecha);
            return `Semana ${semana} de ${mesNombre} del ${año}`;
        case "mes":
            return `${mesNombre} del ${año}`;
        case "ano":
        case "año":
            return `Año ${año}`;
        default:
            return "Modo no válido";
    }
}
function semanaISOaFecha(isoSemana) {
    const [año, semanaStr] = isoSemana.split("-W");
    const semana = parseInt(semanaStr, 10);
    const fecha = new Date(año, 0, 4);
    const diaSemana = fecha.getDay() || 7;
    fecha.setDate(fecha.getDate() - diaSemana + 1 + (semana - 1) * 7);
    return fecha;
}
document.querySelectorAll(".form_select_type_filter").forEach((select) => {
    select.addEventListener("change", (e) => {
        if (e.target.value == "Semana/mes/año") {
            for (const element of select.parentElement.parentElement.parentElement.parentElement.querySelectorAll("[type]")) {
                if (element.getAttribute("type") == "month" || element.getAttribute("type") == "year") element.classList.add("d-none")
                else element.classList.remove("d-none")
            };
            select.parentElement.parentElement.firstElementChild.lastElementChild.textContent = formatearFecha(new Date(), "semana");
            if (select.getAttribute("graphic") == 'Gasto Promedio') graphic1(undefined, undefined, undefined, "GastoClienteSemana", () => printPDF());
            else if (select.getAttribute("graphic") == "productos mas vendidos") graphic5(undefined, undefined, undefined, "productosMasVendidoSemana", () => printPDF())
            else if (select.getAttribute("graphic") == "Total de ventas") graphic2(undefined, undefined, undefined, "totalVentaSemana", () => printPDF())
            else if (select.getAttribute("graphic") == "productos menos vendidos") graphic6(undefined, undefined, undefined, "productosMenosVendidosSemana", () => printPDF())
        } else if (e.target.value == "Mes/Año") {
            for (const element of select.parentElement.parentElement.parentElement.parentElement.querySelectorAll("[type]")) {
                if (element.getAttribute("type") == "week") element.classList.add("d-none")
                else element.classList.remove("d-none")
            }
            select.parentElement.parentElement.firstElementChild.lastElementChild.textContent = formatearFecha(new Date(), "mes");
            if (select.getAttribute("graphic") == 'Gasto Promedio') graphic1(undefined, undefined, undefined, "gastoClienteMes", () => printPDF());
            else if (select.getAttribute("graphic") == "productos mas vendidos") graphic5(undefined, undefined, undefined, "productosVendidosMes", () => printPDF())
            else if (select.getAttribute("graphic") == "Total de ventas") graphic2(undefined, undefined, undefined, "totalVentaMes", () => printPDF())
            else if (select.getAttribute("graphic") == "productos menos vendidos") graphic6(undefined, undefined, undefined, "productosMenosVendidosMes", () => printPDF())

        } else {
            for (const element of select.parentElement.parentElement.parentElement.parentElement.querySelectorAll("[type]")) {
                if (element.getAttribute("type") == "week" || element.getAttribute("type") == "month") element.classList.add("d-none")
                else element.classList.remove("d-none")
            }
            select.parentElement.parentElement.firstElementChild.lastElementChild.textContent = formatearFecha(new Date(), "año");
            if (select.getAttribute("graphic") == 'Gasto Promedio') graphic1(undefined, undefined, undefined, "gastoClienteAnual", () => printPDF());
            else if (select.getAttribute("graphic") == "productos mas vendidos") graphic5(undefined, undefined, undefined, "productosVendidosAnual", () => printPDF())
            else if (select.getAttribute("graphic") == "Total de ventas") graphic2(undefined, undefined, undefined, "totalVentaAnio", () => printPDF())
            else if (select.getAttribute("graphic") == "productos menos vendidos") graphic6(undefined, undefined, undefined, "productosMenosVendidosAnual", () => printPDF())
        }
    })
})
document.querySelectorAll(".type_flter_date").forEach((date) => {
    if (date.getAttribute("type_temporality") == "week") date.textContent = formatearFecha(new Date(), "semana");
    else if (date.getAttribute("type_temporality") == "month") date.textContent = formatearFecha(new Date(), "mes");
    else date.textContent = formatearFecha(new Date(), "año");
})
document.querySelectorAll(".container_inputs_filter").forEach(form => {
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        let type = form.getAttribute("graphic")
        let selectOption = form.parentElement.parentElement.querySelector(".form_select_type_filter").value
        if (selectOption == "Semana/mes/año") {
            let anio = form.querySelector("input[type='week']").value.split("-")[0];
            let semana = form.querySelector("input[type='week']").value.split("-")[1].replace("W", "");
            if (type == "Gasto Promedio") graphic1(anio, semana, null, "GastoClienteSemana", () => printPDF());
            else if (type == "productos mas vendidos") graphic5(anio, semana, null, "productosMasVendidoSemana", () => printPDF())
            else if (type == "Total de ventas") graphic2(anio, semana, null, "totalVentaSemana", () => printPDF())
            else if (type == "productos menos vendidos") graphic6(anio, semana, null, "productosMenosVendidosSemana", () => printPDF())
            form.parentElement.parentElement.parentElement.querySelector(".type_flter_date").textContent = formatearFecha(semanaISOaFecha(form.querySelector("input[type='week']").value), "semana");
        } else if (selectOption == "Mes/Año") {
            let mes = form.querySelector("select").value
            let anio = form.querySelector("input[type='year']").value;
            console.log(mes, anio);
            if (mes == "s/v") mes = new Date().getMonth() + 1;
            if (type == "Gasto Promedio") graphic1(anio, null, mes, "gastoClienteMes", () => printPDF())
            else if (type == "productos mas vendidos") graphic5(anio, null, mes, "productosVendidosMes", () => printPDF())
            else if (type == "Total de ventas") graphic2(anio, null, mes, "totalVentaMes", () => printPDF())
            else if (type == "productos menos vendidos") graphic6(anio, null, mes, "productosMenosVendidosMes", () => printPDF())
        
            form.parentElement.parentElement.parentElement.querySelector(".type_flter_date").textContent = formatearFecha(new Date(anio, mes - 1), "mes");
        } else {
            let anio = form.querySelector("input[type='year']").value;
            if (anio == "s/v") anio = new Date().getFullYear();
            if (type == "Gasto Promedio") graphic1(anio, null, null, "gastoClienteAnual", () => printPDF())
            else if (type == "productos mas vendidos") graphic5(anio, null, null, "productosVendidosAnual", () => printPDF())
            else if (type == "Total de ventas") graphic2(anio, null, null, "totalVentaAnio", () => printPDF())
            else if (type == "productos menos vendidos") graphic6(anio, null, null, "productosMenosVendidosAnual", () => printPDF())

            form.parentElement.parentElement.parentElement.querySelector(".type_flter_date").textContent = formatearFecha(new Date(anio), "año");
        }
    })
})