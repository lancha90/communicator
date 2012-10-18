/**
 * Evento encargado de verificar las acciones de los subitems de menu y realizar su acción respectiva
 */
$(document).ready(function() {
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información del la facultad
	 */
	$("#btnFacultad").click(function(){
	top.location.href = "info_facultad.html";
	});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información de extension
	 */
	$("#btnExtension").click(function(){
		top.location.href = "info_extension.html";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información del programa de ingeniería de sistemas y computación
	 */
	$("#btnIngSistemas").click(function(){
		top.location.href = "info_ingsistemas.html";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información del programa de ingeniería civil
	 */
	$("#btnIngCivil").click(function(){
		top.location.href = "info_ingcivil.html";
		});
	
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información del programa de ingeniería electronica
	 */
	$("#btnIngElectronica").click(function(){
		top.location.href = "info_ingelectronica.html";
		});
	
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información del programa de tecnologia en topografía
	 */
	$("#btnTecTopografia").click(function(){
		top.location.href = "info_tectopografia.html";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información del programa de tecnologia en obras civiles
	 */
	$("#btnTecObras").click(function(){
		top.location.href = "info_tecobras.html";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información de convocatorias laborales
	 */
	$("#btnLaborales").click(function(){
		top.location.href = "convocatorias.html#laboral";
		});

	/**
	 * Listener del item de menu encargado de dirigir hacia la información de convocatorias de pasantias
	 */
	$("#btnPasantias").click(function(){
		top.location.href = "convocatorias.html#pasantia";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información de convocatorias para auxiliares de docencia
	 */
	$("#btnDocencia").click(function(){
		top.location.href = "convocatorias.html#docencia";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información de convocatorias para auxiliares de grupos de investigacion
	 */
	$("#btnInvestigacion").click(function(){
		top.location.href = "convocatorias.html#investigacion";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información de convocatorias para auxiliares administrativos
	 */
	$("#btnAdministrativos").click(function(){
		top.location.href = "convocatorias.html#administrativo";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la información de todas las convocatorias 
	 */
	$("#btnAllConvocatoria").click(function(){
		top.location.href = "convocatorias.html#all";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la bandeja de entrada 
	 */
	$("#btnInbox").click(function(){
		top.location.href = "message.html#inbox";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la redaccion  
	 */
	$("#btnRedact").click(function(){
		top.location.href = "message.html#redact";
		});

	/**
	 * Listener del item de menu encargado de dirigir hacia la configuración de la aplicación 
	 */
	$("#btnSetting").click(function(){
		top.location.href = "setting.html#setting";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la configuración del perfil del usuario 
	 */
	$("#btnProfile").click(function(){
		top.location.href = "setting.html#profile";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la emisora de la facultad
	 */
	$("#btnStreaming").click(function(){
		top.location.href = "streaming.html";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la emisora de la facultad
	 */
	$("#btnNews").click(function(){
		top.location.href = "news.html";
		});
	
	
});

