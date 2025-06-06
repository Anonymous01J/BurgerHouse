import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js"
import orderDomicile from "./order_domicile.js";
const { searchParam, fecha, hora, sessionInfo, binnacle } = functionGeneral()
let session = await sessionInfo();
//tables de domicilio 
let tableOrderDomicileoPendings = $('.table-order-domicilio-pendientes').DataTable({
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  "order": [[0, "desc"]],
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: '',
    type: 'POST',
    data: { status: 0, tipo: "delivery" },
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
      btn.addEventListener("click", async () => actionOrder(btn, 1))
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
    data: { status: 4, tipo: "delivery" },
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
    data: { status: -1, tipo: "delivery" },
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
$('#searchBoxDomicilioPending').on('keyup', function () { tableOrderDomicileoPendings.search(this.value).draw(); });
$('#searchBoxDomicilioProcesadas').on('keyup', function () { tableOrderDomicileProcess.search(this.value).draw(); });
$('#searchBoxDomicilioNull').on('keyup', function () { tableOrderDomicileNull.search(this.value).draw(); });

//tables para llevar
let tableOrderParaLlevarPendingsVeryfy = $('.table-order-llevar-pendientes').DataTable({
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  "order": [[0, "desc"]],
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: '',
    type: 'POST',
    data: { status: 0, tipo: "llevar" },
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
      btn.addEventListener("click", async () => actionOrder(btn, 1))
    })
  },
  "dom": 'tipr',
  "paging": true,
  "info": true,
});
let tableOrderParaLlevarProcess = $('.table-order-llevar-procesadas').DataTable({
  "order": [[0, "desc"]],
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: '',
    type: 'POST',
    data: { status: 4, tipo: "llevar" },
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
  },
  "dom": 'tipr',
  "paging": true,
  "info": true,
});
let tableOrderParaLlevarNull = $('.table-order-llevar-anuladas').DataTable({
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  "order": [[0, "desc"]],
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: '',
    type: 'POST',
    data: { status: -1, tipo: "llevar" },
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
let tableOrderParaLlevarPorDespachar = $('.table-order-llevar-pordespachar').DataTable({
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  "order": [[0, "desc"]],
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: '',
    type: 'POST',
    data: { status: 3, tipo: "llevar" },
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
           <button nro_orden="${data.nro_orden}" id_order="${data.id}" type_action="sale_order" class="btn bh_1 rounded-circle btn-circle sale_order" data-bs-toggle="tooltip" data-bs-title="Entregar orden" data-bs-placement="top">
              <i data-feather="check-circle" class="text-white"></i>
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
    document.querySelectorAll(".sale_order").forEach((btn) => {
      let tooltip = new bootstrap.Tooltip(btn)
      btn.addEventListener("click", async () => actionOrder(btn, 4))
    })
  },
  "dom": 'tipr',
  "paging": true,
  "info": true,
});
$('#searchBoxLLevarPending').on('keyup', function () { tableOrderParaLlevarPendingsVeryfy.search(this.value).draw(); });
$('#searchBoxLLevarPorDespachar').on('keyup', function () { tableOrderParaLlevarPorDespachar.search(this.value).draw(); });
$('#searchBoxllevarProcesadas').on('keyup', function () { tableOrderParaLlevarProcess.search(this.value).draw(); });
$('#searchBoxllevarAnuladas').on('keyup', function () { tableOrderParaLlevarNull.search(this.value).draw(); });

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
const actionOrder = (btn, status) => {
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
        data.append("status", status);
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
            tableOrderParaLlevarNull.ajax.reload();
            tableOrderParaLlevarPendingsVeryfy.ajax.reload();
            tableOrderParaLlevarPorDespachar.ajax.reload();
            tableOrderParaLlevarProcess.ajax.reload();
            tableOrderDomicileNull.ajax.reload();
            tableOrderDomicileProcess.ajax.reload();
            tableOrderDomicileoPendings.ajax.reload();
            targetUpdate("delivery")
            targetUpdate("llevar")
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
  } else if (action == "sale_order") {
    Swal.fire({
      title: "¿Deseas entregar esta orden?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Si, entregar",
      cancelButtonText: "Cancelar",
      confirmButtonColor: "#FF4B00",
    }).then(async (result) => {
      if (result.isConfirmed) {
        let id_order = btn.getAttribute("id_order");
        data.append("id", id_order);
        data.append("status", status);
        let pet = await fetch(`order/update`, { method: "POST", body: data });
        let response = await pet.json();
        if (response.success) {
          if (response.success == true) {
            Swal.fire({
              title: `Exito!`,
              text: "La orden se entrego correctamente",
              icon: "success",
            });
            binnacle(session.message.id, "orden", "Actualizacion", `Se entrego la orden ${btn.getAttribute("nro_orden")}`);
            tableOrderParaLlevarNull.ajax.reload();
            tableOrderParaLlevarPendingsVeryfy.ajax.reload();
            tableOrderParaLlevarPorDespachar.ajax.reload();
            tableOrderParaLlevarProcess.ajax.reload();
            targetUpdate("delivery")
            targetUpdate("llevar")
          } else {
            Swal.fire({
              title: `Error!`,
              text: "La orden no fue entregada",
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
            tableOrderParaLlevarNull.ajax.reload();
            tableOrderParaLlevarPendingsVeryfy.ajax.reload();
            tableOrderParaLlevarPorDespachar.ajax.reload();
            tableOrderParaLlevarProcess.ajax.reload();
            tableOrderDomicileNull.ajax.reload();
            tableOrderDomicileProcess.ajax.reload();
            tableOrderDomicileoPendings.ajax.reload();
            targetUpdate("delivery")
            targetUpdate("llevar")
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
const targetUpdate = async (type) => {
  let dataNull = []
  let dataVerify = []
  let dataDelivery = []
  let dataForDelivery = []
  let dataDelivered = []
  let dataKitchen = []

  let pet = await searchParam({ tipo: type }, "order", 1000000000)
  pet.forEach((order) => {
    if (order.status == -1) dataNull.push(order)
    else if (order.status == 0 && order.tipo == type) dataVerify.push(order)
    else if (order.status == 1 && order.tipo == type) dataKitchen.push(order)
    else if (order.status == 2 && order.tipo == type) dataDelivery.push(order)
    else if (order.status == 3 && order.tipo == type) dataForDelivery.push(order)
    else if (order.status == 4 && order.tipo == type) dataDelivered.push(order)
  })
  document.querySelector(`.target_order_${type}_null`).textContent = dataNull.length
  document.querySelector(`.target_order_${type}_total`).textContent = pet.length
  document.querySelector(`.target_order_${type}_verify`).textContent = dataVerify.length
  if (type == "llevar") document.querySelector(`.target_order_${type}_delivery`).textContent = dataForDelivery.length
  else document.querySelector(`.target_order_${type}_delivery`).textContent = dataDelivery.length
  document.querySelector(`.target_order_${type}_delivered`).textContent = dataDelivered.length
  document.querySelector(`.target_order_${type}_kitchen`).textContent = dataKitchen.length
}
targetUpdate("delivery")
targetUpdate("llevar")

document.querySelectorAll(".btnOrder").forEach((btn) => {
  btn.addEventListener("click", (e) => {
    orderDomicile(functionGeneral, Templates, btn.getAttribute("type_order"))
    bootstrap.Modal.getOrCreateInstance('#domicile').show()
  })
})