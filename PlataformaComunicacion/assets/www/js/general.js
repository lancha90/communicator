/**
 * Evento encargado de verificar las acciones de los subitems de menu y realizar su acci�n respectiva
 */
$(document).ready(function() {
	
	
	
	getDependence(DEPENDENCES_ID);
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