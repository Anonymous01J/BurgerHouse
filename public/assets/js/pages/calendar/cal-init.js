const calendarEl = document.getElementById('calendar');

const calendar = new FullCalendar.Calendar(calendarEl, {
    themeSystem: 'bootstrap5',
    locale: 'es',
    initialView: 'dayGridMonth', // vista mensual
    headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
    },
    events: [
        {
            title: 'Reunión',
            start: '2025-06-10',
            description: 'Reunión con el equipo'
        },
        {
            title: 'Entrega',
            start: '2025-06-12',
            end: '2025-06-13',
            color: '#dc3545'
        }
    ],
    buttonText: {
        prev: '<',
        next: '>'
    },
    eventClick: function (info) {
        Swal.fire({
            title: info.event.title,
            text: info.event.extendedProps.description || 'Sin descripción',
            icon: 'info'
        });
    },
    dateClick: function (info) {
        Swal.fire({
            title: 'Fecha seleccionada',
            text: `Has pulsado el día: ${info.dateStr}`,
            icon: 'info'
        });
    }
});

calendar.render();
setTimeout(() => { calendar.updateSize() }, 100);