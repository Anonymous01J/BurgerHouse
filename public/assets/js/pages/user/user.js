import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { SelectOption, setValidationStyles, validateField, searchSingle, searchAll, print, add, reindex, resetForm } = functionGeneral();
const { elemenFormUser } = Templates()

let data = await searchSingle()
let data2 = []
data.forEach(element => {data2.push({id: element.id, nombre: element.rol})})
SelectOption(".select_options_td")
SelectOption(".select_options_rol", data2)

let UsersCount = 1;
function addUsers() {
    UsersCount++;
    document.getElementById("users-container").insertAdjacentHTML('beforeend', elemenFormUser(UsersCount));
    feather.replace();
    SelectOption()
    attachValidationListeners(UsersCount);
    const newUser = document.getElementById(`user-${UsersCount}`);
    newUser.querySelector(".remove-user").addEventListener("click", function () {
        newUser.remove();
        reindex("#users-container .users", "user", UsersCount, "Usuario");
    });
}
function attachValidationListeners(index) {
    const productElement = document.getElementById(`user-${index}`);
    productElement.querySelectorAll("input[type='text'], input[type='button'], input[type='password']").forEach(input => {
        input.addEventListener("keyup", (e) => validateField(e, rules));
        input.addEventListener("blur", (e) => validateField(e, rules));
    });
}
document.getElementById("add-user-btn").addEventListener("click", () => {
    addUsers()
    reindex("#users-container .users", "user", UsersCount, "Usuario");
});
validate.validators.validateTD = function (value, options, key, attributes) {
    if (!value) {
        return options.message || "es requerido";
    }
    if (value.toLowerCase() === "seleccione una opcion") {
        return options.message || "es requerido";
    }
};
validate.validators.nombreValidator = function (value, options, key, attributes) {
    if (!value) return;
    if (!/^[A-Z]/.test(value)) {
        return options.uppercaseMessage;
    }
    if (!/^[A-Za-z0-9\s]*$/.test(value)) {
        return options.specialCharMessage;
    }
};
validate.validators.email = function (value, options, key, attributes) {
    if (!value) return;
    if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(value)) {
        return options.validateEmail
    }
}
validate.validators.password = function (value, options, key, attributes) {
    if (!value) return;
    if (!/(?=.*\d)/.test(value)) {
        return options.onceDigit
    }
    if (!/(?=.*[a-z])/.test(value)) {
        return options.onceLower
    }
    if (!/(?=.*[^a-zA-Z0-9])/.test(value)) {
        return options.onceSpecial
    }
    if (/\s/.test(value)) {
        return options.noSpace
    }
    if (value.length < 8 || value.length > 15) {
        return options.length
    }
}
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
            minimum: 2,
            message: "^debe tener al menos 2 caracteres"
        },
    },
    apellido: {
        nombreValidator: {
            uppercaseMessage: "^debe tener la primera letra en mayúscula.",
            specialCharMessage: "^No se permiten signos como puntos (.) o comas (,)."
        },
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        length: {
            minimum: 2,
            message: "^debe tener al menos 2 caracteres"
        },
    },
    rif: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        format: {
            pattern: "^[0-9]+$",
            message: "^solo puede tener numeros"
        }
    },
    tipo_documento: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateTD: { message: "^es requerido" }
    },
    id_rol: {
        presence: {
            allowEmpty: false,
            message: "^es requerida"
        },
        validateTD: { message: "^es requerido" }
    },
    hash: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        password: {
            onceDigit: "^Al menos un dígito.",
            onceLower: "^Al menos una letra minúscula.",
            onceSpecial: "^Al menos un carácter especial.",
            noSpace: "^Sin espacios en blanco.",
            length: "^Longitud entre 8 y 15 caracteres."
        }
    },
    email: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        email: { validateEmail: "^El correo electrónico no es válido" }
    }
};
let form = document.getElementById("form-submit-users")
if (!form.dataset.listenerAttached) {
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        const users = document.querySelectorAll(".users");
        let formHasError = false;
        let dataUsers = []

        users.forEach((user, i) => {
            const index = i + 1;
            const data = {
                nombre: user.querySelector(`input[name="nombre"]`).value,
                apellido: user.querySelector(`input[name="apellido"]`).value,
                tipo_documento: user.querySelector(`input[name="tipo_documento"]`) ? user.querySelector(`input[name="tipo_documento"]`).value : "",
                rif: user.querySelector(`input[name="rif"]`).value,
                email: user.querySelector(`input[name="email"]`).value,
                id_rol: user.querySelector(`input[name="id_rol"]`).getAttribute("data-id"),
                hash: user.querySelector(`input[name="hash"]`).value
            }
            dataUsers.push(data)
            const errors = validate(data, rules);
            setValidationStyles(`input-name-user-${index}`, errors?.nombre ? errors.nombre[0] : null);
            setValidationStyles(`input-lastname-user-${index}`, errors?.apellido ? errors.apellido[0] : null);
            setValidationStyles(`input-td-user-${index}`, errors?.tipo_documento ? errors.tipo_documento[0] : null);
            setValidationStyles(`input-rif-user-${index}`, errors?.rif ? errors.rif[0] : null);
            setValidationStyles(`input-email-user-${index}`, errors?.email ? errors.email[0] : null);
            setValidationStyles(`input-password-user-${index}`, errors?.hash ? errors.hash[0] : null);
            setValidationStyles(`input-rol-user-${index}`, errors?.id_rol ? errors.id_rol[0] : null);
            if (errors) {
                formHasError = true;
            }
        })

        if (!formHasError) {
            let dataFinal = []
            dataUsers.forEach((user) => {
                dataFinal.push({
                    nombre: user.nombre,
                    apellido: user.apellido,
                    documento: user.tipo_documento + user.rif,
                    email: user.email,
                    id_rol: user.id_rol,
                    hash: user.hash
                })
            })
            resetForm("#users-container .users", form)
        }
    })
    form.dataset.listenerAttached = "true";
}
attachValidationListeners(1)