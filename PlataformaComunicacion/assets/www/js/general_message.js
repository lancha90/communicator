$(document).ready(function() {

	importMessage();
	$('#sendMessage').click(sendMessage);

});

/**
 * Función encargada de realizar la petición para obtener la lista de los
 * ultimos 10 inbox pertenecientes al usuario.
 */
function importMessage() {

	$.ajax({
				beforeSend : function() {
					$.mobile.showPageLoadingMsg("a", "Loading Information ...");
				},
				url : URL_MESSAGE,
				type : "POST",
				dataType : 'json',
				data : {
					user : window.information.getUserId()
				},
				success : function(data) {

					console.log(data);

					if (data.code == MESSAGE_OK) {
						reportLog('Solicitud de mensaje satisfactoria!',
								'[MESSAGE]');
						loadMessage(data.news);
					} else if (data.code == MESSAGE_ERROR_ID) {
						reportLog('Userid Not Found: ' + IDUSER + ' !',
								'[MESSAGE]');
					} else {
						reportLog('Error Interno del Servidor!', '[MESSAGE]');
					}

					$.mobile.hidePageLoadingMsg();
				},
				statusCode : {
					404 : function() {
						$.mobile.hidePageLoadingMsg();
						reportLog('URL Not Found: ' + URL_MESSAGE + '!',
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
function loadMessage(data) {

	var aux = '<li data-role="list-divider" role="heading" class="ui-li ui-li-divider ui-bar-b ui-corner-top">Bandeja de Entrada</li>';

	for (i in data) {

		aux = aux
				.concat('<li data-theme="c" id="'
						+ data[i].id
						+ '" data-corners="false" data-shadow="false" data-iconshadow="true" data-iconsize="18" data-wrapperels="div" data-icon="arrow-r" class="ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-count ui-btn-up-c  item_message"><div class="ui-btn-inner ui-li"><div class="ui-btn-text"><a class="ui-link-inherit">'
						+ data[i].title + '</a></div></li>');
	}

	$('#message_list').html(aux);
	$('.item_message').click(showItemMessage);
}

/**
 * Función encargada de procesar la respuesta y mostrar el mensaje seleccionado.
 * 
 * @param data,
 *            json con la respuesta del servidor.
 */
function showLoadMessage(data) {
	top.location.href = "#showInbox";
	$('#inboxTitle').html(data.title);
	$('#messageContent').html(data.description);
}

/**
 * Función encargada de permitir la previsualización de un mensaje seleccionado.
 */
function showItemMessage() {

	console.log($(this).attr('id'));

	$
			.ajax({
				beforeSend : function() {
					$.mobile.showPageLoadingMsg("a", "Loading Information ...");
				},
				url : URL_MESSAGE_SHOW,
				type : "POST",
				dataType : 'json',
				data : {
					user : window.information.getUserId(),
					message : $(this).attr('id')
				},
				success : function(data) {

					if (data.code == MESSAGE_OK) {
						reportLog('Solicitud de mensaje satisfactoria!',
								'[MESSAGE]');
						showLoadMessage(data.news);
					} else if (data.code == MESSAGE_ERROR_ID) {
						reportLog('UserId Not Found: ' + window.information.getUserId() + ' !',
								'[MESSAGE]');
					} else if (data.code == MESSAGE_PERMISSION_ID) {
						reportLog('UserId Not Authorize: ' + window.information.getUserId() + ' !',
								'[MESSAGE]');
					} else {
						reportLog('Error Interno del Servidor!', '[MESSAGE]');
					}

					$.mobile.hidePageLoadingMsg();
				},
				statusCode : {
					404 : function() {
						$.mobile.hidePageLoadingMsg();
						reportLog('URL Not Found: ' + URL_MESSAGE + '!',
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
 * Función encargada de enviar un mensaje
 * @TODO -> enviar los parametros
 */
function sendMessage() {
	
	if(validateData){
		
		$.ajax({
			beforeSend : function() {
				$.mobile.showPageLoadingMsg("a", "Loading Information ...");
			},
			url : URL_MESSAGE_SEND,
			type : "POST",
			dataType : 'json',
			data : {
				"message[subject]": $('#subject').val(),
				"message[content]": $('#message').val(),
				"dependences": $('#to').val(),
				"user": window.information.getUserId()
			},
			success : function(data) {
				if (data.code == REGISTER_OK) {
					reportLog('Registro Satisfactorio', '[REGISTER]');
					cleanLogin();
					$.mobile.changePage('#registerOK');
				} else if (data.code == REGISTER_ERROR) {
					reportLog('Error interno del servidor', '[REGISTER]');
				} else if (data.code == REGISTER_ERROR_NAME) {
					reportLog('El nombre de usuario ya se encuentra registrado', '[REGISTER]');
				} else if (data.code == REGISTER_ERROR_MAIL) {
					reportLog('El email introducido ya se encuentra registrado', '[REGISTER]');
				} else if (data.code == REGISTER_ERROR_CODE) {
					reportLog('El codigo introducido ya se encuentra registrado', '[REGISTER]');
				}
				$.mobile.hidePageLoadingMsg();
			},
			statusCode : {
				404 : function() {
					$.mobile.hidePageLoadingMsg();
					reportLog('URL no encontrada!', '[REGISTER]');
					showError("URL no encontrada!");
				},
				0 : function() {
					$.mobile.hidePageLoadingMsg();
					reportLog('Please check your internet connection!',
							'[Login]');
					showError("Please check your internet connection!");
				}
			}
		});
		
	}else{
		reportLog('Form corrupte!', '[MESSAGE]');
	}
}

/**
 * Función encargada de validar los datos diligenciados en el mensaje
 */
function validateData(){
	var state = true;

	if ( $('#subject').val().length < 3) {
		state = false;
		reportLog('El asunto del mensaje no es mayor a 3 caracteres!', '[MESSAGE]');
		$("label[for='subject']").css({ color: "#FF0000" });
	}
	
	if ( $('#message').val().length < 3) {
		state = false;
		reportLog('El contenido del mensaje no es mayor a 10 caracteres!', '[MESSAGE]');
		$("label[for='message']").css({ color: "#FF0000" });
	}
	
	
	return state;
}