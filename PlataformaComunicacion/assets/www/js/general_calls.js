$(document).ready(function() {
	importCalls();
});

/**
 * Función encargada de realizar la petición para obtener la lista de las
 * noticias disponibles segun el perfil del usuario
 */
function importCalls() {

	var d = new Date();
	
	$
			.ajax({
				beforeSend : function() {
					$.mobile.showPageLoadingMsg("a", "Loading Information ...");
				},
				url : URL_CALLS + '?type='+CALLS_ID+'&date=' + (1900 + d.getYear()) + '-'
						+ (1 + d.getMonth()) + '-' + d.getDate(),
				type : "GET",
				dataType : 'json',
				success : function(data) {

					if (data.code == MESSAGE_OK) {
						reportLog('Solicitud de mensaje satisfactoria!',
								'[MESSAGE]');
						loadCalls(data.calls);
					} else {
						reportLog('Error Interno del Servidor!', '[MESSAGE]');
					}

					$.mobile.hidePageLoadingMsg();
				},
				statusCode : {
					404 : function() {
						$.mobile.hidePageLoadingMsg();
						reportLog('URL Not Found: ' + URL_CALLS + '!',
								'[MESSAGE]');
					},
					0 : function() {
						$.mobile.hidePageLoadingMsg();
						reportLog('Please check your internet connection!',
								'[MESSAGE]');
					}
				}
			});
}

/**
 * Función encargada de procesar la respuesta y adicionarla a la lista de
 * convocatorias.
 * 
 * @param data,
 *            json con la respuesta del servidor.
 */
function loadCalls(data) {

	var aux = '<li data-role="list-divider" role="heading" class="ui-li ui-li-divider ui-bar-b ui-corner-top">Noticias</li>';
	$('#list_calls').html(aux);

	for (i in data) {

		aux = '<li data-theme="c" id="inbox'
				+ data[i].id
				+ '" data-corners="false" data-shadow="false" data-iconshadow="true" data-iconsize="18" data-wrapperels="div" data-icon="arrow-r" class="ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-count ui-btn-up-c  item_message"><div class="ui-btn-inner ui-li"><div class="ui-btn-text"><a class="ui-link-inherit">'
				+ data[i].title + '</a></div></li>';
		$('#list_calls').append(aux);

		$('#inbox' + data[i].id).click(function() {
			showLoadCall(data[i].title, data[i].hours_total, data[i].hours_week, data[i].opening, data[i].close, data[i].work);
		});

	}

}

/**
 * Función encargada de procesar la respuesta y mostrar la convocatoria seleccionada.
 * 
 * @param data,
 *            json con la respuesta del servidor.
 */
function showLoadCall(title, total, week, open, close, work) {

	top.location.href = "#show_calls";
	$('#call_title').html(title);
	$('#call_total').append(total);
	$('#call_week').append(week);
	$('#call_opening').append(open);
	$('#call_close').append(close);
	$('#call_work').append(work);
}