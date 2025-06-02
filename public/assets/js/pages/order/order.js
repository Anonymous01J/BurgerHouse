import functionGeneral from "../../Functions.js";
const { sessionInfo, binnacle, fecha, hora, updateDataTables, searchParam } = functionGeneral();
let session = await sessionInfo();

//tables de domicilio 

let tableOrderDomicileoPendings = $('.table-order-domicilio-pendientes').DataTable({
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  "order": [[0, "desc"]],
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: '',
    type: 'POST',
    data: { status: 0, },
  },
  columns: [
    { data: 'nro_orden' },
    { data: null, render: function (data) { return data.cliente_nombre + " " + data.cliente_apellido } },
    { data: null, render: function (data) { return fecha(data.fecha) } },
    { data: null, render: function (data) { return hora(data.fecha) } },
    { data: null, render: function (data, type, row, meta) { return ` <i type_action="details" class="reference_btn" data-bs-toggle="tooltip" data-bs-title="Ver detalle de orden" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#comprobante_view" data-feather="eye"></i>` } },
    { data: null, render: function (data, type, row, meta) { return ` <i type_action="payment" class="reference_btn" data-bs-toggle="tooltip" data-bs-title="Ver datos del pago" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#comprobante_view" data-feather="eye"></i>` } },
    {
      data: null,
      orderable: false,
      render: function (data, type, row, meta) {
        return `
           <button nro_orden="${data.nro_orden}" id_order="${data.id}" type_action="verify_orden" class="btn bh_1 rounded-circle btn-circle" data-bs-toggle="tooltip" data-bs-title="Orden Verificada" data-bs-placement="top">
              <i data-feather="check-circle" class="text-white"></i>
            </button>
            <button nro_orden="${data.nro_orden}" id_order="${data.id}" type_action="null_order" class="btn bh_5 rounded-circle btn-circle" data-bs-toggle="tooltip" data-bs-title="Anular Orden" data-bs-placement="top">
              <i data-feather="x-circle" class="text-white"></i>
            </button>
          `;
      }
    }
  ],
  drawCallback: function (settings) {
    feather.replace();
    document.querySelectorAll(".reference_btn").forEach((btn) => {
      let tooltip = new bootstrap.Tooltip(btn)
      btn.addEventListener("click", () => detailOrder(btn))
    })
    document.querySelectorAll(".btn-circle").forEach((btn) => {
      let tooltip = new bootstrap.Tooltip(btn)
      btn.addEventListener("click", async () => actionOrder(btn))
    })

  },
  "dom": 'tipr',
  "paging": true,
  "info": true,
});
let tableOrderDomicileProcess = $('.table-order-domicilio-procesadas').DataTable({
  "order": [[0, "desc"]],
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: '',
    type: 'POST',
    data: { status: 4, },
  },
  columns: [
    { data: 'nro_orden' },
    { data: null, render: function (data) { return data.cliente_nombre + " " + data.cliente_apellido } },
    { data: null, render: function (data) { return fecha(data.fecha) } },
    { data: null, render: function (data) { return hora(data.fecha) } },
    { data: null, render: function (data, type, row, meta) { return ` <i type_action="details" class="reference_btn" data-bs-toggle="tooltip" data-bs-title="Ver detalle de orden" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#comprobante_view" data-feather="eye"></i>` } },
    { data: null, render: function (data, type, row, meta) { return ` <i type_action="payment" class="reference_btn" data-bs-toggle="tooltip" data-bs-title="Ver datos del pago" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#comprobante_view" data-feather="eye"></i>` } },
  ],
  drawCallback: function (settings) {
    feather.replace();
    document.querySelectorAll(".reference_btn").forEach((btn) => {
      let tooltip = new bootstrap.Tooltip(btn)
      btn.addEventListener("click", () => detailOrder(btn))
    })
    document.querySelectorAll(".btn-circle").forEach((btn) => {
      let tooltip = new bootstrap.Tooltip(btn)
    })

  },
  "dom": 'tipr',
  "paging": true,
  "info": true,
});
let tableOrderDomicileNull = $('.table-order-domicilio-null').DataTable({
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  "order": [[0, "desc"]],
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: '',
    type: 'POST',
    data: { status: -1, },
  },
  columns: [
    { data: 'nro_orden' },
    { data: null, render: function (data) { return data.cliente_nombre + " " + data.cliente_apellido } },
    { data: null, render: function (data) { return fecha(data.fecha) } },
    { data: null, render: function (data) { return hora(data.fecha) } },
    { data: null, render: function (data, type, row, meta) { return ` <i type_action="details" class="reference_btn" data-bs-toggle="tooltip" data-bs-title="Ver detalle de orden" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#comprobante_view" data-feather="eye"></i>` } },
    { data: null, render: function (data, type, row, meta) { return ` <i type_action="payment" class="reference_btn" data-bs-toggle="tooltip" data-bs-title="Ver datos del pago" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#comprobante_view" data-feather="eye"></i>` } },
  ],
  drawCallback: function (settings) {
    feather.replace();
    document.querySelectorAll(".reference_btn").forEach((btn) => {
      let tooltip = new bootstrap.Tooltip(btn)
      btn.addEventListener("click", () => detailOrder(btn))
    })
    document.querySelectorAll(".btn-circle").forEach((btn) => {
      let tooltip = new bootstrap.Tooltip(btn)
    })

  },
  "dom": 'tipr',
  "paging": true,
  "info": true,
});
$('#searchBoxDomicilioPending').on('keyup', function () {
  tableOrderDomicileoPendings.search(this.value).draw();
});
$('#searchBoxDomicilioProcesadas').on('keyup', function () {
  tableOrderDomicileProcess.search(this.value).draw();
});
$('#searchBoxDomicilioNull').on('keyup', function () {
  tableOrderDomicileNull.search(this.value).draw();
});


