// $(document).ready(function() {
//     let sales = $('.temp_information').data('temp');
//     let year_list = [];
//     let value_list = [];
//     let all_list = [];
//     let count = 0;

//     for (x in sales) {
//         let date = new Date(x);
//         let year = date.getFullYear();
//         // console.log(sales[x]);
//         value_list.push(sales[x]);
//         year_list.push({name: year,data: 0});
//         if (year_list >0) {
            
//             if (year_list[count].name == year) {
//                 year_list[count].data = sales[x];
//             }
//         }
//         console.log(count);
//         // console.log(sales[x]);
//         // console.log(x);
//         count += 1;
//     }
//     console.log(year_list);
    
//     Highcharts.chart('container', {

//         title: {
//             text: 'Solar Employment Growth by Sector, 2010-2016'
//         },

//         subtitle: {
//             text: 'Source: thesolarfoundation.com'
//         },

//         yAxis: {
//             title: {
//                 text: 'Number of Employees'
//             }
//         },
//         legend: {
//             layout: 'vertical',
//             align: 'right',
//             verticalAlign: 'middle'
//         },

//         plotOptions: {
//             series: {
//                 label: {
//                     connectorAllowed: false
//                 },
//                 pointStart: 2018
//             }
//         },

//         series: year_list,

//         responsive: {
//             rules: [{
//                 condition: {
//                     maxWidth: 5009
//                 },
//                 chartOptions: {
//                     legend: {
//                         layout: 'horizontal',
//                         align: 'center',
//                         verticalAlign: 'bottom'
//                     }
//                 }
//             }]
//         }

//     });

//  });