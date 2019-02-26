$(document).ready(function() {

(function() {
    var burger = document.querySelector('.burger');
    var menu = document.querySelector('#'+burger.dataset.target);
    burger.addEventListener('click', function() {
        burger.classList.toggle('is-active');
        menu.classList.toggle('is-active');
    });
})();

	$( ".selectSearch" ).select2();
	$('.money_mask').mask('000.000.000.000.000,00', {reverse: true});
	// $(".money_brazil").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
	$('.percent').mask('##0,00%', {reverse: true});
    $('.cpf').mask('000.000.000-00');
    $('#client_phone').mask('(00) 00000-0000');
    $('#client_height').mask('0.00');
    $('#client_weight').mask('00.00');
    $('#client_postal_code').mask('00000-000');

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
	via_cep();
 });


function via_cep() {
	$('#client_postal_code').change(function(){
		let value_postal = this.value;
		$.getJSON('https://viacep.com.br/ws/'+value_postal+'/json/?callback=?', function(data) {
		    if (!("erro" in data)) {
		    	$('#client_address').val(data.bairro + ' , '+ data.logradouro + ' , '+ data.localidade)
		    	$('#client_uf').val(data.uf)
		    }

		});
	});
    // form = input.parent().parent().parent();
}
