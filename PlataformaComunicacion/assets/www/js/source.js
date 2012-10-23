var URL_DOMAIN = 'http://192.168.1.2:3000/';//'http://lancha90.kodingen.com/sw/';
/**
 * url del servicio para realizar el consumo de datos
 */
var URL_LOGIN = URL_DOMAIN+'login.php';
/**
 * url del servicio para realizar el registro de un usuario
 */
var URL_REGISTER = URL_DOMAIN+'/users/new';


/**
 * Codigo de autenticacion satisfactoria
 */
var LOGIN_OK = '001';
/**
 * Codigo de error de autenticacion
 */
var LOGIN_FALSE = '002';
/**
 * Codigo de registro satisfactorio
 */
var REGISTER_OK = '101';
/**
 * Codigo de error del registro de usuario
 */
var REGISTER_ERROR = '102';
/**
 * Codigo de error porque el nombre de usuario ya existe
 */
var REGISTER_ERROR_NAME = '103';
/**
 * Codigo de error porque el email ya se encuentra registrado en la base de datos
 */
var REGISTER_ERROR_MAIL = '104';
/**
 * Codigo de error porque el codigo ya se encuentra registrado en la base de datos
 */
var REGISTER_ERROR_CODE = '105';


/**
 * Funcion encargada de reportar los log's del sistema
 * @param msg
 */
function reportLog(msg,tag) {
	console.log(tag+' => '+msg);
}