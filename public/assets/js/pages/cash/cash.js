import funtionGeneral from "../../Functions.js";
import Templates from "../../templates.js";
const { targetCash } = Templates()
const { validateField, setValidationStyles, sessionInfo, binnacle, print, add, searchParam, InputPrice, resetForm, CheckCash } = funtionGeneral()
InputPrice("[input_price]")
let session = await sessionInfo()
let cash = await CheckCash()
let form = document.getElementById("form-submit-cash")
validate.validators.precio = function (value, options, key, attributes) {
    if (!value) return;
    const cleanValue = value.replace(/\./g, '').replace(',', '.');
    const numberValue = parseFloat(cleanValue);

    if (isNaN(numberValue)) {
        return options.message || "no es un número válido";
    }
    if (numberValue <= 0) {
        return options.message || "debe ser un número mayor a 0";
    }
};
const rules = {
    precio_bs: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        precio: { message: "^debe ser un número mayor a 0" }
    },
    precio_usd: {
        presence: {
            allowEmpty: false,
            message: "^es requerido"
        },
        precio: { message: "^debe ser un número mayor a 0" }
    },
};

print(() => searchParam({ estado: 1 }, "cash"),
    targetCash,
    ".cont-cash_open",
    "cash"
)
print(() => searchParam({ estado: 0 }, "cash"),
    targetCash,
    ".cont-cash_close",
    "cash"
)
form.querySelectorAll("input").forEach((input) => {
    input.addEventListener("keyup", (e) => validateField(e, rules));
    input.addEventListener("blur", (e) => validateField(e, rules));
    input.addEventListener("change", (e) => validateField(e, rules));
});

form.addEventListener("submit", (e) => {
    e.preventDefault();
    let data = {
        precio_bs: document.getElementById("input-price-bs-cash").value,
        precio_usd: document.getElementById("input-price-usd-cash").value,
    }
    const error = validate(data, rules);
    setValidationStyles("input-price-bs-cash", error?.precio_bs ? error.precio_bs[0] : null);
    setValidationStyles("input-price-usd-cash", error?.precio_usd ? error.precio_usd[0] : null);

    if (!error) {
        let data = new FormData()
        data.append("lista[0][monto_inicial_dolar]", document.getElementById("input-price-usd-cash").value.replace(/\./g, '').replace(',', '.'))
        data.append("lista[0][monto_inicial_bs]", document.getElementById("input-price-bs-cash").value.replace(/\./g, '').replace(',', '.'))
        data.append("lista[0][id_usuario]", session.message.id)
        add(() => searchParam({ estado: 1 }, "cash"),
            'cash',
            data,
            targetCash,
            ".cont-cash_open",
            "cash",
            (response) => editData(response),
            () => binnacle(session.message.id, 'Caja', 'Eliminacion', 'Se elimino una caja'),
            () => {
                binnacle(session.message.id, 'Caja', 'Agregar', 'Se abrio una caja')
                verifyCash()
                document.querySelector(".cash_status").classList.add("bg-success")
                document.querySelector(".cash_status").classList.remove("bg-danger")
                const tooltip = bootstrap.Tooltip.getInstance(document.querySelector(".cash_status"));
                if (tooltip) {
                    tooltip._config.title = "Estado de caja: Abierta";
                    tooltip.update();
                }
            }
        )


        form.reset()
        document.getElementById("input-price-usd-cash").classList.remove("is-valid", "is-invalid")
        document.getElementById("input-price-bs-cash").classList.remove("is-valid", "is-invalid")
        bootstrap.Modal.getOrCreateInstance('#register-cash').hide()
    }

})