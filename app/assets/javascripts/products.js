$(document).ready(function() {
    let products = $('.temp_information').data('temp');
    productTam = products.length;
    let productsConverted = new Array();

    for (i = 0; i < productTam; i++) {
      productsConverted.push(
      	[products[i].name,products[i].quantity]
      	);
    }

    Highcharts.chart('container', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Quantidade de Produtos em Estoque'
        },
        subtitle: {
            text: 'Source: Inventory Towakai'
        },
        xAxis: {
            type: 'category',
            labels: {
                rotation: -45,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Quantidade'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'quantidade: <b>{point.y:.1f} unidades</b>'
        },
        series: [{
            name: 'Population',
            data: productsConverted,
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                format: '{point.y:.1f}', // one decimal
                y: 10, // 10 pixels down from the top
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        }]
    });

 });
