let check_all = document.querySelector(".check-all")
let form_check_input = document.querySelectorAll(".form-check-input")

check_all.addEventListener("change", () => {
    if (check_all.checked) {
        form_check_input.forEach(input => {
            input.checked = true
        })
    } else {
        form_check_input.forEach(input => {
            input.checked = false
        })
    }
})

let algo = document.querySelectorAll("[data-module='Combo']")
algo.forEach(d => {
    d.addEventListener("change", () => {
        let action = d.getAttribute("data-action")
        if (action != "search" && d.checked == true) {
            d.parentElement.parentElement.parentElement.querySelector("[data-action='search']").checked = true
        }
    })
})