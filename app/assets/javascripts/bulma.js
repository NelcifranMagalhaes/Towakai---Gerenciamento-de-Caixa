$(document).ready(function() {

(function() {
    var burger = document.querySelector('.burger');
    var menu = document.querySelector('#'+burger.dataset.target);
    burger.addEventListener('click', function() {
        burger.classList.toggle('is-active');
        menu.classList.toggle('is-active');
    });
})();

	$( ".productsSelect" ).select2();
	$('.money_mask').mask('000.000.000.000.000,00', {reverse: true});
	// $(".money_brazil").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});



	$('.money').maskMoney({
	    prefix: 'R$ ',
	    thousands: '.',
	    decimal: ',',
	    allowZero: true,
	    allowEmpty: true,
	    affixesStay: true
	});
	
	$( ".delete" ).click(function(){

		$(".notification").toggle();

	});

 });



