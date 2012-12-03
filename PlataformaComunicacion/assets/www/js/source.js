var URL_DOMAIN = 'http://192.168.1.2:3000/';
//var URL_DOMAIN ='http://lancha90.kodingen.com/sw/';
/**
 * url del servicio para realizar el consumo de datos.
 */
var URL_LOGIN = URL_DOMAIN+'login.json';
/**
 * url del servicio para realizar el registro de un usuario.
 */
var URL_REGISTER = URL_DOMAIN+'users.json';

/**
 * url del servicio para realizar la importación de los inbox.
 */
var URL_MESSAGE = URL_DOMAIN+'getMessageUser';
/**
 * url del servicio para realizar la importación de las noticias.
 */
var URL_NEWS = URL_DOMAIN+'show_news';
/**
 * url del servicio para realizar la importación de las convocatorias.
 */
var URL_CALLS = URL_DOMAIN+'show_calls';


/**
 * url del servicio para importar los detaller de un mensaje inbox.
 */
var URL_MESSAGE_SHOW = URL_DOMAIN+'showMessage.php';

/**
 * url del servicio para enviar un mensaje.
 */
var URL_MESSAGE_SEND = URL_DOMAIN+'messages.json';

/**
 * url del servicio que lista los usuarios
 */
var URL_DEPENDENCES_LIST = URL_DOMAIN+'list_dependences.json';

/**
 * url del servicio que retorna la informacion de las categorias
 */
var URL_DEPENDENCES_INFO = URL_DOMAIN+'dependences/';


/**
 * Codigo de autenticacion satisfactoria.
 */
var LOGIN_OK = '001';
/**
 * Codigo de error de autenticación.
 */
var LOGIN_FALSE = '002';
/**
 * Codigo de registro satisfactorio.
 */
var REGISTER_OK = '101';
/**
 * Codigo de error del registro de usuario.
 */
var REGISTER_ERROR = '102';
/**
 * Codigo de error porque el nombre de usuario ya existe.
 */
var REGISTER_ERROR_NAME = '103';
/**
 * Codigo de error porque el email ya se encuentra registrado en la base de datos.
 */
var REGISTER_ERROR_MAIL = '104';
/**
 * Codigo de error porque el codigo ya se encuentra registrado en la base de datos.
 */
var REGISTER_ERROR_CODE = '105';

/**
 * Codigo de aprobación para mensajes.
 */
var MESSAGE_OK = '200';

/**
 * Codigo de error para mensajes cuando el usuario no es correcto.
 */
var MESSAGE_ERROR_ID = '202';

/**
 * Codigo de error para mensajes cuando se ocurrio un error interno del servidor.
 */
var MESSAGE_EEROR_SERVER = '203';

/**
 * Codigo de error para mensajes cuando el usuario no cuenta con permisos para acceder a esa información.
 */
var MESSAGE_PERMISSION_ID = '204';

var DEPENDENCES_ID=0;
var CALLS_ID=0;

/**
 * Funcion encargada de reportar los log's del sistema.
 * @param msg, mensaje que se publica en el reporte de log's
 * @param tag, etiqueta que se maneja para filtrar los mensajes en el reporte de log's
 */
function reportLog(msg,tag) {
	console.log(tag+' => '+msg);
}

/**
 * Funcion encargada de mostrar el mensaje de alerta en la pantalla del usuario
 * 
 * @param msg
 */
function showError(msg) {
	alert(msg);
}

/**
* Funcion encargada de capturar el parametro GET 
*/
function getParameters( name ){
	var regexS = "[\\?&]"+name+"=([^&#]*)";
	var regex = new RegExp ( regexS );
	var tmpURL = window.location.href;
	var results = regex.exec( tmpURL );
	if( results == null )
		return"";
	else
		return results[1];
}