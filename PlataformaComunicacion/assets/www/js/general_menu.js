/**
 * Evento encargado de verificar las acciones de los subitems de menu y realizar su acci�n respectiva
 */
$(document).ready(function() {
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n del la facultad
	 */
	$("#btnFacultad").click(function(){
	getDependence(1);
	top.location.href = "info_facultad.html";
	});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n de extension
	 */
	$("#btnExtension").click(function(){
		getDependence(7);
		top.location.href = "info_extension.html";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n del programa de ingenier�a de sistemas y computaci�n
	 */
	$("#btnIngSistemas").click(function(){
		getDependence(3);
		top.location.href = "info_ingsistemas.html";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n del programa de ingenier�a civil
	 */
	$("#btnIngCivil").click(function(){
		getDependence(2);
		top.location.href = "info_ingcivil.html";
		});
	
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n del programa de ingenier�a electronica
	 */
	$("#btnIngElectronica").click(function(){
		getDependence(4);
		top.location.href = "info_ingelectronica.html";
		});
	
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n del programa de tecnologia en topograf�a
	 */
	$("#btnTecTopografia").click(function(){
		getDependence(5);
		top.location.href = "info_tectopografia.html";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n del programa de tecnologia en obras civiles
	 */
	$("#btnTecObras").click(function(){
		getDependence(6);
		top.location.href = "info_tecobras.html";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n de convocatorias laborales
	 */
	$("#btnLaborales").click(function(){
		top.location.href = "convocatorias.html#laboral";
		});

	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n de convocatorias de pasantias
	 */
	$("#btnPasantias").click(function(){
		top.location.href = "convocatorias.html#pasantia";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n de convocatorias para auxiliares de docencia
	 */
	$("#btnDocencia").click(function(){
		top.location.href = "convocatorias.html#docencia";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n de convocatorias para auxiliares de grupos de investigacion
	 */
	$("#btnInvestigacion").click(function(){
		top.location.href = "convocatorias.html#investigacion";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n de convocatorias para auxiliares administrativos
	 */
	$("#btnAdministrativos").click(function(){
		top.location.href = "convocatorias.html#administrativo";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la informaci�n de todas las convocatorias 
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
	 * Listener del item de menu encargado de dirigir hacia la configuraci�n de la aplicaci�n 
	 */
	$("#btnSetting").click(function(){
		top.location.href = "setting.html#setting";
		});
	
	/**
	 * Listener del item de menu encargado de dirigir hacia la configuraci�n del perfil del usuario 
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

function getDependence(code){
	
	$.ajax({
		beforeSend : function() {
			$.mobile.showPageLoadingMsg("a",
					"Loading Information ...");
		},
		url : URL_DEPENDENCES_INFO+code+'.json',
		type : "GET",
		dataType : 'json',
		success : function(data) {

			var contenido= '<h5>Misión<h5>'+data.mision+'<h5>Visión<h5>'+data.vision;
			$("#vision_mision").html(contenido);
			
			contenido ='<h5>Información General</h5>'+data.information;
			$("#information_general").html(contenido);

			$.mobile.hidePageLoadingMsg();
		},
		statusCode : {
			404 : function() {
				$.mobile.hidePageLoadingMsg();
				reportLog('URL no encontrada!', '[MENU]');
				showError("URL no encontrada " + URL_DEPENDENCES_INFO+code+'.json!');
			},
			0 : function() {
				$.mobile.hidePageLoadingMsg();
				reportLog('Please check your internet connection!',
						'[MENU]');
				showError("Please check your internet connection!");
			}
		}
	});
}