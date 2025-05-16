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
graphic1()
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
graphic2()

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

graphic3()

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

graphic4()

// iwqq zoci qlbx lrvs