//tables para llevar

window.stepper = new Stepper(document.querySelector('#stepper'), {
  linear: true,
  animation: true
});

const detailOrder = async (btn) => {
  let data = new FormData();
  let id_order = btn.getAttribute("data-id_order");
  let id_sale = btn.getAttribute("data_id_sale");
  let action = btn.getAttribute("type_action");
  if (action == "details") {
    data.append("id_orden", id_order)
    let dataProductPrepared = []
    let templateProductPrepared = ""
    let templateProductProcess = ""
    let pet1 = await fetch("Detalle_orden_producto_preparado/get_all", { method: "POST", body: data })
    let pet2 = await fetch("Detalle_orden_producto_procesado/get_all", { method: "POST", body: data })
    let res = await pet1.json()
    let res2 = await pet2.json()

    res.forEach((productPrepared) => { if (productPrepared.tipo == "producto") dataProductPrepared.push(productPrepared) })
    dataProductPrepared.forEach((productPrepared) => {
      templateProductPrepared += `
            <tr>
              <td>${productPrepared.nombre}</td>
              <td>${productPrepared.cantidad}</td>
              <td>${productPrepared.descripcion == null ? "S/D" : productPrepared.descripcion}</td>
              <td>${productPrepared.adicionales == null ? "S/A" : productPrepared.adicionales}</td>
            </tr>
          `
    })
    res2.forEach((productProcess) => {
      templateProductProcess += `
            <tr>
              <td>${productProcess.nombre}</td>
              <td>${productProcess.cantidad}</td>
            </tr>
          `
    })
    document.querySelector(".tbody-detail-order").innerHTML = templateProductPrepared
    document.querySelector(".tbody-detail-order").innerHTML += templateProductProcess
    bootstrap.Modal.getOrCreateInstance('#detail_order').show()
  } else {
    data.append("id_venta", id_sale)
    let dataPayment = []
    let templatePayment = ""
    let pet = await fetch("payment/get_all/0/10000000/id/asc", { method: "POST", body: data })
    let res = await pet.json()
    res.forEach((payment) => {
      templatePayment += `
      <div class="col-md-6">
          <h3>Referencia: ${payment.referencia}</h3>
          <img class="w-75" src="./media/pay/${payment.comprobante}" alt="">
      </div>`
    })
    document.querySelector(".cont-detail-payment").innerHTML = templatePayment
    bootstrap.Modal.getOrCreateInstance('#detail_payment').show()
  }
}
const actionOrder = (btn) => {
  let data = new FormData();
  let action = btn.getAttribute("type_action");
  if (action == "verify_orden") {
    Swal.fire({
      title: "¿Deseas verificar esta orden?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Si, verificar",
      cancelButtonText: "Cancelar",
      confirmButtonColor: "#FF4B00",
    }).then(async (result) => {
      if (result.isConfirmed) {
        let id_order = btn.getAttribute("id_order");
        data.append("id", id_order);
        data.append("status", 1);
        let pet = await fetch(`order/update`, { method: "POST", body: data });
        let response = await pet.json();
        if (response.success) {
          if (response.success == true) {
            Swal.fire({
              title: `Exito!`,
              text: "La orden fue verificada correctamente",
              icon: "success",
            });
            binnacle(session.message.id, "orden", "Actualizacion", `Se verifico la orden ${btn.getAttribute("nro_orden")}`);
            tableOrderDomicileoPendings.ajax.reload();
            targetUpdate()
          } else {
            Swal.fire({
              title: `Error!`,
              text: "La orden no fue verificada",
              icon: "error",
            });
          }
        }
      }
    });
  } else {
    Swal.fire({
      title: "¿Deseas anular esta orden?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Si, anular",
      cancelButtonText: "Cancelar",
      confirmButtonColor: "#FF4B00",
    }).then(async (result) => {
      if (result.isConfirmed) {
        let id_order = btn.getAttribute("id_order");
        data.append("id", id_order);
        data.append("status", -1);
        let pet = await fetch(`order/update`, { method: "POST", body: data });
        let response = await pet.json();
        if (response.success) {
          if (response.success == true) {
            Swal.fire({
              title: `Exito!`,
              text: "La orden fue anulada correctamente",
              icon: "success",
            });
            binnacle(session.message.id, "orden", "Actualizacion", `Se anulo la orden ${btn.getAttribute("nro_orden")}`);
            tableOrderDomicileoPendings.ajax.reload();
            tableOrderDomicileNull.ajax.reload();
            targetUpdate()
          } else {
            Swal.fire({
              title: `Error!`,
              text: "La orden no fue anulada",
              icon: "error",
            });
          }
        }
      }
    });
  }
}

const targetUpdate = async () => {
  let dataNull = []
  let dataVerify = []
  let dataDelivery = []
  let dataForDelivery = []
  let dataDelivered = []
  let dataKitchen = []
  
  let pet = await searchParam({}, "order", 1000000000)
  pet.forEach((order) => {
    if (order.status == -1) dataNull.push(order)
    else if (order.status == 0) dataVerify.push(order)
    else if (order.status == 1) dataKitchen.push(order)
    else if (order.status == 2) dataDelivery.push(order)
    else if (order.status == 3) dataForDelivery.push(order)
    else if (order.status == 4) dataDelivered.push(order)

  })
  document.querySelector(".target_order_domicile_null").textContent = dataNull.length
  document.querySelector(".target_order_domicile_total").textContent = pet.length
  document.querySelector(".target_order_domicile_verify").textContent = dataVerify.length
  document.querySelector(".target_order_domicile_delivery").textContent = dataDelivery.length
  document.querySelector(".target_order_domicile_delivered").textContent = dataDelivered.length
  document.querySelector(".target_order_domicile_kitchen").textContent = dataKitchen.length



}
targetUpdate()