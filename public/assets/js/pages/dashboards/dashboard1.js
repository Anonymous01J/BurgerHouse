import graphicInstance from "../statistics/graphicInstance.js";
import functionGeneral from "../../Functions.js"
import { printPDF } from "../statistics/graphicPDF.js"
const { searchParam } = functionGeneral();
const { graphic2, graphicDashboard1, graphicDashboard2 } = graphicInstance()
Chart.register(ChartDataLabels);
graphic2(undefined, undefined, undefined, "totalVentaAnio", () => printPDF());
graphicDashboard1(undefined, undefined, undefined, "utilidadNetaAnio", () => printPDF());
graphicDashboard2(undefined, undefined, undefined, "utilidadNetaSemana", () => printPDF());
dayjs.extend(window.dayjs_plugin_relativeTime);
dayjs.locale('es');
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
            if (select.getAttribute("graphic") == 'Utilidad neta') graphicDashboard1(undefined, undefined, undefined, "utilidadNetaSemana", () => printPDF());
            else if (select.getAttribute("graphic") == "Total de ventas") graphic2(undefined, undefined, undefined, "totalVentaSemana", () => printPDF())
            else graphicDashboard2(undefined, undefined, undefined, "utilidadNetaSemana", () => printPDF());
        } else if (e.target.value == "Mes/Año") {
            for (const element of select.parentElement.parentElement.parentElement.parentElement.querySelectorAll("[type]")) {
                if (element.getAttribute("type") == "week") element.classList.add("d-none")
                else element.classList.remove("d-none")
            }
            select.parentElement.parentElement.firstElementChild.lastElementChild.textContent = formatearFecha(new Date(), "mes");
            if (select.getAttribute("graphic") == 'Utilidad neta') graphicDashboard1(undefined, undefined, undefined, "utilidadNetaMes", () => printPDF());
            else if (select.getAttribute("graphic") == "Total de ventas") graphic2(undefined, undefined, undefined, "totalVentaMes", () => printPDF())
            else graphicDashboard2(undefined, undefined, undefined, "utilidadNetaMes", () => printPDF());
        } else {
            for (const element of select.parentElement.parentElement.parentElement.parentElement.querySelectorAll("[type]")) {
                if (element.getAttribute("type") == "week" || element.getAttribute("type") == "month") element.classList.add("d-none")
                else element.classList.remove("d-none")
            }
            select.parentElement.parentElement.firstElementChild.lastElementChild.textContent = formatearFecha(new Date(), "año");
            if (select.getAttribute("graphic") == 'Utilidad neta') graphicDashboard1(undefined, undefined, undefined, "utilidadNetaAnio", () => printPDF());
            else if (select.getAttribute("graphic") == "Total de ventas") graphic2(undefined, undefined, undefined, "totalVentaAnio", () => printPDF())
            else graphicDashboard2(undefined, undefined, undefined, "utilidadNetaAnio", () => printPDF());
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
            if (type == 'Utilidad neta') graphicDashboard1(anio, semana, null, "utilidadNetaSemana", () => printPDF());
            else if (type == "Total de ventas") graphic2(anio, semana, null, "totalVentaSemana", () => printPDF())
            else graphicDashboard2(anio, semana, null, "utilidadNetaSemana", () => printPDF());
            form.parentElement.parentElement.parentElement.querySelector(".type_flter_date").textContent = formatearFecha(semanaISOaFecha(form.querySelector("input[type='week']").value), "semana");
        } else if (selectOption == "Mes/Año") {
            let mes = form.querySelector("select").value
            let anio = form.querySelector("input[type='year']").value;
            if (mes == "s/v") mes = new Date().getMonth() + 1;
            if (type == 'Utilidad neta') graphicDashboard1(anio, null, mes, "utilidadNetaMes", () => printPDF());
            else if (type == "Total de ventas") graphic2(anio, null, mes, "totalVentaMes", () => printPDF())
            else graphicDashboard2(anio, null, mes, "utilidadNetaMes", () => printPDF());
            form.parentElement.parentElement.parentElement.querySelector(".type_flter_date").textContent = formatearFecha(new Date(anio, mes - 1), "mes");
        } else {
            let anio = form.querySelector("input[type='year']").value;
            if (anio == "s/v") anio = new Date().getFullYear();
            if (type == 'Utilidad neta') graphicDashboard1(anio, null, null, "utilidadNetaAnio", () => printPDF());
            else if (type == "Total de ventas") graphic2(anio, null, null, "totalVentaAnio", () => printPDF())
            else graphicDashboard2(anio, null, mes, "utilidadNetaAnio", () => printPDF());
            form.parentElement.parentElement.parentElement.querySelector(".type_flter_date").textContent = formatearFecha(new Date(anio), "año");
        }
    })
})
const activity = async () => {
    let pet = await searchParam({}, "binnacle", 5)
    let template = ""
    let icon = ""
    let title = ""
    let color = ['bh_1', 'bh_2', 'bh_4', 'bh_5', 'bh_6'];
    pet.forEach((item, index) => {
        if (item.descripcion.includes("Se agrego ") || item.descripcion.includes("Se creo ")) icon = "plus"
        else if (item.descripcion.includes("Se elimino ")) icon = "trash"
        else if (item.descripcion.includes("Se actualizo ")) icon = "edit"
        else if (item.descripcion.includes("Se ha restaurado ")) icon = "refresh-cw"
        else if (item.descripcion.includes("Se abrio ")) icon = "book-open"
        else if (item.descripcion.includes("Se ha cerrado ")) icon = "x"
        else if (item.descripcion.includes("Se preparo ")) icon = "coffee"
        else if (item.descripcion.includes("Se verifico ")) icon = "check"
        else if (item.descripcion.includes("Se anulo ")) icon = "x-circle"
        else if (item.descripcion.includes("Se acepto ")) icon = "check-circle"
        else if (item.descripcion.includes("inicio de sesion")) icon = "log-in"
        else if (item.descripcion.includes("Se ha agregado")) icon = "plus-circle"
        else if (item.descripcion.includes("Guardar Gasto") || item.descripcion.includes("Guardar Ingreso")) icon = "dollar-sign"

        if (item.descripcion.includes("Se agrego ") || item.descripcion.includes("Se creo ")) title = "Nuevo elemento agregado"
        else if (item.descripcion.includes("Se elimino ")) title = "Elemento eliminado"
        else if (item.descripcion.includes("Se actualizo ")) title = "Elemento actualizado"
        else if (item.descripcion.includes("Se ha restaurado ")) title = "Elemento restaurado"
        else if (item.descripcion.includes("Se abrio ")) title = "Elemento abierto"
        else if (item.descripcion.includes("Se ha cerrado ")) title = "Elemento cerrado"
        else if (item.descripcion.includes("Se preparo ")) title = "Elemento preparado"
        else if (item.descripcion.includes("Se verifico ")) title = "Elemento verificado"
        else if (item.descripcion.includes("Se anulo ")) title = "Elemento anulado"
        else if (item.descripcion.includes("Se acepto ")) title = "Elemento aceptado"
        else if (item.descripcion.includes("inicio de sesion")) title = "Inicio de sesion"
        else if (item.descripcion.includes("Se ha agregado")) title = "Nuevo elemento agregado"
        else if (item.descripcion.includes("Guardar Gasto") || item.descripcion.includes("Guardar Ingreso")) title = "Nuevo movimiento de dinero"


        template += `
        <div class="d-flex align-items-start border-left-line pb-3">
            <div>
                <a href="javascript:void(0)" class="btn ${color[index]} btn-circle mb-2 btn-item text-white">
                    <i data-feather="${icon}"></i>
                </a>
            </div>
            <div class="ms-3 mt-2">
                <h5 class="text-dark font-weight-medium mb-2">${title}!</h5>
                <p class="font-14 mb-2 text-muted">
                    ${item.nombre_usuario + " " + item.descripcion}
                </p>
                <span class="font-weight-light font-14 text-muted">${dayjs(item.fecha).fromNow()}</span>
            </div>
        </div>
        `
    })
    document.querySelector(".activity").innerHTML = template;
    feather.replace();
}
const targetItem = async () => {
    let data = new FormData();
    data.append("anio", new Date().getFullYear());
    data.append("mes", new Date().getMonth() + 1);
    let numeroClientes = await searchParam({ active: 1 }, "clients", 1000000000);
    let tablesAvaliable = await searchParam({ active: 1, estado: "LIBRE" }, "table", 1000000000);
    let orders = await searchParam({ status: 4 }, "order", 1000000000);
    let ganancias = await fetch("statistics/UtilidadNetaMes", { method: "POST", body: data });
    let res = await ganancias.json();
    let gananciasMes = res.reduce((acc, item) => acc + (item.ingresos || 0), 0);

    document.querySelector(".nro_clientes").textContent = numeroClientes.length;
    document.querySelector(".ganancias").innerHTML = `<sup class="set-doller">$</sup>${gananciasMes.toFixed(2)}`;
    document.querySelector(".order_completed").textContent = orders.length;
    document.querySelector(".table_available").textContent = tablesAvaliable.length;
}
let clients = $(".table_clients").DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    ajax: {
        url: 'home/ClientesFrecuentes',
        dataSrc: function (json) {
            let group = {}
            Object.keys(json).forEach(key => {
                let clienteKey = `${json[key].cliente}|${json[key].apellido}|${json[key].telefono}`;
                if (!group[clienteKey]) {
                    group[clienteKey] = {
                        cliente: `${json[key].cliente} ${json[key].apellido}`,
                        telefono: json[key].telefono,
                        ultima_orden: json[key].ultima_orden,
                        total_gastado: json[key].total_gastado,
                        productos: []
                    };
                }
                const productos = [
                    { nombre: json[key].producto_1, imagen: json[key].imagen_1 },
                    { nombre: json[key].producto_2, imagen: json[key].imagen_2 },
                    { nombre: json[key].producto_3, imagen: json[key].imagen_3 }
                ];
                group[clienteKey].productos.push(...productos);
            })
            group = Object.values(group).map(item => {
                let productosUnicos = [];
                item.productos.forEach(prod => {
                    if (prod.nombre && prod.nombre !== "Sin producto" && !productosUnicos.some(p => p.nombre === prod.nombre)) {
                        productosUnicos.push(prod);
                    }
                });
                return { ...item, productos: productosUnicos };
            });
            return group
        },
        type: 'POST',
    },
    columns: [
        {
            data: false, render: function (data, type, row) {
                return `
            <div class="d-flex no-block align-items-center">
                <div class="me-3">
                    <img
                        src="./assets/img/users/1.jpg"
                        alt="user" class="rounded-circle" width="45"
                        height="45" />
                </div>
                <div class="">
                    <h5 class="text-dark mb-0 font-16 font-weight-medium">${row.cliente.toUpperCase()}</h5>
                    <span class="text-muted font-14">${row.telefono ? row.telefono : "S/T"}</span>
                </div>
            </div>
            `
            }
        },
        {
            data: false, render: function (data, type, row) {
                let productosHTML = row.productos.map(prod => {
                    return `<img ${prod.imagen ? `src="media/productPrepared/${prod.imagen}"` : `src="./assets/img/big/banner_login.png"`} alt="${prod.nombre}" class="rounded-circle" width="60" height="60" data-bs-toggle="tooltip" data-bs-placement="top" title="${prod.nombre}">`;
                }).join('');
                return `<div class="d-flex align-items-center gap-2">${productosHTML}</div>`;
            }
        },
        { data: false, render: function (data, type, row) { return dayjs(row.ultima_orden).fromNow() } },
        { data: false, render: function (data, type, row) { return row.total_gastado ? `<span class="font-weight-medium text-dark">$${row.total_gastado.toFixed(2)}</span>` : "<span class='text-muted'>S/T</span>" } },
    ],
    "dom": 'tipr',
    "paging": true,
    "info": true,
})
$('#searchClientFrequent').on('keyup', function () { clients.search(this.value).draw() });

activity()
targetItem();