let btn_login_1 = document.querySelector('.btn_login_1')
let btn_regresar = document.querySelector('.btn_regresar')

btn_login_1.addEventListener('click', () => {
    let containerLogin = btn_login_1.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement
    containerLogin.classList.toggle("hide")
    setTimeout(() => {
        btn_regresar.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.classList.toggle("hide2")
    }, 500)
})

btn_regresar.addEventListener('click', () => {
    btn_regresar.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.classList.toggle("hide2")
    setTimeout(() => {
        btn_login_1.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.classList.toggle("hide")
    }, 500)
})