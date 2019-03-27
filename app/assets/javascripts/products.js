$(document).ready(function() {
    let products = $('.temp_information').data('temp');
    let names = new Array();
    let quantities = new Array();
    productTam = products.length;
    let productsConverted = new Array();

    for (i = 0; i < productTam; i++) {
      productsConverted.push(
      	[products[i].name,products[i].quantity]
      	);
      names.push(products[i].name);
      quantities.push(products[i].quantity);
    }
    

    Highcharts.chart('container', {
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Quantidade de Produtos em Estoque'
        },
        subtitle: {
            text: 'Source: Inventory Towakai'
        },
        xAxis: [{
            categories: names,
            reversed: false,
            labels: {
                step: 1
            }
        }, { // mirror axis on right side
            opposite: true,
            reversed: false,
            categories: names,
            linkedTo: 0,
            labels: {
                step: 1
            }
        }],
        yAxis: {
            title: {
                text: null
            },
            labels: {
                formatter: function () {
                    return Math.abs(this.value);
                }
            }
        },

        plotOptions: {
            series: {
                stacking: 'normal'
            }
        },

        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
                    'Population: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0);
            }
        },

        series: [{
            name: 'Quantidade',
            data: quantities
        }]
    });

    // Highcharts.chart('container', {
    //     chart: {
    //         type: 'column'
    //     },
    //     title: {
    //         text: 'Quantidade de Produtos em Estoque'
    //     },
    //     subtitle: {
    //         text: 'Source: Inventory Towakai'
    //     },
    //     xAxis: {
    //         type: 'category',
    //         labels: {
    //             rotation: -45,
    //             style: {
    //                 fontSize: '13px',
    //                 fontFamily: 'Verdana, sans-serif'
    //             }
    //         }
    //     },
    //     yAxis: {
    //         min: 0,
    //         title: {
    //             text: 'Quantidade'
    //         }
    //     },
    //     legend: {
    //         enabled: false
    //     },
    //     tooltip: {
    //         pointFormat: 'quantidade: <b>{point.y:.1f} unidades</b>'
    //     },
    //     series: [{
    //         name: 'Population',
    //         data: productsConverted,
    //         dataLabels: {
    //             enabled: true,
    //             rotation: -90,
    //             color: '#FFFFFF',
    //             align: 'right',
    //             format: '{point.y:.1f}', // one decimal
    //             y: 10, // 10 pixels down from the top
    //             style: {
    //                 fontSize: '13px',
    //                 fontFamily: 'Verdana, sans-serif'
    //             }
    //         }
    //     }]
    // });

 });
