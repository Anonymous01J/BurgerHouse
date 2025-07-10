import functionGeneral from "../../Functions.js";
import Templates from "../../templates.js"
import domicile_and_takeaway from "./domicile_and_takeaway.js";
import { local, more_product_local_order, payOrder } from "./local.js";
import { report, invoice } from "./report.js"
const { searchParam, fecha, hora, sessionInfo, binnacle, resetForm, permission, amountDolar } = functionGeneral()
let session = await sessionInfo();
permission("Ordenes (llevar)")
permission("Ordenes (delivery)", () => {
  for (const element of document.getElementById('nav-tabContent').children) {
    let idTab = element.id
    if (idTab == (document.getElementById('nav-tab').firstElementChild.id).replace("-tab", "")) {
      element.classList.add("show", "active")
    }
  }
})
//tables de domicilio 
let tableOrderDomicileoPendings = $('.table-order-domicilio-pendientes').DataTable({
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  "order": [[0, "desc"]],
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: '',
    type: 'POST',
    data: { status: "por verificar", tipo: "delivery" },
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
           <button nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-verify="Ordenes (delivery)" type_action="verify_orden" class="btn bh_1 rounded-circle btn-circle" data-bs-toggle="tooltip" data-bs-title="Orden Verificada" data-bs-placement="top">
              <i data-feather="check-circle" class="text-white"></i>
            </button>
            <button nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-null="Ordenes (delivery)" type_action="null_order" class="btn bh_5 rounded-circle btn-circle" data-bs-toggle="tooltip" data-bs-title="Anular Orden" data-bs-placement="top">
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
      btn.addEventListener("click", async () => actionOrder(btn, "en cocina"))
    })
    permission("Ordenes (delivery)")
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
    data: { status: "entregada", tipo: "delivery" },
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
    data: { status: "anulada", tipo: "delivery" },
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
    dataSrc: function (json) {
      let tableOrderLlevarPendingsVeryfy = []
      json.forEach(element => {
        if ((element.status != "entregada" && element.status != "anulada") && element.tipo == "llevar") tableOrderLlevarPendingsVeryfy.push(element)
      });
      return tableOrderLlevarPendingsVeryfy
    },
    type: 'POST',
  },
  columns: [
    {
      data: null, render: function (data) {
        let estado = data.status
        let width = 0
        let bg = "bh_1"
        if (estado == "en cocina") width = 33.33
        else if (estado == "en preparacion") width = 66.66
        else if (estado == "para despachar") { width = 100; bg = "bg-success" }
        else if (estado == "por verificar") { width = 100; bg = "bh_2" }
        else { width = 100; bg = "bg-secondary" }
        return `
      <div class="progress" role="progressbar" aria-label="Example with label" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
        <div class="progress-bar progress-bar-striped progress-bar-animated ${bg}" style="width: ${width}%">${estado}</div>
      </div>
      
      ` }
    },
    { data: 'nro_orden' },
    { data: null, render: function (data) { return data.cliente_nombre + " " + data.cliente_apellido } },
    { data: null, render: function (data) { return fecha(data.fecha) } },
    { data: null, render: function (data) { return hora(data.fecha) } },
    {
      data: null,
      orderable: false,
      render: function (data, type, row, meta) {
        let btnVerify = `<li><a nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-verify="Ordenes (llevar)" type_action="verify_orden" class="dropdown-item d-flex gap-2"><i data-feather="check"></i>Verificar Orden</a></li>`
        let btnNull = ` <li><a nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-null="Ordenes (llevar)" type_action="null_order" class="dropdown-item d-flex gap-2"><i data-feather="x"></i>Anular orden</a></li>`
        return `
            <div class="dropdown dropstart">
                <i data-feather="more-horizontal" data-bs-toggle="dropdown" aria-expanded="false" style="cursor: pointer"></i>
                <ul class="dropdown-menu" data-bs-boundary="viewport">
                    ${data.status == "por verificar" ? btnVerify : ""}
                    <li><a nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-printOrder="Ordenes (llevar)" type_action="print_order" class="dropdown-item d-flex gap-2"><i data-feather="file-text"></i>Imprimir cuenta</a></li>
                    ${data.status == "por verificar" ? btnNull : ""}
                    <li><a nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-DeliverOrder="Ordenes (llevar)" type_action="sale_order" type="entregar" class="dropdown-item d-flex gap-2"><i data-feather="corner-down-right"></i>Entregar</a></li>
                    <li><a type_action="details" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" class="dropdown-item d-flex gap-2 reference_btn"><i data-feather="info"></i>Detalles</a></li>
                    <li><a type_action="payment" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" class="dropdown-item d-flex gap-2 reference_btn"><i data-feather="credit-card"></i>Detalles de pago</a></li>
                </ul>
            </div>
          `;
      }
    }
  ],
  drawCallback: function (settings) {
    feather.replace();
    document.querySelectorAll(".reference_btn").forEach((btn) => {
      btn.addEventListener("click", () => detailOrder(btn))
    })
    document.querySelectorAll(".dropdown-item").forEach((btn) => {
      if (!btn.dataset.listenerAttached) {
        btn.addEventListener("click", async () => actionOrder(btn, "entregada"))
        btn.dataset.listenerAttached = "true";
      }
    })
    permission("Ordenes (llevar)")
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
    data: { status: "entregada", tipo: "llevar" },
  },
  columns: [
    {
      data: null, render: function (data, type, row, meta) {
        return `<div class="progress" role="progressbar" aria-label="Example with label" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
        <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width: 100%">${row.status}</div>
      </div>`
      }
    },
    { data: 'nro_orden' },
    { data: null, render: function (data) { return data.cliente_nombre + " " + data.cliente_apellido } },
    { data: null, render: function (data) { return fecha(data.fecha) } },
    { data: null, render: function (data) { return hora(data.fecha) } },
    {
      data: null,
      orderable: false,
      render: function (data, type, row, meta) {
        return `
            <div class="dropdown dropstart">
                <i data-feather="more-horizontal" data-bs-toggle="dropdown" aria-expanded="false" style="cursor: pointer"></i>
                <ul class="dropdown-menu" data-bs-boundary="viewport">
                    <li><a nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-printOrder="Ordenes (llevar)" type_action="print_order" class="dropdown-item d-flex gap-2"><i data-feather="file-text"></i>Imprimir cuenta</a></li>
                    <li><a type_action="details" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" class="dropdown-item d-flex gap-2 reference_btn"><i data-feather="info"></i>Detalles</a></li>
                    <li><a type_action="payment" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" class="dropdown-item d-flex gap-2 reference_btn"><i data-feather="credit-card"></i>Detalles de pago</a></li>
                </ul>
            </div>
          `;
      }
    }
  ],
  drawCallback: function (settings) {
    feather.replace();
    document.querySelectorAll(".reference_btn").forEach((btn) => {
      btn.addEventListener("click", () => detailOrder(btn))
    })
    document.querySelectorAll(".dropdown-item").forEach((btn) => {

      if (!btn.dataset.listenerAttached) {
        btn.addEventListener("click", async () => actionOrder(btn, "entregada"))
        btn.dataset.listenerAttached = "true";
      }

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
    data: { status: "anulada", tipo: "llevar" },
  },
  columns: [
    {
      data: null, render: function (data, type, row, meta) {
        return `<div class="progress" role="progressbar" aria-label="Example with label" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
        <div class="progress-bar progress-bar-striped progress-bar-animated bg-secondary" style="width: 100%">${row.status}</div>
      </div>`
      }
    },
    { data: 'nro_orden' },
    { data: null, render: function (data) { return data.cliente_nombre + " " + data.cliente_apellido } },
    { data: null, render: function (data) { return fecha(data.fecha) } },
    { data: null, render: function (data) { return hora(data.fecha) } },
    {
      data: null,
      orderable: false,
      render: function (data, type, row, meta) {
        return `
            <div class="dropdown dropstart">
                <i data-feather="more-horizontal" data-bs-toggle="dropdown" aria-expanded="false" style="cursor: pointer"></i>
                <ul class="dropdown-menu" data-bs-boundary="viewport">
                    <li><a type_action="details" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" class="dropdown-item d-flex gap-2 reference_btn"><i data-feather="info"></i>Detalles</a></li>
                    <li><a type_action="payment" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" class="dropdown-item d-flex gap-2 reference_btn"><i data-feather="credit-card"></i>Detalles de pago</a></li>
                </ul>
            </div>
          `;
      }
    }
  ],
  drawCallback: function (settings) {
    feather.replace();
    document.querySelectorAll(".reference_btn").forEach((btn) => {
      if (!btn.dataset.listenerAttached) {
        btn.addEventListener("click", () => detailOrder(btn))
        btn.dataset.listenerAttached = "true";
      }
    })
  },
  "dom": 'tipr',
  "paging": true,
  "info": true,
});
$('#searchBoxLLevarPending').on('keyup', function () { tableOrderParaLlevarPendingsVeryfy.search(this.value).draw(); });
$('#searchBoxllevarProcesadas').on('keyup', function () { tableOrderParaLlevarProcess.search(this.value).draw(); });
$('#searchBoxllevarAnuladas').on('keyup', function () { tableOrderParaLlevarNull.search(this.value).draw(); });

