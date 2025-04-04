let login_form = document.getElementById("login_form")

login_form.addEventListener("submit", async (e)=>{
    e.preventDefault()

    
    let data = new FormData()

    data.append("nombre", document.getElementById("login_correo").value)
    data.append("password", document.getElementById("login_password").value)
    data.append("token", document.querySelector('.cf-turnstile input[name="cf-turnstile-response"]').value)

   let validate = await fetch("login/login", {
        method: "POST",
        headers: {
          "X-Requested-With": "XMLHttpRequest"
        },
        body: data
      })

      let result = await validate.json()
      console.log(result);
})