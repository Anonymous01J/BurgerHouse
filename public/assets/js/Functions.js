export default function functionGeneral() {
  async function permission(module = null) {
    if (module != null) {
      let data = await fetch("./assets/js/permission_example.json");
      let response = await data.json();
      const permiss = response.find((e) => e.modulo.toLocaleLowerCase() == module.toLocaleLowerCase()) ? response.find((e) => e.modulo.toLocaleLowerCase() == module.toLocaleLowerCase()) : null;

      if (permiss != null) {
        let permissions = permiss.permisos.split(",");
        if (!permissions.includes("agregar") && document.querySelector(`[data-module-add='${module.toLocaleLowerCase()}']`)) {
          document.querySelectorAll(`[data-module-add='${module.toLocaleLowerCase()}']`).forEach((d) => d.remove())
        }
        if (!permissions.includes("editar")) {
          document.querySelectorAll(`[data-module-edit='${module.toLocaleLowerCase()}']`).forEach((d) => d.remove())
        }
        if (!permissions.includes("eliminar")) {
          document.querySelectorAll(`[data-module-delete='${module.toLocaleLowerCase()}']`).forEach((d) => d.remove());
        }
        if (!permissions.includes("consultar")) {
          document.querySelectorAll(`[data-module='${module}']`).forEach((d) => d.remove());
        }
      } else if (document.querySelector(`[data-module='${module}']`)) {
        document.querySelector(`[data-module='${module}']`).remove();
      }
    }
  }
  function InputPrice(input) {
    let inputDom = document.querySelectorAll(input);
    inputDom.forEach((element) => {
      element.addEventListener("input", (e) => {
        let valueUser = e.target.value.replace(/,/g, "").replace(/\./g, "").replace(/[^0-9]/g, "");
        let valueLength = valueUser.length;
        if (valueLength <= 2) {
          element.value = "0" + "," + valueUser;
        } else if (valueLength >= 3) {
          let it = valueUser.slice(0, valueLength - 2) + "," + valueUser.slice(valueLength - 2);
          element.value = it.replace(/^0(?=\d)\,?/, "").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        }
      });
    });
  }
  function hora(f) {
    const fecha = new Date(f);
    const horas = fecha.getHours();
    const minutos = fecha.getMinutes();
    const periodo = horas >= 12 ? "PM" : "AM";
    const horas12 = horas % 12 || 12;
    const horaFormateada = `${horas12}:${minutos < 10 ? `0${minutos}` : minutos} ${periodo}`;
    return horaFormateada;
  }

  function fecha(f) {
    const fecha = new Date(f);
    const dia = fecha.getDate();
    const mes = fecha.getMonth() + 1;
    const anio = fecha.getFullYear();
    const fechaFormateada = `${dia}/${mes}/${anio}`;
    return fechaFormateada;
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

      item.querySelectorAll("input").forEach((input) => {
        const parts = input.id.split("-");
        const baseId = parts.slice(0, parts.length - 1).join("-");
        const newId = `${baseId}-${newIndex}`;
        input.id = newId;
      });
      item.querySelectorAll("[id^='error-input']").forEach((errorDiv) => {
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
    let supplier = document.querySelectorAll(elements);
    supplier.forEach((d) => {
      let id = d.id.split("-")[1];
      if (id > 1) d.remove();
      d.querySelectorAll("input, textarea").forEach((input) => {
        input.value = input.type === "button" ? "Seleccione una opcion" : "";
        if (input.tagName.toLowerCase() === "input") {
          if (input.type === "button") {
            input.setAttribute("data-id", "Seleccione una opcion");
          }
        }
        input.classList.remove("is-valid", "is-invalid");
      });
      if (d.querySelectorAll("img")) {
        d.querySelectorAll("img").forEach((img) => {
          img.src = "";
          img.style.display = "none";
        });
      }
    });
    form.reset();
  }
  async function SelectOption(selectItem = null, module = null, template = null) {
    let select = document.querySelector(selectItem);
    if (module != null) {
      let template = ""
      let data = await searchAll('rol', 1)
      if (data.length == 0) {
        select.querySelector(".options_search").innerHTML = `<a class="dropdown-item">No hay resultados</a>`;
      } else {
        data.forEach((element) => {
          template += ` <a class="dropdown-item" data-id="${element.id}">${element.nombre}</a>`;
        });
        select.querySelector(".options_search").innerHTML = template;
      }
    }
    if (module != null) {
      select.querySelector(".search_select").addEventListener("keyup", async (e) => {
        if (e.target.value != "") {
          let res = await searchLike(e, module, 1);
          let cont = "";
          if (res.length == 0) {
            cont = `<a class="dropdown-item"">No hay resultados</a>`;
            select.querySelector(".options_search").innerHTML = cont;
          } else {
            res.forEach((element) => {
              cont += template(element);
            });
          }
          select.querySelector(".options_search").innerHTML = cont;
          select.querySelectorAll(".dropdown-item").forEach((item) => {
            item.addEventListener("click", () => {
              let input = item.parentElement.parentElement.parentElement.firstElementChild.value;
              let option = item.textContent;
              item.parentElement.parentElement.parentElement.firstElementChild.value = option;
              if (module != null) {
                let id = item.getAttribute("data-id");
                item.parentElement.parentElement.parentElement.firstElementChild.setAttribute("data-id", id);
              }
              if (input != "" || input != "Seleccione una opcion") {
                item.parentElement.parentElement.firstElementChild.parentElement.parentElement.parentElement.parentElement.nextElementSibling.textContent = "";
              }
            });
          });

        }
      });
    }
    select.querySelectorAll(".dropdown-item").forEach((item) => {
      item.addEventListener("click", () => {
        let input = item.parentElement.parentElement.parentElement.firstElementChild.value;
        let option = item.textContent;
        item.parentElement.parentElement.parentElement.firstElementChild.value = option;
        if (module != null) {
          let id = item.getAttribute("data-id");
          item.parentElement.parentElement.parentElement.firstElementChild.setAttribute("data-id", id);
        }
        if (input != "" || input != "Seleccione una opcion") {
          item.parentElement.parentElement.firstElementChild.parentElement.parentElement.parentElement.parentElement.nextElementSibling.textContent = "";
        }
      });
    });
  }
  async function selectOptionAll(item = null, module = null, template = null) {
    let select = document.querySelectorAll(item);
    select.forEach(async (element) => {
      if (module != null) {
        let data = await searchAll(module, 1)
        let template = ""
        if (data.length == 0) {
          element.querySelector(".options_search").innerHTML = `<a class="dropdown-item">No hay resultados</a>`;
        } else {
          data.forEach((element) => {
            template += ` <a class="dropdown-item" data-id="${element.id}">${element.nombre}</a>`;
          });
          element.querySelector(".options_search").innerHTML = template;
        }
        element.querySelectorAll(".dropdown-item").forEach((item) => {
          item.addEventListener("click", () => {
            let input = item.parentElement.parentElement.parentElement.firstElementChild.value;
            let option = item.textContent;
            item.parentElement.parentElement.parentElement.firstElementChild.value = option;
            if (module != null) {
              let id = item.getAttribute("data-id");
              item.parentElement.parentElement.parentElement.firstElementChild.setAttribute("data-id", id);
            }
            if (input != "" || input != "Seleccione una opcion") {
              item.parentElement.parentElement.firstElementChild.parentElement.parentElement.parentElement.parentElement.nextElementSibling.textContent = "";
            }
          });
        });
      }
      if (module != null) {
        element.querySelector(".search_select").addEventListener("keyup", async (e) => {
          if (e.target.value != "") {
            let res = await searchLike(e, module, 1);
            let cont = "";
            if (res.length == 0) {
              cont = `<a class="dropdown-item"">No hay resultados</a>`;
              element.querySelector(".options_search").innerHTML = cont;
            } else {
              res.forEach((element) => {
                cont += template(element);
              });
            }
            element.querySelector(".options_search").innerHTML = cont;
            element.querySelectorAll(".dropdown-item").forEach((item) => {
              item.addEventListener("click", () => {
                let input = item.parentElement.parentElement.parentElement.firstElementChild.value;
                let option = item.textContent;
                item.parentElement.parentElement.parentElement.firstElementChild.value = option;
                if (module != null) {
                  let id = item.getAttribute("data-id");
                  item.parentElement.parentElement.parentElement.firstElementChild.setAttribute("data-id", id);
                }
                if (input != "" || input != "Seleccione una opcion") {
                  item.parentElement.parentElement.firstElementChild.parentElement.parentElement.parentElement.parentElement.nextElementSibling.textContent = "";
                }
              });
            });
          } else {
            let res = await searchAll(module, 1);
            let cont = "";
            if (res.length == 0) {
              cont = `<a class="dropdown-item"">No hay resultados</a>`;
            } else {
              res.forEach((element) => {
                cont += template(element);
              });
            }
            element.querySelector(".options_search").innerHTML = cont;
          }
        });
      }
      element.querySelectorAll(".dropdown-item").forEach((item) => {
        item.addEventListener("click", () => {
          let input = item.parentElement.parentElement.parentElement.firstElementChild.value;
          let option = item.textContent;
          item.parentElement.parentElement.parentElement.firstElementChild.value = option;
          if (module != null) {
            let id = item.getAttribute("data-id");
            item.parentElement.parentElement.parentElement.firstElementChild.setAttribute("data-id", id);
          }
          if (input != "" || input != "Seleccione una opcion") {
            item.parentElement.parentElement.firstElementChild.parentElement.parentElement.parentElement.parentElement.nextElementSibling.textContent = "";
          }
        });
      });
    })
  }
  function viewImage(inputs) {
    document.querySelectorAll(inputs).forEach((image) => {
      image.addEventListener("change", function (event) {
        const file = event.target.files[0]; // Obtiene el archivo seleccionado
        if (file) {
          const reader = new FileReader();
          reader.onload = function (e) {
            const img = image.parentElement.nextElementSibling;
            img.src = e.target.result; // Asigna el resultado de la lectura al src de la imagen
            img.style.display = "block"; // Muestra la imagen
          };
          reader.readAsDataURL(file); // Convierte el archivo en una URL de datos
        }
      });
    });
  }
  //--------------funciones para el manejo de peticiones ajax para las tarjetas------------------
  const searchAll = async (module, active) => {
    let data = new FormData();
    data.append("active", active);

    let search = await fetch(`${module}/get_all/0/6/id/desc`, {
      method: "POST",
      body: data,
    });
    let response = await search.json();
    return response;
  };
  const print = async (search, template, container, modulePermission, inputs) => {
    let response = await search;
    let templatesWrapper = "";
    if (response.length == 0) {
      templatesWrapper = `
        <div class="col-12">
            <div class="d-flex justify-content-center align-items-center">
                <img src="./assets/img/bh_logo.png" alt="Logo" class="img-fluid opacity-25">
            </div>
        </div>
      `;
    } else {
      response.forEach((element) => {
        templatesWrapper += template(element);
      });
    }
    document.querySelector(container).innerHTML = templatesWrapper;
    document.querySelectorAll(".edit_btn").forEach((element) => {let tooltip = new bootstrap.Tooltip(element)});
    document.querySelectorAll(".trash_btn").forEach((element) => {let tooltip = new bootstrap.Tooltip(element)});
    permission(modulePermission);
    Delete(template, container);
    edit(inputs);
    feather.replace();
  };
  const Delete = (template, container, modulePermission, inputs) => {
    document.querySelectorAll(".trash_btn").forEach((element) => {
      element.addEventListener("click", () => {
        Swal.fire({
          title: "¿Deseas eliminar este elemento?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonText: "Eliminar",
          cancelButtonText: "Cancelar",
          confirmButtonColor: "#FF4B00",
        }).then((result) => {
          if (result.isConfirmed) {
            let id = element.getAttribute("data-id");
            let module = element.getAttribute("data-module-delete");
            $.ajax({
              type: "POST",
              url: `${module}/update`,
              data: { id, active: 0 },
              success: function (response) {
                if (response.success == true) {
                  Swal.fire({
                    title: `Exito!`,
                    text: "El elemento fue eliminado correctamente",
                    icon: "success",
                  });
                  print(searchAll(module, 1), template, container, modulePermission, inputs);
                } else {
                  Swal.fire({
                    title: `Error!`,
                    text: "El elemento no fue eliminado",
                    icon: "error",
                  });
                }

              }
            });

          }
        });
      });
    });
  };
  const add = async (module, data, template, container, permission, inputs) => {
    let action = await fetch(`${module}/add_many`, {
      method: "POST",
      body: data,
    });
    let response = await action.json()
    if (response.success == true) {
      Swal.fire({
        title: `Exito!`,
        text: "El elemento fue agregado correctamente",
        icon: "success",
      });
      print(searchAll(module, 1), template, container, permission, inputs);
    } else {
      Swal.fire({
        title: `Error!`,
        text: "El elemento no fue agregado",
        icon: "error",
      });
    }
  };
  const searchParam = async (param, module, data, active) => {
    let d = new FormData();
    d.append(`${param}`, data);
    d.append("active", active);
    let pet = await fetch(`${module}/get_all`, {
      method: "POST",
      body: d,
    });
    let response = await pet.json();
    return response;
  };
  const searchLike = async (event, module, active) => {
    let data = new FormData();
    data.append("nombre_like", event.target.value);
    data.append("active", active);
    let pet = await fetch(`${module}/get_all`, {
      method: "POST",
      body: data,
    });
    let response = pet.json()
    return response;
  };
  const update = async (module, data, template, container, permission, inputs) => {
    let action = await fetch(`${module}/update`, {
      method: "POST",
      body: data,
    });
    let response = await action.json();
    if (response.success == true) {
      Swal.fire({
        title: `Exito!`,
        text: "El elemento fue actualizado correctamente",
        icon: "success",
      });
      print(searchAll(module, 1), template, container, permission, inputs);
    } else {
      Swal.fire({
        title: `Error!`,
        text: "El elemento no fue actualizado",
        icon: "error",
      });
    }
  };
  const edit = async (inputs) => {
    document.querySelectorAll(".edit_btn").forEach(btn => {
      btn.addEventListener("click", async () => {
        let id = btn.getAttribute("data-id")
        let module = btn.getAttribute("data-module-edit")
        let data = new FormData();
        data.append("id", id);
        let pet = await fetch(`${module}/get_all`, {
          method: "POST",
          body: data
        })
        let response = await pet.json()
        if (typeof inputs === "function") {
          inputs(response);
        }
      })
    })
  }
  const searchFilter = (searchInput, module, template, modulePermission, container, active, inputs) => {
    let search = document.querySelector(searchInput);
    search.addEventListener("keyup", async (e) => {
      if (e.target.value != "") {
        print(searchLike(e, module, active), template, container, modulePermission, inputs);
      } else {
        print(searchAll(module, 1), template, container, modulePermission, inputs);
      }
    });
  }
  //--------------funciones para el manejo de peticiones ajax para las datatables------------------
  const deleteDatatable = (tableItem, table) => {
    $(`${tableItem} tbody`).on("click", ".trash_btn_datatable", function () {
      Swal.fire({
        title: "¿Deseas eliminar este elemento?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Eliminar",
        cancelButtonText: "Cancelar",
        confirmButtonColor: "#FF4B00",
      }).then((result) => {
        if (result.isConfirmed) {
          let id = this.getAttribute("data-id");
          let module = this.getAttribute("data-module-delete");
          $.ajax({
            type: "POST",
            url: `${module}/update`,
            data: { id, active: 0 },
            success: function (response) {
              if (response.success == true) {
                Swal.fire({
                  title: `Exito!`,
                  text: "El elemento fue eliminado correctamente",
                  icon: "success",
                });
                table.ajax.reload();
              } else {
                Swal.fire({
                  title: `Error!`,
                  text: "El elemento no fue eliminado",
                  icon: "error",
                });
              }
            },
          });
        }
      });
    });
  };
  const addDataTables = async (table, data, module) => {
    let pet = await fetch(`${module}/add_many`, {
      method: "POST",
      body: data,
    })
    let response = await pet.json()
    if (response.success == true) {
      Swal.fire({
        title: `Exito!`,
        text: "El elemento fue agregado correctamente",
        icon: "success",
      });
      table.ajax.reload();
    } else {
      Swal.fire({
        title: `Error!`,
        text: "El elemento no fue agregado",
        icon: "error",
      });
    }
  }
  const editDataTables = async (tableItem, inputs) => {
    $(`${tableItem} tbody`).on("click", ".edit_btn_datatable", function () {
      let id = this.getAttribute("data-id")
      let module = this.getAttribute("data-module-edit")
      $.ajax({
        type: "POST",
        url: `${module}/get_all`,
        data: { "id": id },
        success: function (response) {
          inputs(response);
        }
      })
    })
  }
  const updateDataTables = async (table, data, module) => {
    let pet = await fetch(`${module}/update`, {
      method: "POST",
      body: data,
    })
    let response = await pet.json()
    if (response.success == true) {
      Swal.fire({
        title: `Exito!`,
        text: "El elemento fue actualizado correctamente",
        icon: "success",
      });
      table.ajax.reload();
    } else {
      Swal.fire({
        title: `Error!`,
        text: "El elemento no fue actualizado",
        icon: "error",
      });
    }
  }
  return {
    InputPrice,
    hora,
    fecha,
    setValidationStyles,
    validateField,
    SelectOption,
    selectOptionAll,
    viewImage,
    searchAll,
    searchParam,
    searchLike,
    searchFilter,
    print,
    add,
    edit,
    update,
    reindex,
    resetForm,
    permission,
    addDataTables,
    deleteDatatable,
    editDataTables,
    updateDataTables,
  };
}