import functionGeneral from "./Functions.js";
const { permission, searchParam, fecha } = functionGeneral()

let title = document.getElementById('titlePage');
let url = window.location.href;
let urlArray = url.split('/');
title.textContent = "Burger House | " + urlArray[4].toLocaleUpperCase();


document.addEventListener('DOMContentLoaded', () => {
    const savedTheme = localStorage.getItem('darkMode');
    const check = localStorage.getItem('check');
    const isDark = savedTheme === 'true';
    document.body.classList.toggle('dark-mode', isDark);
    if (check == "true") {
        document.getElementById("themeToggle").removeAttribute("checked")
        document.querySelector(".img-bcv").src = "./assets/img/bcv2.png"
    }
});

document.getElementById("themeToggle").addEventListener("click", () => {
    const isDark = document.body.classList.toggle('dark-mode');
    localStorage.setItem('darkMode', isDark);
    localStorage.setItem('check', isDark);
    if (localStorage.getItem("check") == "true") {
        console.log("object");
        document.querySelector(".img-bcv").src = "./assets/img/bcv2.png"
    } else {
        document.querySelector(".img-bcv").src = "./assets/img/bcv.png"
    }
});
const dolarBCV = async () => {
    let search = await fetch("https://ve.dolarapi.com/v1/dolares")
    let response = await search.json()
    document.getElementById("Dolar_bcv").textContent = parseFloat(response[0].promedio).toFixed(2) + " Bs"
}
dolarBCV()

document.querySelectorAll(".logout_btn").forEach((btn) => {
    btn.addEventListener("click", async () => {
        let pet = await fetch("login/logout")
        window.location = "login"
    })
})

//caja
let caja = await searchParam({}, "cash")
if (caja.length > 0) {
    if ((fecha(caja[0].fecha_apertura) == fecha(new Date())) && caja[0].estado == 1) {
        document.querySelector(".cash_status").classList.add("bg-success")
        document.querySelector(".cash_status").classList.remove("bg-danger")
        const tooltip = bootstrap.Tooltip.getInstance(document.querySelector(".cash_status"));
        if (tooltip) {
            tooltip._config.title = "Estado de caja: Abierta";
            tooltip.update();
        }
    } else {
        document.querySelector(".cash_status").classList.remove("bg-success")
        document.querySelector(".cash_status").classList.add("bg-danger")
        const tooltip = bootstrap.Tooltip.getInstance(document.querySelector(".cash_status"));
        if (tooltip) {
            tooltip._config.title = "Estado de caja: Cerrada";
            tooltip.update();
        }
    }
}

//permisos para el navbar
// permission("Combo")
let pro = {
    id_cliente: 1,
    tipo: "delivery",
    lista_detalle_preparado: [
        {
            id_producto: 1,
            cantidad: 1,
            descripcion: "Sin cebolla",
            adicionales: "Tocineta",
        }
    ],
    lista_detalle_procesado: [
        {
            id_producto: 1,
            cantidad: 1,
        }
    ],
}
const prueba = async () => {
    let data = new FormData();
    data.append("id_caja", 2);
    data.append("id_orden", 10);
    data.append("IVA", 10.4);
    data.append("monto_final", 41);
    data.append("direccion", "Tocoron");
    let pet = await fetch("Sale/add", { method: "POST", body: data })
    let res = await pet.json()
    console.log(res);
}
// prueba()
const ho = async () => {
    let data = new FormData();
    data.append("id_cliente", 1);
    data.append("tipo", "delivery");
    data.append("lista_detalle_preparado[0][id_producto]", 41);
    data.append("lista_detalle_preparado[0][cantidad]", 1);
    data.append("lista_detalle_preparado[0][descripcion]", "Sin cebolla");
    data.append("lista_detalle_preparado[0][adicionales]", "Tocineta");
    data.append("lista_detalle_procesado[0][id_producto]", 41);
    data.append("lista_detalle_procesado[0][cantidad]", 1);
    let pet = await fetch("order/add", { method: "POST", body: data })
    let res = await pet.json()
    console.log(res);
}

//  ho()
let uno = [
    {
        id_rawmaterial: 1,
        cantidad: 1
    },
    {
        id_rawmaterial: 2,
        cantidad: 3
    }
]
let dos = [
    {
        id_rawmaterial: 2,
        cantidad: 3
    }
]

const sonIguales = (a, b) => a.id_rawmaterial === b.id_rawmaterial && a.cantidad === b.cantidad;

const unicosEnUno = uno.filter(obj1 => !dos.some(obj2 => sonIguales(obj1, obj2)));

const unicosEnDos = dos.filter(obj2 => !uno.some(obj1 => sonIguales(obj1, obj2)));

// console.log("Únicos en uno:", unicosEnUno);
// console.log("Únicos en dos:", unicosEnDos);


let cedula = async () => {
    let data = new FormData();
    data.append("cedula", "115435543");
    let pet = await fetch(`login/cedula`, { method: "POST", body: data })
    let res = await pet.json()
    console.log(res);
}
// cedula()