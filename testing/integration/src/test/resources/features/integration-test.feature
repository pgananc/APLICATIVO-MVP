
Feature: Validacion API Curso

	Background: 
		Given un cliente rest
		When se invoca al servicio login con credenciales "mito@gmail.com" y "123"
		Then se obtiene un token de autorizacion

  	Scenario Outline: Validacion StatusCode APIs
		Given un cliente rest
		When se invoca a la url "<endpoint>" 
		Then se obtiene el estado http <httpstatus> 
    	
	   Examples:
	    	|	caso 	|		endpoint 																						| httpstatus 	|
	    	| 	1		|	/pacientes															| 	200			|
	    	|	2		|   /pacientes/1	| 	200			|

	
	Scenario Outline: Validacion 
		Given un cliente rest
		When se invoca a la url "<endpoint>" 
		Then se valida que el campo "<campo>" sea "<expected>"
    	
	   Examples:
	    	|	caso 	|		endpoint 													| 		campo			|		expected		|
	    	| 	1		|	/especialidades/1			| 	$.idEspecialidad		|			1			|
			| 	2		|	/especialidades						| 	$[0].nombre	|		CARDIOLOGÍA			|
	    	