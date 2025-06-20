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
document.getElementById('navbarDropdown').addEventListener('click', function () {
    if (typeof introJs !== 'undefined') {
        let intro = introJs();
        intro.setOptions({
            steps: [
                {
                    element: '.page-title',
                    intro: 'Esta es la sección de calendario, donde puedes gestionar eventos y reservaciones.',
                    position: 'bottom'
                },
                {
                    element: '#calendar-events',
                    intro: 'Aquí puedes ver los eventos y reservaciones disponibles. Puedes arrastrarlos al calendario.',
                    position: 'right'
                },
                {
                    element: '#calendar',
                    intro: 'Este es el calendario principal donde puedes visualizar y gestionar tus eventos y reservaciones.',
                    position: 'top'
                },
                {
                    element: '.fc-prev-button',
                    intro: 'Haz clic aquí para navegar al mes anterior en el calendario.',
                    position: 'bottom'
                },
                {
                    element: '.fc-next-button',
                    intro: 'Haz clic aquí para navegar al mes siguiente en el calendario.',
                    position: 'bottom'
                },
                {
                    element: '.fc-today-button',
                    intro: 'Haz clic aquí para volver al día actual en el calendario.',
                    position: 'bottom'
                },
                {
                    element: '.fc-month-button',
                    intro: 'Vista mensual del calendario. Útil para una visión general de los eventos.',
                    position: 'bottom'
                },
                {
                    element: '.fc-agendaWeek-button',
                    intro: 'Vista semanal del calendario. Útil para planificar eventos en detalle.',
                    position: 'bottom'
                },
                {
                    element: '.fc-agendaDay-button',
                    intro: 'Vista diaria del calendario. Útil para gestionar eventos específicos.',
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