//tables local
let tableOrderLocalPendingsVeryfy = $('.table-order-local-pendientes').DataTable({
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  "order": [[0, "desc"]],
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: function (json) {
      let tableOrderLocalPendingsVeryfy = []
      json.forEach(element => {
        if (element.status != "entregada" && element.tipo == "local") tableOrderLocalPendingsVeryfy.push(element)
      });
      return tableOrderLocalPendingsVeryfy
    },
    type: 'POST',
  },
  columns: [
    {
      data: null, render: function (data) {
        let estado = data.status
        let width = 0
        if (estado == "en cocina") width = 33.33
        else if (estado == "en preparacion") width = 66.66
        else if (estado == "por despachar") width = 100
        else width = 100
        return `
      <div class="progress" role="progressbar" aria-label="Example with label" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
        <div class="progress-bar progress-bar-striped progress-bar-animated ${width == 100 ? "bg-success" : "bh_1"}" style="width: ${width}%">${estado}</div>
      </div>
      
      ` }
    },
    { data: 'nro_orden' },
    { data: null, render: function (data) { return fecha(data.fecha) } },
    { data: null, render: function (data) { return hora(data.fecha) } },
    {
      data: null,
      orderable: false,
      render: function (data, type, row, meta) {
        return `
            <div class="dropstart">
                <i data-feather="more-horizontal" data-bs-toggle="dropdown" aria-expanded="false" style="cursor: pointer"></i>
                <ul class="dropdown-menu">
                    <li><a nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-moreProducts="Ordenes (local)" type_action="more_products" class="dropdown-item d-flex gap-2"><i data-feather="plus"></i>Agregar productos</a></li>
                    <li><a nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-printOrder="Ordenes (local)" type_action="print_order" class="dropdown-item d-flex gap-2"><i data-feather="file-text"></i>Imprimir cuenta</a></li>
                    <li><a nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-PayOrder="Ordenes (local)" type_action="pay_order" class="dropdown-item d-flex gap-2"><i data-feather="credit-card"></i>Pagar</a></li>
                    <li><a nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-DeliverOrder="Ordenes (local)" type_action="sale_order" type="mesa" class="dropdown-item d-flex gap-2"><i data-feather="corner-down-right"></i>Entregar</a></li>
                    <li><a type_action="details" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" class="dropdown-item d-flex gap-2 reference_btn"><i data-feather="info"></i>Detalles</a></li>
                </ul>
            </div>
          `;
      }
    }
  ],
  drawCallback: function (settings) {
    feather.replace();
    document.querySelectorAll(".reference_btn").forEach((btn) => {
      btn.addEventListener("click", () => detailOrder(btn))
    })
    document.querySelectorAll(".dropdown-item").forEach((btn) => {
      if (!btn.dataset.listenerAttached) {
        btn.addEventListener("click", async () => actionOrder(btn, "en mesa"))
        btn.dataset.listenerAttached = true
      }
    })
    // permission("Ordenes (llevar)")

  },
  "dom": 'tipr',
  "paging": true,
  "info": true,
});
let tableOrderLocalProcess = $('.table-order-local-procesadas').DataTable({
  "order": [[0, "desc"]],
  language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
  ajax: {
    url: 'order/get_all/0/10000000/id/asc',
    dataSrc: '',
    type: 'POST',
    data: { status: "entregada", tipo: "local" },
  },
  columns: [
    {
      data: null, render: function (data) {
        return `
      <div class="progress" role="progressbar" aria-label="Example with label" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
        <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width:100%">${data.status}</div>
      </div>
      
      ` }
    },
    { data: 'nro_orden' },
    { data: null, render: function (data) { return data.cliente_nombre + " " + data.cliente_apellido } },
    { data: null, render: function (data) { return fecha(data.fecha) } },
    { data: null, render: function (data) { return hora(data.fecha) } },
    {
      data: null,
      orderable: false,
      render: function (data, type, row, meta) {
        return `
            <div class="dropstart">
                <i data-feather="more-horizontal" data-bs-toggle="dropdown" aria-expanded="false" style="cursor: pointer"></i>
                <ul class="dropdown-menu">
                    <li><a nro_orden="${data.nro_orden}" id_order="${data.id}" data-module-printOrder="Ordenes (local)" type_action="print_order" class="dropdown-item d-flex gap-2"><i data-feather="file-text"></i>Imprimir cuenta</a></li>
                    <li><a type_action="details" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" class="dropdown-item d-flex gap-2 reference_btn"><i data-feather="info"></i>Detalles</a></li>
                    <li><a type_action="payment" data-id_order="${data.id}" data_id_sale="${data.id_venta}" style="cursor: pointer" class="dropdown-item d-flex gap-2 reference_btn"><i data-feather="info"></i>Detalles de pago</a></li>
                </ul>
            </div>
          `;
      }
    }
  ],
  drawCallback: function (settings) {
    feather.replace();
    document.querySelectorAll(".reference_btn").forEach((btn) => {
      btn.addEventListener("click", () => detailOrder(btn))
    })
    document.querySelectorAll(".dropdown-item").forEach((btn) => {
      if (!btn.dataset.listenerAttached) {
        btn.addEventListener("click", async () => actionOrder(btn, "en mesa"))
        btn.dataset.listenerAttached = true
      }
    })
  },
  "dom": 'tipr',
  "paging": true,
  "info": true,
});

