# APLICATIVO-MVP
Java Devops
Proyecto para contenerizar las fases de desarrollo.
--------------------------------------------------
Dentro de la carpeta devops se encuentran los proyectos
1. Carpeta agentes-jenkins contiene docker para jenkins
2. Carpeta dockerfile-postgresql contiene docker para postgresql y los scripts iniciales.
3. Proyecto mediapp-backend contiene la lógica de negocio para un sistema de cita médica.
4. Proyecto mediapp-frontend contiene el front del sistema de citas desarrollado en Angular 8.
5. Carpeta testing contiene las pruebas de integración y e2e.
5.1 Proyecto e2e pruebas de integración son selenimun sauceslab.
5.2 Proyecto integration pruebas unitarias con Junit

Prequesitos de ejecución
----------------------------------------------
1. Instalar docker de acuerdo al sistema operativo. https://www.docker.com/products
2. Configurar el archivo Jenkinsfile para el m2 local.
3. Revisar los pasos que desea ejecutar en el archivo Jenkinsfile.

Pasos de ejecución
-----------------------------------------------------
1. Ejecutar 
docker-compose -f docker-compose-all.yml up -d



