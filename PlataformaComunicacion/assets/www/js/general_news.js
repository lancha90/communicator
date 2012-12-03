$(document).ready(function() {
	importNews();
});

/**
 * Función encargada de realizar la petición para obtener la lista de las
 * noticias disponibles segun el perfil del usuario
 */
function importNews() {

	var d = new Date();

	$
			.ajax({
				beforeSend : function() {
					$.mobile.showPageLoadingMsg("a", "Loading Information ...");
				},
				url : URL_NEWS + '?s=1&t=1&a=1&date=' + (1900 + d.getYear()) + '-'
						+ (1 + d.getMonth()) + '-' + d.getDate(),
				type : "GET",
				dataType : 'json',
				success : function(data) {

					if (data.code == MESSAGE_OK) {
						reportLog('Solicitud de mensaje satisfactoria!',
								'[MESSAGE]');
						loadNews(data.news);
					} else {
						reportLog('Error Interno del Servidor!', '[MESSAGE]');
					}

					$.mobile.hidePageLoadingMsg();
				},
				statusCode : {
					404 : function() {
						$.mobile.hidePageLoadingMsg();
						reportLog('URL Not Found: ' + URL_NEWS + '!',
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
 * mensajes.
 * 
 * @param data,
 *            json con la respuesta del servidor.
 */
function loadNews(data) {

	var aux = '<li data-role="list-divider" role="heading" class="ui-li ui-li-divider ui-bar-b ui-corner-top">Noticias</li>';
	$('#news_content').html(aux);

	for (i in data) {

		aux = '<li data-theme="c" id="inbox'
				+ data[i].id
				+ '" data-corners="false" data-shadow="false" data-iconshadow="true" data-iconsize="18" data-wrapperels="div" data-icon="arrow-r" class="ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-count ui-btn-up-c  item_message"><div class="ui-btn-inner ui-li"><div class="ui-btn-text"><a class="ui-link-inherit">'
				+ data[i].title + '</a></div></li>';
		$('#news_content').append(aux);

		$('#inbox' + data[i].id).click(function() {
			showLoadMessage(data[i].description, data[i].title);
		});

	}

}

/**
 * Función encargada de procesar la respuesta y mostrar la noticia seleccionada.
 * 
 * @param data,
 *            json con la respuesta del servidor.
 */
function showLoadMessage(content, subject) {

	top.location.href = "#show_news";
	$('#title_news').html(subject);
	$('#description_news').html(content);
}