window.stepper = new Stepper(document.querySelector('#stepper'), { linear: true, animation: true });
window.stepper2 = new Stepper(document.querySelector('#stepper-2'), { linear: true, animation: true });
window.stepper3 = new Stepper(document.querySelector('#stepper-3'), { linear: true, animation: true });
window.stepper4 = new Stepper(document.querySelector('#stepper-4'), { linear: true, animation: true });

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
    let group = {}
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
      if (!group[productProcess.id_producto]) group[productProcess.id_producto] = productProcess
      else group[productProcess.id_producto] = { ...group[productProcess.id_producto], cantidad: parseInt(group[productProcess.id_producto].cantidad) + parseInt(productProcess.cantidad) }
    })
    group = Object.entries(group).map(([key, value]) => ({ id_producto: key, ...value }));
    group.forEach((productProcess) => {
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
    let pet = await fetch("paymentSale/get_all/0/10000000/id/asc", { method: "POST", body: data })
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
const actionOrder = async (btn, status) => {
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
        data.append("status", "en cocina");
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
    let id_order = btn.getAttribute("id_order");
    let dataVerify = new FormData();
    dataVerify.append("id", id_order);
    let petVerify = await fetch(`order/get_all`, { method: "POST", body: dataVerify });
    let resVerify = await petVerify.json();
    if (resVerify[0].status == "en preparacion" || resVerify[0].status == "en cocina" || resVerify[0].status == "por verificar" || resVerify[0].status == "anulado") {
      Swal.fire({
        title: `Error!`,
        text: "La orden se encuentra en preparacion",
        icon: "error",
      });
    } else {
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
          if (response.success == true) {
            Swal.fire({
              title: `Exito!`,
              text: "La orden se entrego correctamente",
              icon: "success",
            });
            if (btn.getAttribute("type") == "mesa") {
              binnacle(session.message.id, "orden", "Actualizacion", `Se entrego la orden ${btn.getAttribute("nro_orden")} a su mesa`);
            } else {
              binnacle(session.message.id, "orden", "Actualizacion", `Se despacho la orden ${btn.getAttribute("nro_orden")}`);
            }
            tableOrderParaLlevarNull.ajax.reload();
            tableOrderParaLlevarPendingsVeryfy.ajax.reload();
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
      });
    }
  } else if (action == "print_order") {
    let id = btn.getAttribute('id_order')
    let info = await searchParam({ id: id }, "order")
    let detailsPrepered = await searchParam({ id_orden: id }, "Detalle_orden_producto_preparado")
    let detailsProcess = await searchParam({ id_orden: id }, "Detalle_orden_producto_procesado")
    console.log(detailsPrepered);
    let totalAmountPrepared = detailsPrepered.map(item => item.precio * item.cantidad).reduce((a, b) => a + b, 0)
    let totalAmountProcess = detailsProcess.map(item => item.precio * item.cantidad).reduce((a, b) => a + b, 0)
    let iva = (totalAmountPrepared + totalAmountProcess) * 0.16
    let clientData = {
      id_cliente: info[0].id_cliente ?? "POR ASIGNAR",
      nameClient: (info[0].cliente_nombre + " " + info[0].cliente_apellido) ?? "POR ASIGNAR",
      telefonoClient: info[0].cliente_telefono ?? "POR ASIGNAR"
    };
    let amountTotal = {
      total_dolares: "TOTAL: " + (((totalAmountPrepared + totalAmountProcess) + iva).toFixed(2)),
      total_bs: (((totalAmountPrepared + totalAmountProcess) + iva) * await amountDolar()).toFixed(2),
      subtotal: "SUBTOTAL: " + ((totalAmountPrepared + totalAmountProcess).toFixed(2)),
      iva: "IVA: " + (iva.toFixed(2))
    }
    invoice(detailsPrepered, detailsProcess, clientData, info[0].id, info[0].direccion ?? "BURGER HOUSE", amountTotal)
  } else if (action == "more_products") {
    window.id_orden = btn.getAttribute("id_order");
    more_product_local_order(functionGeneral, Templates)
    bootstrap.Modal.getOrCreateInstance('#more_products').show()
  } else if (action == "null_order") {
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
        data.append("status", "anulada");
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
  } else if (action == "pay_order") {
    payOrder(functionGeneral, Templates, btn.getAttribute("id_order"))
    bootstrap.Modal.getOrCreateInstance('#payment_order_local').show()
  }
}
const targetUpdate = async (type) => {
  let dataNull = []
  let dataVerify = []
  let dataDelivery = []
  let dataForDelivery = []
  let dataDelivered = []
  let dataKitchen = []
  let dataDispatched = []

  let pet = await searchParam({ tipo: type }, "order", 1000000000)
  pet.forEach((order) => {
    if (order.status == "anulada") dataNull.push(order)
    else if (order.status == "por verificar" && order.tipo == type) dataVerify.push(order)
    else if (order.status == "en cocina" && order.tipo == type) dataKitchen.push(order)
    else if (order.status == "en delivery" && order.tipo == type) dataDelivery.push(order)
    else if (order.status == "en camino" && order.tipo == type) dataForDelivery.push(order)
    else if (order.status == "entregada" && order.tipo == type) dataDelivered.push(order)
    else dataDispatched.push(order)
  })
  document.querySelector(`.target_order_${type}_null`).textContent = dataNull.length
  document.querySelector(`.target_order_${type}_total`).textContent = pet.length
  document.querySelector(`.target_order_${type}_verify`).textContent = dataVerify.length
  if (type == "llevar") document.querySelector(`.target_order_${type}_delivery`).textContent = dataDispatched.length
  else document.querySelector(`.target_order_${type}_delivery`).textContent = dataDelivery.length
  document.querySelector(`.target_order_${type}_delivered`).textContent = dataDelivered.length
  document.querySelector(`.target_order_${type}_kitchen`).textContent = dataKitchen.length
}
targetUpdate("delivery")
targetUpdate("llevar")
const resetFormModal = () => {
  document.querySelector(".cont-select-product-order").innerHTML = ""
  const container = document.querySelector(".cont_category_product_orders");
  container.innerHTML = container.children[0].outerHTML
  document.querySelector(".target_client_order").innerHTML = ""
  document.querySelector(".loader_client_order").querySelector("h3").classList.remove("d-none")
  document.querySelector(".target_client_order").classList.add("d-none")
  document.querySelector(".loader_client_order").querySelector(".loader").classList.add("d-none")
  document.getElementById('form-search-client-order').reset()
  document.querySelector(".direction_sale").value = ""
  resetForm(".payments", document.getElementById("form-submit-payment"))
}
document.querySelectorAll(".btnOrder").forEach((btn) => {
  // if (!btn.dataset.listenerAttached) {
  btn.addEventListener("click", (e) => {
    window.type_order = btn.getAttribute("type_order")
    stepper.to(0)
    domicile_and_takeaway(functionGeneral, Templates, invoice, () => targetUpdate(btn.getAttribute("type_order")))
    resetFormModal()
    setTimeout(() => { bootstrap.Modal.getOrCreateInstance('#domicile_and_takeaway').show() }, 300)
  })
  // btn.dataset.listenerAttached = "true";
  // }
})
document.querySelector(".btn_order_local").addEventListener("click", () => {
  local(functionGeneral, Templates)
})
// IntroJs
document.getElementById('navbarDropdown').addEventListener('click', function () {
  if (typeof introJs !== 'undefined') {
    let intro = introJs();
    intro.setOptions({
      steps: [
        {
          element: document.querySelector('.page-wrapper'),
          intro: 'Bienvenido a la seccion de ordenes a domicilio, para llevar y del local, aqui podras gestionar todas las ordenes de tu negocio.',
          position: 'bottom'
        },
        {
          element: document.querySelector('#nav-domicilio-tab'),
          intro: 'Aqui podras ver todas las ordenes a domicilio, puedes filtrar por estado.',
          position: 'bottom'
        },
        {
          element: document.querySelector('#nav-llevar-tab'),
          intro: 'Aqui podras ver todas las ordenes para llevar, puedes filtrar por estado.',
          position: 'bottom'
        },
        {
          element: document.querySelector('#nav-local-tab'),
          intro: 'Aqui podras ver todas las ordenes locales, puedes filtrar por estado.',
          position: 'bottom'
        },
        {
          element: document.querySelector('.target_order_delivery_null'),
          intro: 'Ordenes anuladas a domicilio',
          position: 'bottom'
        },
        {
          element: document.querySelector('.target_order_delivery_total'),
          intro: 'Total de ordenes a domicilio',
          position: 'bottom'
        },
        {
          element: document.querySelector('.target_order_delivery_verify'),
          intro: 'Ordenes a domicilio por verificar',
          position: 'bottom'
        },
        {
          element: document.querySelector('.target_order_delivery_kitchen'),
          intro: 'Ordenes para llevar en cocina',
          position: 'bottom'
        },
        {
          element: document.querySelector('.target_order_delivery_delivery'),
          intro: 'Ordenes a domicilio en proceso de entrega',
          position: 'bottom'
        },
        {
          element: document.querySelector('.target_order_delivery_delivered'),
          intro: 'Ordenes a domicilio entregadas',
          position: 'bottom'
        },
        {
          element: document.querySelector('.btnOrder'),
          intro: 'Generar una nueva orden a domicilio.',
          position: 'bottom'
        },
        {
          element: document.querySelector('#home-tab'),
          intro: 'Ordenes a domicilio por verificar ',
          position: 'bottom'
        },
        {
          element: document.querySelector('#profile-tab'),
          intro: 'Ordenes a domicilio en proceso',
          position: 'bottom'
        },
        {
          element: document.querySelector('#null_order'),
          intro: 'Ordenes a domicilio anuladas',
          position: 'bottom'
        },
        {
          element: '#searchBoxDomicilioPending',
          intro: 'Utiliza este cuadro de búsqueda para filtrar las órdenes pendientes a domicilio.',
          position: 'bottom'
        },
        {
          element: document.querySelector('.table-order-domicilio-pendientes'),
          intro: 'Tabla de ordenes a domicilio pendientes, puedes ver el detalle de la orden, los datos del pago y verificar o anular la orden.',
          position: 'bottom'
        }

      ],
      showBullets: true,
      exitOnOverlayClick: false,
      showProgress: true
    });
    intro.start();
  }
});