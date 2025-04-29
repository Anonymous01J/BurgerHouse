import functionGeneral from "../../Functions.js";
const { setValidationStyles, validateField, add } = functionGeneral();
//funcion para el check all
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
//funcion para el check en caso de escojer una opcion q no sea consultar
let verify = document.querySelectorAll("[data-module]")
verify.forEach(d => {
    d.addEventListener("change", () => {
        let action = d.getAttribute("data-action")
        let cheked = d.closest('tr').querySelectorAll('[data-action]:not([data-action="consultar"]):checked').length
        if (action != "consultar" && d.checked == true) d.closest('tr').querySelector("[data-action='consultar']").checked = true
        if (action == "consultar" && d.checked == false && cheked > 0) d.closest('tr').querySelector("[data-action='consultar']").checked = true
    })
})
async function cargarPermisos() {
    let pet = await fetch("./assets/js/permission_example.json")
    let response = await pet.json()
    response.forEach(element => {
        let check = document.querySelectorAll(`[data-module='${element.modulo}']`)
        for (const data of check) {
            if (element.permisos.includes(data.getAttribute("data-action"))) data.checked = true
        }
    })
}
//-----------------------------------------------------------------------------
validate.validators.nombreValidator = function (value, options, key, attributes) {
    if (!value) return;
    if (!/^[A-Z]/.test(value)) {
        return options.uppercaseMessage;
    }
    if (!/^[A-Za-z0-9\s]*$/.test(value)) {
        return options.specialCharMessage;
    }
};
const rules = {
    nombre: {
        nombreValidator: {
            uppercaseMessage: "^debe tener la primera letra en mayúscula.",
            specialCharMessage: "^No se permiten signos como puntos (.) o comas (,)."
        },
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        length: {
            minimum: 4,
            message: "^debe tener al menos 4 caracteres"
        },
    },

    descripcion: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        length: {
            minimum: 15,
            message: "^debe tener al menos 15 caracteres"
        }
    },
};
document.querySelectorAll("input[type='text'], textarea").forEach(input => {
    input.addEventListener("keyup", (e) => validateField(e, rules));
    input.addEventListener("blur", (e) => validateField(e, rules));
})

let form = document.getElementById("form-submit-permissions")
let datapermissions = [{ detalles: {}, permisos: [] }]
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", (e) => {
        e.preventDefault()
        let data = {
            nombre: document.getElementById("input-name-permission").value,
            descripcion: document.getElementById("input-description-permission").value,
        }
        const errors = validate(data, rules);
        setValidationStyles("input-name-permission", errors?.nombre ? errors.nombre[0] : null);
        setValidationStyles("input-description-permission", errors?.descripcion ? errors.descripcion[0] : null);
        if (!errors) {
            let inputs = document.querySelectorAll(".form-check-input")
            let validate = 0
            inputs.forEach(input => {
                if (input.checked) validate++
            })
            if (validate == 0) {
                const tooltip = new bootstrap.Tooltip(document.querySelector("button[type='submit']"), {
                    title: "Debe seleccionar al menos un permiso",
                    placement: "right",
                    trigger: "manual"
                });
                tooltip.show();
                setTimeout(() => tooltip.hide(), 1000);
            } else {
                datapermissions[0].detalles = data
                const permisosAgrupados = {};
                document.querySelectorAll('.table_permissions input[type="checkbox"]:checked').forEach(input => {
                    let module = input.getAttribute("data-module")
                    let action = input.getAttribute("data-action")
                    if (!permisosAgrupados[module]) {
                        permisosAgrupados[module] = [];
                    }
                    permisosAgrupados[module].push(action);
                })
                datapermissions[0].permisos = Object.entries(permisosAgrupados).map(([modulo, acciones]) => (
                    {
                        modulo: modulo,
                        permisos: acciones.join(',')
                    }
                ));
                //$data = json_decode(file_get_contents("php://input"), true)
                console.log(datapermissions);
                // let dat = new FormData()
                // dat.append("lista", JSON.stringify(datapermissions))
                // async function send() {
                //     let pet = await fetch("permissions/add_many", {
                //         method: "POST",
                //         body: dat
                //     })
                //     let response = await pet.json()
                //     console.log(response);
                // }
                // send()
                form.reset()
                document.querySelectorAll("input[type='text'], textarea").forEach(input => {
                    input.classList.remove("is-valid", "is-invalid");
                })
                datapermissions = [{ detalles: {}, permisos: {} }]
            }
        }
    })
    form.dataset.listenerAttached = "true";
}