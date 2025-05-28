import functionGeneral from "./Functions.js";
const { permission, searchParam, fecha, CheckCash } = functionGeneral()
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
if (await CheckCash() != null) {
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

//permisos para el navbar
// permission("Combo")
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