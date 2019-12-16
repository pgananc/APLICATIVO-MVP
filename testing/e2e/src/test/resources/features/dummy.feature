Feature: Validacion Login App

  	Scenario: Credenciales correctas
		Given un cliente que ingresa a la pagina login
		When el cliente ingresa sus credenciales "mitocode" y clave "123"
		Then se ingresa al sistema con pagina inicial de paciente