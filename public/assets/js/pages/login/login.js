import functionGeneral from "../../Functions.js";
const { validateField, setValidationStyles, sessionInfo, binnacle } = functionGeneral()

document.querySelectorAll("#login_form #login-correo, #login_form #login-password").forEach((input) => {
  input.addEventListener("keyup", (e) => validateField(e, rules))
  input.addEventListener("blur", (e) => validateField(e, rules))
})
$(".preloader ").fadeOut();
let login_form = document.getElementById("login_form")

const rules = {
  email: {
    presence: {
      allowEmpty: false,
      message: "^es requerido"
    }
  },
  password: {
    presence: {
      allowEmpty: false,
      message: "^es requerido"
    }
  },
}

login_form.addEventListener("submit", async (e) => {
  e.preventDefault()
  let dataform = {
    email: document.getElementById("login-correo").value,
    password: document.getElementById("login-password").value,
  }
  const error = validate(dataform, rules);
  setValidationStyles("login-correo", error?.email ? error.email[0] : null);
  setValidationStyles("login-password", error?.password ? error.password[0] : null);
  if (!error) {
    let data = new FormData()
    data.append("email", document.getElementById("login-correo").value)
    data.append("password", document.getElementById("login-password").value)
    data.append("token", document.querySelector('.cf-turnstile input[name="cf-turnstile-response"]').value)
    if (document.querySelector('.cf-turnstile input[name="cf-turnstile-response"]').value != "") {
      let validate = await fetch("login/login", { method: "POST", body: data })
      let result = await validate.json()
      if (result.success == true) {
        let session = await sessionInfo()
        binnacle(session.message.id, "Usuarios", "Login", "inicio de sesion")
        window.location = "home"
      } else {
        const Toast = Swal.mixin({
          toast: true,
          position: "bottom-end",
          showConfirmButton: false,
          timer: 3000,
          timerProgressBar: true,
          didOpen: (toast) => {
            toast.onmouseenter = Swal.stopTimer;
            toast.onmouseleave = Swal.resumeTimer;
          }
        });
        Toast.fire({
          icon: "error",
          title: `${result.message}`
        });
      }
    }
  }
})