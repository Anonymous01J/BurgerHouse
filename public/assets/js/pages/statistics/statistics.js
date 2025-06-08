Chart.register(ChartDataLabels);
const graphic1 = () => {
    const ticketLabels = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
    const ticketData = [120, 150, 130, 170, 160, 180, 140];

    // 2. Configuración del dataset
    const datasetConfig = {
        label: 'Ticket Promedio ($)',
        data: ticketData,
        fill: false,                    // sin área bajo la línea
        borderWidth: 2,                 // grosor de la línea
        tension: 0.3,                   // suavizado de curvas (0.0 a 1.0) :contentReference[oaicite:0]{index=0}
        pointRadius: 4,                 // tamaño de los puntos
        borderColor: 'rgba(255, 75, 0)',
        backgroundColor: 'rgba(255, 75, 0)'
    };

    // 3. Opciones generales del gráfico
    const optionsConfig = {
        plugins: {
            title: {
                display: false,
            },
            tooltip: {
                enabled: false
            },
            legend: {
                display: false
            },
            datalabels: {
                display: true,           // muestra siempre las etiquetas :contentReference[oaicite:2]{index=2}
                anchor: 'end',           // posición (end, start, center) :contentReference[oaicite:3]{index=3}
                align: 'top',            // alineación con respecto al punto/barras :contentReference[oaicite:4]{index=4}
                color: 'rgba(255, 75, 0)',
                formatter: value => `$${value}`,  // formatea el valor con signo de peso
                font: {                   // opcional: estilo tipográfico
                    weight: 'bold',
                    size: 12,
                }
            },
        },
        scales: {
            x: {
                grid: {
                    display: false,
                },
                title: {
                    display: false,
                }
            },
            y: {
                beginAtZero: false,
                title: {
                    display: false,
                }
            },
        },
        legend: {
            display: false
        },
        layout: {
            padding: {
                top: 25,
                right: 15,
                bottom: 5,
                left: 0
            }
        }
    };

    // 4. Creación del gráfico
    const ctx = document.getElementById('ticketChart').getContext('2d');
    new Chart(ctx, { type: 'line', data: { labels: ticketLabels, datasets: [datasetConfig] }, options: optionsConfig });
}
const graphic2 = () => {
    const centerTextPlugin = {
        id: 'centerTextPlugin',
        beforeDraw(chart) {
            const { ctx, chartArea: { width, height, left, right, top, bottom } } = chart;
            ctx.save();
            ctx.font = 'bold 20px Arial';
            ctx.fillStyle = '#999';
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            const centerX = (left + right) / 2;
            const centerY = (top + bottom) / 2;
            ctx.fillText('Ventas', centerX, centerY);
            ctx.restore();
        }
    };

    const ctx = document.getElementById('myDonutChart').getContext('2d');

    const data = {
        labels: ['Delivery', 'Local'],
        datasets: [{
            label: 'Ventas',
            data: [2346, 2108],
            backgroundColor: ['#FF4B00', '#FFB200'],
            borderWidth: 2,
            borderColor: '#fff',
            cutout: '60%',
        }]
    };

    const total = data.datasets[0].data.reduce((a, b) => a + b, 0);

    const config = {
        type: 'doughnut',
        data: data,
        options: {
            plugins: {
                legend: { display: false },
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            const label = context.label || '';
                            const value = context.parsed || 0;
                            const percentage = ((value / total) * 100).toFixed(1);
                            return `${label}: $${value} (${percentage}%)`;
                        }
                    }
                },
                datalabels: {
                    color: '#fff',
                    font: { weight: 'bold', size: 16 },
                    formatter: function (value) {
                        return ((value / total) * 100).toFixed(1) + '%';
                    }
                }
            },
            cutout: '70%',
        },
        plugins: [ChartDataLabels, centerTextPlugin],
    };

    new Chart(ctx, config);
}
const graphic3 = () => {
    const franjasHorarias = ['10-12 AM', '12-2 PM', '2-4 PM', '4-6 PM', '6-8 PM', '8-10 PM'];
    const ocupacion = [65, 90, 50, 40, 85, 70];

    const ctx = document.getElementById('ocupacionChart').getContext('2d');

    const ocupacionChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: franjasHorarias,
            datasets: [{
                label: 'Tasa de ocupación (%)',
                data: ocupacion,
                backgroundColor: '#FF4B00',
                borderColor: '#FF4B00',
                borderWidth: 1,
                barPercentage: 0.9,
                categoryPercentage: 0.8,
                barThickness: 30
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    max: 100,
                    ticks: {
                        callback: function (value) { return value + '%'; }
                    },
                    title: {
                        display: false,
                        text: 'Porcentaje de ocupación'
                    }
                },
                x: {
                    title: {
                        display: false,
                        text: 'Franja horaria'
                    },
                    grid: {
                        display: false
                    }
                }
            },
            plugins: {
                legend: { display: false },
                tooltip: {
                    callbacks: {
                        label: ctx => `Ocupación: ${ctx.parsed.y}%`
                    }
                },
                datalabels: {
                    color: 'white',            // color del texto dentro de la barra
                    anchor: 'center',          // posición (center, end, start)
                    align: 'center',           // alineación del texto respecto barra
                    font: {
                        size: 12
                    },
                    formatter: value => `${value}%`
                }
            }
        }
    });
}
const graphic4 = () => {
    const franjasHorarias = ["Local y otros", "Pagina web"];
    const ocupacion = [65, 90];

    const ctx = document.getElementById('ReservasChart').getContext('2d');

    const ocupacionChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: franjasHorarias,
            datasets: [{
                label: 'Tasa de ocupación (%)',
                data: ocupacion,
                backgroundColor: '#FFB200',
                borderColor: '#FFB200',
                borderWidth: 1,
                barPercentage: 0.9,
                categoryPercentage: 0.8,
                barThickness: 30
            }]
        },
        options: {
            indexAxis: 'y',
            scales: {
                y: {
                    beginAtZero: true,
                    max: 100,
                    title: {
                        display: false,
                        text: 'Porcentaje de ocupación'
                    }
                },
                x: {
                    title: {
                        display: false,
                        text: 'Franja horaria'
                    },
                    grid: {
                        display: false
                    }
                }
            },
            plugins: {
                legend: { display: false },
                datalabels: {
                    color: 'white',            // color del texto dentro de la barra
                    anchor: 'center',          // posición (center, end, start)
                    align: 'center',           // alineación del texto respecto barra
                    font: {
                        size: 12
                    },
                    formatter: value => `${value}%`
                }
            }
        }
    });
}
const graphic5 = () => {
    const productos = ['Hamburguesa', 'Pizza', 'Papas', 'Refresco', 'Hot Dog'];
    const ventas = [120, 95, 200, 150, 80];

    const backgroundColors = [
        '#FF4B00',
        '#FFB200',
        '#AA7861',
        '#0B1B21',
        '#b41a1a'
    ];

    new Chart(document.getElementById('productMoreSales'), {
        type: 'pie',
        data: {
            labels: productos,
            datasets: [{
                data: ventas,
                backgroundColor: backgroundColors,
            }]
        },
        options: {
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    callbacks: {
                        label: ctx => `${ctx.label}: ${ctx.raw} `
                    }
                },
                datalabels: {
                    color: '#fff',
                    font: {
                        weight: 'bold',
                        size: 14
                    },
                    formatter: (value, ctx) => `${ctx.chart.data.labels[ctx.dataIndex]}: ${value}`
                }
            },
        },
        plugins: [ChartDataLabels]
    });


}
const graphic6 = () => {
    const productos = ['Hamburguesa', 'Pizza', 'Papas', 'Refresco', 'Hot Dog'];
    const ventas = [120, 95, 200, 150, 80];

    const backgroundColors = [
        '#FF4B00',
        '#FFB200',
        '#AA7861',
        '#0B1B21',
        '#b41a1a'
    ];

    new Chart(document.getElementById('productMinSales'), {
        type: 'pie',
        data: {
            labels: productos,
            datasets: [{
                data: ventas,
                backgroundColor: backgroundColors,
            }]
        },
        options: {
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    callbacks: {
                        label: ctx => `${ctx.label}: ${ctx.raw} `
                    }
                },
                datalabels: {
                    color: '#fff',
                    font: {
                        weight: 'bold',
                        size: 14
                    },
                    formatter: (value, ctx) => `${ctx.chart.data.labels[ctx.dataIndex]}: ${value}`
                }
            },
        },
        plugins: [ChartDataLabels]
    });


}

