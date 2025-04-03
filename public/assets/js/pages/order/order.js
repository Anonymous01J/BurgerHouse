    let table = $('.table-order-domicilio-pendientes').DataTable({
        language: {
            url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
        },
        "dom": 'tipr', 
        "paging": true,
        "info": true, 
    });

    let table2 = $('.table-order-domicilio-procesadas').DataTable({
        language: {
            url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
        },
        "dom": 'tipr', 
        "paging": true,
        "info": true, 
    });

    $('#searchBoxDomicilioPending').on('keyup', function() {
        table.search(this.value).draw();
    });
     $('#searchBoxDomicilioProcesadas').on('keyup', function() {
        table2.search(this.value).draw();
    });
