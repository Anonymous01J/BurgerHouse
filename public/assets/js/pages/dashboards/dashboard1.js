$(function () {

    // ==============================================================
    // Campaign
    // ==============================================================

    let chart1 = c3.generate({
        bindto: '#campaign-v2',
        data: {
            columns: [
                ['Delivery', 25],
                ['Local', 15],
            ],

            type: 'donut',
            tooltip: {
                show: true
            }
        },
        donut: {
            label: {
                show: true
            },
            title: 'Ventas',
            width: 50
        },

        legend: {
            hide: true
        },
        color: {
            pattern: [
                '#5f76e8',
                '#ff4f70',
            ]
        }
    });

    d3.select('#campaign-v2 .c3-chart-arcs-title').style('font-family', 'Rubik');

    // ============================================================== 
    // income
    // ============================================================== 
    // Datos iniciales por defecto
    let data = {
        labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        series: [
            [5, 4, 1, 7, 5, 10, 5, 4, 3, 7, 5, 10]
        ]
    };

    let options = {
        axisX: {
            showGrid: false
        },
        seriesBarDistance: 0,
        chartPadding: {
            top: 15,
            right: 15,
            bottom: 5,
            left: 0
        },
        width: '100%',
        // plugins: [
        //     Chartist.plugins.tooltip()
        // ]
    };

    let responsiveOptions = [
        ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
                labelInterpolationFnc: function (value) {
                    return value[0];
                }
            }
        }]
    ];

    // Inicializa el gráfico
    let netIncome = new Chartist.Bar('.net-income', data, options, responsiveOptions);

    function inlineAllStyles(svg) {
        const computedStyle = window.getComputedStyle(svg);
        svg.setAttribute('style', computedStyle.cssText);
        svg.querySelectorAll('*').forEach(el => {
          const cs = window.getComputedStyle(el);
          el.setAttribute('style', cs.cssText);
        });
      }

      document.getElementById('pdf_net_income').addEventListener('click', async function() {
        const svgElement = document.querySelector('.net-income svg');
      
        if (!svgElement) {
          alert('No se encontró el gráfico SVG. Asegúrate de que Chartist haya renderizado el gráfico.');
          return;
        }
      
        // Llamamos a la función inlineAllStyles para inyectar todos los estilos en línea
        inlineAllStyles(svgElement);
      
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
      
        // Opciones de conversión (ajusta según sea necesario)
        const options = {
          x: 10,
          y: 10,
          width: svgElement.clientWidth * 0.75,
          height: svgElement.clientHeight * 0.75
        };
      
        try {
          // Llamada a svg2pdf para convertir el SVG al PDF
          await svg2pdf(svgElement, doc, options);
          doc.save("grafico_chartist.pdf");
        } catch (error) {
          console.error('Error al convertir el SVG a PDF:', error);
        }
      });
      
      


    netIncome.on('draw', function (data) {
        if (data.type === 'bar') {
            let barWidth = data.element.width ? data.element.width() : (data.x2 - data.x1);
            let barCenterX = data.x1 + barWidth / 2;
            let textY = data.value.y < 0 ? data.y2 - 125: data.y2 - 6;
            data.group.elem('text', {
                x: barCenterX,
                y: textY,
                style: 'text-anchor: middle; font-size: 12px; fill: #5f76e8; font-family: Rubik; font-weight: 500;'
            }, 'ct-bar-label').text(data.value.y + "$");
        }
    });
    generarResumen(data.series[0], data.labels);
    function getDataByYear(year) {
        let newData;
        if (year === "2020") {
            newData = {
                labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                series: [
                    [8, 3, 6, -5, 9, 4, 7, 2, 6, 8, 5, 7]
                ]
            };
        } else if (year === "2021") {
            newData = {
                labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                series: [
                    [6, 5, 4, 8, 10, 6, 5, 9, 4, 7, 3, 8]
                ]
            };
        } else {
            newData = data;
        }
        return newData;
    }
    function generarResumen(valores, labels) {
        const total = valores.reduce((a, b) => a + b, 0);
        const promedio = (total / valores.length).toFixed(1);
    
        const ordenados = [...valores].sort((a, b) => a - b);
        const mitad = Math.floor(ordenados.length / 2);
        const mediana = (ordenados.length % 2 === 0) ? ((ordenados[mitad - 1] + ordenados[mitad]) / 2).toFixed(1) : ordenados[mitad].toFixed(1);
    
        const frecuencia = {};
        valores.forEach(v => frecuencia[v] = (frecuencia[v] || 0) + 1);
        const maxFrecuencia = Math.max(...Object.values(frecuencia));
        const moda = Object.keys(frecuencia).filter(k => frecuencia[k] == maxFrecuencia);
    
        const max = Math.max(...valores);
        const min = Math.min(...valores);
        const mesMax = labels[valores.indexOf(max)];
        const mesMin = labels[valores.indexOf(min)];
    
        const arriba = valores.filter(v => v > promedio).length;
        const abajo = valores.length - arriba;

        const firstHalf = valores.slice(0, 6); // Primeros 6 meses
        const secondHalf = valores.slice(6);  // Últimos 6 meses
    
        const avgFirstHalf = firstHalf.reduce((acc, val) => acc + val, 0) / firstHalf.length;
        const avgSecondHalf = secondHalf.reduce((acc, val) => acc + val, 0) / secondHalf.length;
    
       document.querySelector(".mesMax").innerHTML = mesMax + " con " + max + "$";
       document.querySelector(".mesMin").innerHTML = mesMin + " con " + min + "$";
       document.querySelector(".promedio").innerHTML = promedio + "$";
       document.querySelector(".promedioS1").innerHTML = avgFirstHalf.toFixed(2)+"$"
       document.querySelector(".promedioS2").innerHTML = avgSecondHalf.toFixed(2)+"$"
    //    document.querySelector("#resumen-anual").innerHTML = textoTendenciaFinal;
    }
    document.getElementById('search_net_income').addEventListener('click', function () {
        let year = document.getElementById('year_net_income').value;
        if (!year) {
            alert("Por favor, ingresa un año.");
            return;
        }
        let newData = getDataByYear(year);
        netIncome.update(newData);
    
        generarResumen(newData.series[0], newData.labels);
    });

    






    // ==============================================================
    // Earning Stastics Chart
    // ==============================================================
    let chart = new Chartist.Line('.stats', {
        labels: ['Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab', 'Dom'],
        series: [
            [11, 10, 15, 21, 14, 23, 12]
        ]
    }, {
        low: 0,
        high: 28,
        showArea: true,
        fullWidth: true,
        plugins: [
            Chartist.plugins.tooltip()
        ],
        axisY: {
            onlyInteger: true,
            scaleMinSpace: 40,
            offset: 20,
            labelInterpolationFnc: function (value) {
                return (value / 1) + 'k';
            }
        },
    });

    // Offset x1 a tiny amount so that the straight stroke gets a bounding box
    chart.on('draw', function (ctx) {
        if (ctx.type === 'area') {
            ctx.element.attr({
                x1: ctx.x1 + 0.001
            });
        }
    });

    // Create the gradient definition on created event (always after chart re-render)
    chart.on('created', function (ctx) {
        let defs = ctx.svg.elem('defs');
        defs.elem('linearGradient', {
            id: 'gradient',
            x1: 0,
            y1: 1,
            x2: 0,
            y2: 0
        }).elem('stop', {
            offset: 0,
            'stop-color': 'rgba(255, 255, 255, 1)'
        }).parent().elem('stop', {
            offset: 1,
            'stop-color': 'rgba(80, 153, 255, 1)'
        });
    });

    $(window).on('resize', function () {
        chart.update();
    });
})