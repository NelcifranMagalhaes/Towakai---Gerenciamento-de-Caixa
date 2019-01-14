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



