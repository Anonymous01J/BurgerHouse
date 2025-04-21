export default function functionGeneral() {

    async function permission(module) {
        let data = await fetch("./assets/js/permission_example.json")
        let response = await data.json()
        const permiss = response.find((e) => e.modulo.toLocaleLowerCase() == module.toLocaleLowerCase())
        let permissions = permiss.permisos.split(",")

        if (!permissions.includes("consultar")) {
            document.querySelector(`[data-module='${module}']`).remove()
        }
        if (!permissions.includes("agregar") && document.querySelector(`[data-module-add='${module.toLocaleLowerCase()}']`)) {
            document.querySelector(`[data-module-add='${module.toLocaleLowerCase()}']`).remove()
        }
        if (!permissions.includes("editar")) {
            document.querySelectorAll(`[data-module-edit='${module.toLocaleLowerCase()}']`).forEach((d) => d.remove())
        }
        if (!permissions.includes("eliminar")) {
            document.querySelectorAll(`[data-module-delete='${module.toLocaleLowerCase()}']`).forEach((d) => d.remove())
        }
    }
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
        const data = { [fieldName]: fieldValue };
        const fieldRules = { [fieldName]: rules[fieldName] };

        const errors = validate(data, fieldRules);
        const errorMessage = errors ? errors[fieldName][0] : null;
        setValidationStyles(field.id, errorMessage);
    }

    function reindex(elementAll, id, counter, name) {
        const element = document.querySelectorAll(elementAll);
        counter = element.length;

        element.forEach((item, index) => {
            const newIndex = index + 1;
            item.id = `${id}-${newIndex}`;

            item.querySelectorAll("input").forEach(input => {
                const parts = input.id.split("-");
                const baseId = parts.slice(0, parts.length - 1).join("-");
                const newId = `${baseId}-${newIndex}`;
                input.id = newId;
            });
            item.querySelectorAll("[id^='error-input']").forEach(errorDiv => {
                const parts = errorDiv.id.split("-");
                const newId = `${parts[0]}-${parts[1]}-${parts[2]}-${parts[3]}-${newIndex}`;
                errorDiv.id = newId;
            });

            const header = item.querySelector("h4");
            if (header) {
                header.textContent = `${name} ${newIndex}`;
            }
        });
    }

    function resetForm(elements, form) {
        let supplier = document.querySelectorAll(elements)
        supplier.forEach(d => {
            let id = d.id.split("-")[1]
            if (id > 1) {
                d.remove()
            }
            d.querySelectorAll("input, textarea").forEach(input => {
                input.value = input.type === "button" ? "Seleccione una opcion" : "";
                input.classList.remove("is-valid", "is-invalid");
            })
            if (d.querySelectorAll("img")) {
                d.querySelectorAll("img").forEach(img => {
                    img.src = "";
                    img.style.display = "none";
                })
            }
        })
        form.reset()
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
        document.querySelectorAll(inputs).forEach(image => {
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

    //--------------funciones para el manejo de peticiones ajax------------------

    const searchAll = async (module, active) => {
        let data = new FormData()
        data.append("active", active)

        let search = await fetch(`${module}/get_all/0/6/id/desc`, {
            method: "POST",
            body: data,
        })
        let response = await search.json()
        return response
    }
    const print = async (search, template, container, modulePermission) => {
        let response = await search
        let templatesWrapper = ""
        response.forEach(element => {
            templatesWrapper += template(element)
        })
        document.querySelector(container).innerHTML = templatesWrapper
        permission(modulePermission)
        Delete(template, container)
        feather.replace()
    }
    const Delete = (template, container) => {
        document.querySelectorAll(".trash_btn").forEach(element => {
            element.addEventListener("click", () => {
                Swal.fire({
                    title: "¿Deseas eliminar este elemento?",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Eliminar",
                    cancelButtonText: "Cancelar",
                    confirmButtonColor: "#FF4B00"
                }).then((result) => {
                    if (result.isConfirmed) {
                        let id = element.getAttribute("data-id")
                        let module = element.getAttribute("data-module-delete")
                        $.ajax({
                            type: "POST",
                            url: `${module}/update`,
                            data: { id, active: 0 },
                            success: function (response) {
                                console.log(response);
                                print(searchAll(module, 1), template, container)
                            }
                        })
                        Swal.fire({
                            title: "Elemento eliminado!",
                            icon: "success",
                            confirmButtonText: "Aceptar",
                            confirmButtonColor: "#FF4B00"
                        });
                    }
                });

            })
        })

    }
    const deleteDatatableItem = (tabla) => {
        $(tabla).on('click', '.trash_btn', function () {
            Swal.fire({
                title: "¿Deseas eliminar este elemento?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Eliminar",
                cancelButtonText: "Cancelar",
                confirmButtonColor: "#FF4B00"
            }).then((result) => {
                if (result.isConfirmed) {
                    let id = this.getAttribute("data-id")
                    let module = this.getAttribute("data-module")
                    $.ajax({
                        type: "POST",
                        url: `${module}/update`,
                        data: { id, active: 0 },
                        success: function (response) {
                            Swal.fire({
                                title: "Elemento eliminado!",
                                icon: "success",
                                confirmButtonText: "Aceptar",
                                confirmButtonColor: "#FF4B00"
                            });
                        }
                    })
                }
            });
        });
    }
    const add = async (module, data, template, container, permission) => {
        let action = await fetch(`${module}/add_many`, {
            method: "POST",
            body: data
        })
        let response = await action.json()
        console.log(response);
        Swal.fire({
            title: `Exito!`,
            text: "El elemento fue agregado correctamente",
            icon: "success"
        });
        print(searchAll(module, 1), template, container, permission)

    }

    const searchSingle = () => {

    }

    // const edit = () => {
    //     document.querySelectorAll(".edit_btn").forEach(btn => {
    //         btn.addEventListener("click", () => {
    //             let id = btn.getAttribute("data-id")
    //             let module = btn.getAttribute("data-module")

    //             $.ajax({
    //                 type: "POST",
    //                 url: `${module}/get_all`,
    //                 data: { id },
    //                 success: function (response) {
    //                     let json = JSON.parse(response)
    //                     for (const key in json) {
    //                         if (json.hasOwnProperty(key)) {
    //                             let input = document.querySelector(`[name="${key}"]`);
    //                             if (input) {
    //                                 input.value = json[key];
    //                             }
    //                         }
    //                     }

    //                 }
    //             })

    //             // new bootstrap.Modal(document.getElementById("edit-combo")).show()
    //         })
    //     })
    // }

    return { InputPrice, hora, fecha, setValidationStyles, validateField, SelectOption, viewImage, searchAll, print, add, reindex, resetForm, permission }
}