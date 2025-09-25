import functionGeneral from "./Functions.js";
const { permission, searchParam, fecha, CheckCash, sessionInfo } = functionGeneral()
let title = document.getElementById('titlePage');
let url = window.location.href;
let urlArray = url.split('/');
title.textContent = "Burger House | " + urlArray[4].toLocaleUpperCase();

document.addEventListener('DOMContentLoaded', async () => {
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
