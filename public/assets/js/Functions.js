export default function functionGeneral() {

    function InputPrice(input) {
        let inputDom = document.querySelectorAll(input)
        inputDom.forEach((element) => {
            element.addEventListener('input', (e) => {
                let valueUser = e.target.value.replace(/,/g, '').replace(/\./g, '').replace(/[^0-9]/g, '')
                let valueLength = valueUser.length
                if (valueLength <= 2) { element.value = '0' + "," + valueUser }
                else if (valueLength >= 3) {
                    let it = (valueUser.slice(0, valueLength - 2) + "," + valueUser.slice(valueLength - 2))
                    element.value = it.replace(/^0(?=\d)\,?/, "").replace(/\B(?=(\d{3})+(?!\d))/g, '.')
                }
            });
        })
    }

    function hora(f) {
        const fecha = new Date(f);
        const horas = fecha.getHours();
        const minutos = fecha.getMinutes();
        const periodo = horas >= 12 ? "PM" : "AM";
        const horas12 = horas % 12 || 12;
        const horaFormateada = `${horas12}:${minutos < 10 ? `0${minutos}` : minutos} ${periodo}`;
        return horaFormateada
    }

    function fecha(f) {
        const fecha = new Date(f);
        const dia = fecha.getDate();
        const mes = fecha.getMonth() + 1;
        const anio = fecha.getFullYear();
        const fechaFormateada = `${dia}/${mes}/${anio}`;
        return fechaFormateada
    }     


    function setValidationStyles(input, errorMessage) {
        const inputElement = document.getElementById(input);
        const errorElement = document.getElementById("error-" + input);

        if (errorMessage) {
            inputElement.classList.add("is-invalid");
            inputElement.classList.remove("is-valid");
            errorElement.textContent = errorMessage;
        } else {
            inputElement.classList.add("is-valid");
            inputElement.classList.remove("is-invalid");
            errorElement.textContent = "";
        }
    }

    function validateField(event, rules) {
        const field = event.target;
        const fieldName = field.name;
        const fieldValue = field.value;

        const errors = validate({ [fieldName]: fieldValue }, { [fieldName]: rules[fieldName] });
        setValidationStyles(field.id, errors ? errors[fieldName][0] : null);
    }

    function SelectOption() {
        document.querySelectorAll(".dropdown-item").forEach(item => {

            item.addEventListener("click", () => {

                let input = item.parentElement.parentElement.firstElementChild.value
                let option = item.textContent
                item.parentElement.parentElement.firstElementChild.value = option
                if (input != "" || input != "Seleccione una opcion") {
                    item.parentElement.parentElement.firstElementChild.parentElement.parentElement.parentElement.nextElementSibling.textContent = ""
                }
            })
        })
    }

    function viewImage(inputs) {
        document.querySelectorAll(inputs).forEach(image=>{
            image.addEventListener("change", function (event) {
                const file = event.target.files[0]; // Obtiene el archivo seleccionado
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        const img = image.nextElementSibling.nextElementSibling
                        img.src = e.target.result; // Asigna el resultado de la lectura al src de la imagen
                        img.style.display = "block"; // Muestra la imagen
                    };
                    reader.readAsDataURL(file); // Convierte el archivo en una URL de datos
                }
            });
        })
    }



    return { InputPrice, hora, fecha, setValidationStyles, validateField, SelectOption, viewImage }
}