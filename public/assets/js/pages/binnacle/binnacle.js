import functionGeneral from "../../Functions.js";
const { sessionInfo, binnacle, fecha, hora } = functionGeneral();
let session = await sessionInfo();

let table = $('.table_binnacle_user').DataTable({
    language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
    "order": [[0, "desc"]],
    ajax: {
        url: 'binnacle/get_all/0/10000000/id/asc',
        dataSrc: '',
        type: 'POST',
        data: { id_usuario: session.message.id },
    },
    columns: [
        { data: "id" },
        { data: 'descripcion' },
        { data: null, render: function (data, type, row) { return fecha(data.fecha) } },
        { data: null, render: function (data, type, row) { return hora(data.fecha) } },
    ],
    "dom": 'tipr',
    "paging": true,
    "info": true,
});

let table2 = $('.table_binnacle_system').DataTable({
    language: { url: './assets/libs/extra-libs/datatables.net/js/es-Es.json' },
    "order": [[0, "desc"]],
    ajax: {
        url: 'binnacle/get_all/0/10000000/id/asc',
        dataSrc: '',
        type: 'POST',
    },
    columns: [
        { data: "id" },
        { data: null, render: function (data, type, row) { return `<span class="badge text-bg-success badge-pill">${data.nombre_usuario + " " + data.apellido_usuario}</span>` } },
        { data: 'descripcion' },
        { data: null, render: function (data, type, row) { return fecha(data.fecha) } },
        { data: null, render: function (data, type, row) { return hora(data.fecha) } },
    ],
    "dom": 'tipr',
    "paging": true,
    "info": true,
});
$('#searchBinnacleUser').on('keyup', function () {
    table.search(this.value).draw();
});
$('#searchBinnacleSystem').on('keyup', function () {
    table2.search(this.value).draw();
});
// switch (key) {
//     case "additonal": "Adicionales"
//         break;
//     case "calendar": "Reservacion"
//         break;
//     case "capital": "Capital"
//         break;
//     case "category": "Categorias"
//         break;
//     case "cash": "Caja"
//         break;
//     case "clients": "Clientes"
//         break;
//     case "delivery": "Delivery"
//         break;
//     case "invoice": "Facturas"
//         break;
//     case "kitchen": "Cocina"
//         break;
//     case "login": "Inicio de sesion"
//         break;
//     case "orders": "Ordenes"
//         break;
//     case "paymentMethod": "Metodos de Pago"
//         break;
//     case "permission": "Permisos"
//         break;
//     case "productPrepared": "Productos Preparados"
//         break;
//     case "productProcess": "Productos Procesados"
//         break;
//     case "profile": "Perfil"
//         break;
//     case "raw-material": "Materia Prima"
//         break;
//     case "recipe": "Recetas"
//         break;
//     case "recover_password": "Recuperar Contraseña"
//         break;
//     case "statistics": "Estadisticas"
//         break;
//     case "supplier": "Proveedores"
//         break;
//     case "table": "Mesas"
//         break;
//     case "trash": "Papelera"
//         break;
//     case "unit": "Unidades"
//         break;
//     case "user": "Usuarios"
//         break;
//     default: none;
// }

const algo = async () => {
    let pet = await fetch(`binnacle/get_all/0/10000000/id/asc`);
    let response = await pet.json()
    console.log(response)
}
// algo()
// IntroJs
document.getElementById('navbarDropdown').addEventListener('click', function () {
    if (typeof introJs !== 'undefined') {
        let intro = introJs();
        intro.setOptions({
            steps: [
                {
                    element: '.page-title',
                    intro: 'Esta es la sección de bitácora, donde puedes consultar las actividades realizadas por los usuarios y el sistema.',
                    position: 'bottom'
                },
                {
                    element: '#home-tab',
                    intro: 'Aquí puedes ver tu actividad personal registrada en la bitácora.',
                    position: 'bottom'
                },
                {
                    element: '#profile-tab',
                    intro: 'Aquí puedes consultar las actividades registradas por el sistema.',
                    position: 'bottom'
                },
                {
                    element: '#searchBinnacleUser',
                    intro: 'Utiliza este cuadro de búsqueda para filtrar tu actividad en la bitácora.',
                    position: 'top'
                },
                {
                    element: '.table_binnacle_user',
                    intro: 'Tabla que muestra tu actividad registrada, incluyendo descripción, fecha y hora.',
                    position: 'top'
                },
            ],
            showBullets: true,
            exitOnOverlayClick: false,
            showProgress: true
        });
        intro.start();
    }
});