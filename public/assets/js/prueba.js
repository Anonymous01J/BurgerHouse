import functionGeneral from "./Functions.js";
import Templates from "./templates.js";
const { targetProductProcess } = Templates();
const { searchParam } = functionGeneral();
const print = async (config) => {
  const { search, template, container, funtions } = config;
  let response = await search();
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
  feather.replace();
  funtions()
};

const config = {
  search: () => searchParam({ active: 1 }, "productProcess"),
  template: targetProductProcess,
  container: ".prueba",
  funtions: () => {
    Delete();
  },
}




const Delete = () => {
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
          // $.ajax({
          //   type: "POST",
          //   url: `${module}/update`,
          //   data: { id, active: 0 },
          //   success: function (response) {
          //     if (response.success == true) {
          //       Swal.fire({
          //         title: `Exito!`,
          //         text: "El elemento fue eliminado correctamente",
          //         icon: "success",
          //       });
          //       print(search, template, container, modulePermission, inputs, binnacleDelete);
          //       binnacleDelete()
          //     } else {
          //       Swal.fire({
          //         title: `Error!`,
          //         text: "El elemento no fue eliminado",
          //         icon: "error",
          //       });
          //     }

          //   }
          // });
          console.log("eliminado");
          print(config)
          console.log("registrado en binnacle");
        }
      });
    });
  });
};

print(config)