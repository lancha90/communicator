$(document).ready(function() {
	$("#btnLogin").click(login);
	$("#btnRegister").click(register);
});

/**
 * Metodo encargado de realizar la conexion con el servidor que autentica el
 * usuario
 */
function login() {

	if (validateLogin()) {
		$.ajax({
					beforeSend : function() {
						$.mobile.showPageLoadingMsg("a", "Loading Information ...");
					},
					url : URL_LOGIN,
					type : "POST",
					dataType : 'json',
					data : {
						user : $('#user').val(),
						passwd : $('#passwd').val()
					},
					success : function(data) {

						if (data.code == LOGIN_OK) {
							reportLog('Sesión iniciada!', '[LOGIN]');
							$.mobile.changePage("./index.html");
						} else if (data.code == LOGIN_FALSE) {
							reportLog(
									'Nombre de usuario o contraseña no son correctos!',
									'[Login]');
							showError('Nombre de usuario o contraseña no son correctos!');
						} else {
							reportLog('Error Interno del Servidor!', '[LOGIN]');
							showError('Error Desconocido!');
						}

						$.mobile.hidePageLoadingMsg();
					},
					statusCode : {
						404 : function() {
							$.mobile.hidePageLoadingMsg();
							reportLog('URL no encontrada!', '[LOGIN]');
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
		showError("Error en el contenido de los campos!");
	}
}

/**
 * Funcion encargada de realizar la peticion de registro del usuario
 */
function register() {

	if (validateRegister()) {

		$.ajax({
			beforeSend : function() {
				$.mobile.showPageLoadingMsg("a", "Loading Information ...");
			},
			url : URL_REGISTER,
			type : "POST",
			dataType : 'json',
			data : {
				user : $('#user_name').val(),
				passwd : $('#user_passwd').val(),
				name: $('#name').val()+' '+$('#second_name'),
				code: $('#code').val(),
				email: $('#email').val(),
				dependence: $('#depence').val(),
				teacher: $("#radio1").is(':checked'),
				student: $("#radio2").is(':checked'),
				manager: $("#radio3").is(':checked')
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
		
		showError('Error en el contenido de los campos!');
		
	}

}

/**
 * Funcion encargada de validar los campos del registro de usuarios
 */
function validateRegister() {

	var state = true;

	if ( $('#user_name').val().length < 6) {
		state = false;
		reportLog('El nombre de usuario no es mayor a 6 caracteres!', '[REGISTER]');
		$("label[for='user_name']").css({ color: "#FF0000" });
	}

	if ( $('#user_passwd').val().length < 6) {
		state = false;
		reportLog('La contraseña no es mayor a 6 caracteres!', '[REGISTER]');
		$("label[for='user_passwd']").css({ color: "#FF0000" });
	}
	
	if ( $('#repeat_passwd').val() != $('#user_passwd').val()) {
		state = false;
		reportLog('La contraseña no coincide en ambos campos!', '[REGISTER]');
		$("label[for='repeat_passwd']").css({ color: "#FF0000" });
		$("label[for='user_passwd']").css({ color: "#FF0000" });

	}
		
	if ( $('#name').val().length < 3) {
		state = false;
		reportLog('El nombre no es mayor a 3 caracteres!', '[REGISTER]');
		$("label[for='name']").css({ color: "#FF0000" });
	}

	if ( $('#second_name').val().length < 3) {
		state = false;
		reportLog('El apellido no es mayor a 3 caracteres!', '[REGISTER]');
		$("label[for='second_name']").css({ color: "#FF0000" });
	}
	
	if ( $('#code').val().length < 6) {
		state = false;
		reportLog('El codigo no es mayor a 6 caracteres!', '[REGISTER]');
		$("label[for='code']").css({ color: "#FF0000" });
	}
	
	if ( $('#email').val().length < 6) {
		state = false;
		
		if($("#email").val().indexOf('@', 0) == -1 || $("#email").val().indexOf('.', 0) == -1) {  
			reportLog('El formate de email no es valido!', '[REGISTER]');
		}
		else{
		reportLog('El email no es mayor a 6 caracteres!', '[REGISTER]');
		}
		
		$("label[for='email']").css({ color: "#FF0000" });
	}
	
	if(!$("#radio1").is(':checked') && !$("#radio2").is(':checked') && !$("#radio3").is(':checked')){
		state= false;
		reportLog('Debe seleccionar un perfil!', '[REGISTER]');
		}
	
	

	return state;
}

/**
 * Funcion encargada de validar los campos del login
 */
function validateLogin() {

	var state = true;

	if ( $('#user').val().length < 6) {
		state = false;
		reportLog('El nombre de usuario no es mayor a 6 caracteres!', '[LOGIN]');
		$("label[for='user']").css({ color: "#FF0000" });
	}

	if ( $('#passwd').val().length < 6) {
		state = false;
		reportLog('La contraseña no es mayor a 6 caracteres!', '[LOGIN]');
		$("label[for='passwd']").css({ color: "#FF0000" });
	}

	return state;
}

/**
 * Funcion encargada de limpiar los campos de los formularios
 */
function cleanLogin() {
	$('#user').val('');
	$('#passwd').val('');
	
	$("#email").val('');
	$('#code').val('');
	$('#second_name').val('');
	$('#name').val('');
	$('#repeat_passwd').val('');
	$('#user_passwd').val('');
	$('#user_name').val('');
}

/**
 * Funcion encargada de mostrar el mensaje de alerta en la pantalla del usuario
 * 
 * @param msg
 */
function showError(msg) {
	alert(msg);
}