graphic1()
graphic2()
graphic3()
graphic4();
graphic5()
graphic6()
function exportarPDFReservas() {
    const canvas = document.getElementById('ocupacionChart');
    const imgData = canvas.toDataURL('image/png');
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    doc.setFontSize(12);
    doc.text(`FECHA: ${new Date().toLocaleDateString()}`, 165, 17);
    doc.setFontSize(25);
    doc.text(`Tasa de reservaciones Anuales`, 100, 30, { align: 'center' });

    doc.addImage(imgData, 'PNG', 50, 40, 110, 110); // Ajusta las coordenadas y dimensiones según sea necesario

    doc.setFontSize(12);
    const text = `La gráfica muestra la evolución anual de las reservaciones en el establecimiento, permitiendo identificar las horas de mayor afluencia. Esta información es clave para planificar personal, gestionar insumos y diseñar promociones que respondan a la demanda real del cliente.`;
    const additionalText = `Se puede observar que durante el año ${new Date().getFullYear()} el horario con más afluencia es a las 12-2PM y la menor afluencia es a las 4-6PM.`;
    const pageWidth = 180; // Define el ancho máximo de la página
    const marginLeft = 25; // Margen izquierdo
    const marginTop = 170; // Margen superior
    const lineHeight = 7; // Altura de línea

    const lines = doc.splitTextToSize(text, pageWidth - marginLeft); // Divide el texto en líneas ajustadas al ancho
    const additionalLines = doc.splitTextToSize(additionalText, pageWidth - marginLeft); // Divide el texto adicional en líneas ajustadas al ancho

    [...lines, ...additionalLines].forEach((line, index) => {
        doc.text(line, marginLeft, marginTop + index * lineHeight); // Dibuja cada línea con el salto correspondiente
    });

    // doc.save(`Porcentaje de reservacion por horario ${new Date().toLocaleDateString()}.pdf`);
    window.open(doc.output('bloburl'), '_blank');
}
document.getElementById("porcentajeReservacion").addEventListener("click", () => {
    exportarPDFReservas();
})
function exportarPDFReservasTasas() {
    const canvas = document.getElementById('ReservasChart');
    const imgData = canvas.toDataURL('image/png');
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    doc.setFontSize(12);
    doc.text(`FECHA: ${new Date().toLocaleDateString()}`, 165, 17);
    doc.setFontSize(25);
    doc.text(`Porcentaje de reservas por canales`, 100, 30, { align: 'center' });

    doc.addImage(imgData, 'PNG', 40, 40, 100, 80); // Ajusta las coordenadas y dimensiones según sea necesario

    doc.setFontSize(12);
    const text = `La gráfica muestra la evolución anual de las reservaciones en el establecimiento, destacando la preferencia de los clientes por distintos métodos de reserva. Al analizar los canales más utilizados, como reservas directas en el local, plataformas digitales o llamadas telefónicas, se obtiene información clave para optimizar la gestión del negocio. Esta información permite planificar el personal según la demanda, gestionar insumos de manera eficiente y diseñar promociones estratégicas que se alineen con los hábitos de reservación del cliente. Entender estas tendencias es fundamental para mejorar la experiencia del usuario y aumentar la efectividad operativa.`;
    const additionalText = `Se puede observar que durante el año ${new Date().getFullYear()} el metodo de reserva preferido por los clientes es a través de nuestra página web con un 90% de las reservas realizadas por dicho canal, dejando con un 65% el resto de metodos como ,directos en el local o a tráves de nuestro teléfono.`;
    const pageWidth = 180; // Define el ancho máximo de la página
    const marginLeft = 25; // Margen izquierdo
    const marginTop = 150; // Margen superior
    const lineHeight = 7; // Altura de línea

    const lines = doc.splitTextToSize(text, pageWidth - marginLeft); // Divide el texto en líneas ajustadas al ancho
    const additionalLines = doc.splitTextToSize(additionalText, pageWidth - marginLeft); // Divide el texto adicional en líneas ajustadas al ancho

    [...lines, ...additionalLines].forEach((line, index) => {
        doc.text(line, marginLeft, marginTop + index * lineHeight); // Dibuja cada línea con el salto correspondiente
    });

    // doc.save(`Porcentaje de reservas por canales ${new Date().toLocaleDateString()}.pdf`);
    window.open(doc.output('bloburl'), '_blank');
}
document.getElementById("canalesReservacion").addEventListener("click", () => {
    exportarPDFReservasTasas();
})
// IntroJs
document.getElementById('navbarDropdown').addEventListener('click', function () {
    if (typeof introJs !== 'undefined') {
        let intro = introJs();
        intro.setOptions({
            steps: [
                {
                    element: '.page-title',
                    intro: 'Esta es la sección de estadísticas, donde puedes analizar el rendimiento del restaurante.',
                    position: 'bottom'
                },
                {
                    element: '#ticketChart',
                    intro: 'Gráfica de gasto promedio por cliente. Aquí puedes observar el rendimiento semanal.',
                    position: 'top'
                },
                {
                    element: '#filter-ticketChart',
                    intro: 'Utiliza este filtro para cambiar el rango de fechas de la gráfica de Gasto Promedio.',
                    position: 'top'
                },
                {
                    element: '#pdf_net_income',
                    intro: 'Haz clic aquí para descargar un informe en PDF de las estadísticas actuales.',
                    position: 'left'
                },
                {
                    element: '#myDonutChart',
                    intro: 'Gráfica de ventas totales divididas entre Delivery y Local.',
                    position: 'top'
                },
                {
                    element: '#ocupacionChart',
                    intro: 'Gráfica de ocupación por horario. Muestra el porcentaje de mesas ocupadas en diferentes franjas horarias.',
                    position: 'top'
                },
                {
                    element: '#ReservasChart',
                    intro: 'Gráfica de reservas por canales. Identifica los métodos de reserva más utilizados por los clientes.',
                    position: 'top'
                },
                {
                    element: '#productMoreSales',
                    intro: 'Gráfica de productos más vendidos. Analiza los productos con mayor demanda.',
                    position: 'top'
                },
                {
                    element: '#productMinSales',
                    intro: 'Gráfica de productos menos vendidos. Identifica los productos con menor rendimiento.',
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

