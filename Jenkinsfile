#!groovy

pipeline {

    agent any

    environment {
        IP_CENTRAL = '192.168.0.103'
        
        SONAR_HOST = 'http://${IP_CENTRAL}:9000'
        PROY_NAME = 'java-devops-mitocode'
        REPO_NAME = 'mediapp-backend'
        BRANCH_NAME = "${GIT_BRANCH}"

        NETWORK_AUX = "devops_backend"
        CONTAINER_NAME = "frontend"
        HOST_APP = "http://${CONTAINER_NAME}"
        APP_HEALTHCHECK = "${HOST_APP}/login"

        ARTIFACTORY_USR = "bot-devops-pe"
        ARTIFACTORY_PSW = "devops@2019"
        ARTIFACTORY_REPOSITORY = "devops-pe-mvn"
        ARTIFACTORY_HOST = "http://${IP_CENTRAL}:8081/artifactory"
        ARTIFACTORY_URL_SETTINGS = "${ARTIFACTORY_HOST}/${ARTIFACTORY_REPOSITORY}"

        SAUCECONNET_USR = "pgananc"
        SAUCECONNECT_KEY = "69595b37-9aae-4340-b5a4-b90d13006e03"
        SAUCECONNECT_TUNNEL = "javadevops"

        AWS_CREDENTIALS = credentials('aws-credentials')
        PASSWORD_DOCKER = credentials('password-docker')
    }
    stages {

        stage('Initialize'){
            steps{
                script {

                    def pom = readMavenPom file:'devops/mediapp-backend/pom.xml'
                    env.POM_VERSION = pom.version
                    env.GROUP_ID = pom.groupId
                    env.ARTIFACT_ID = pom.artifactId

                    def values = "${JOB_NAME}".split('/')
                    env.REPO_NAME = values[1] == null ? "${REPO_NAME}": values[1]
					
					def now = new Date()

                    //env.REPO_URL = "devops-pe-mvn-snapshot/"
					
					if("${GIT_BRANCH}" == "master" || "${GIT_BRANCH}".take(7) == "release") {
                        //env.REPO_URL = "devops-pe-mvn-release/"+values[1]+"/"+pom.version+"-"+now.format("YYYYMMdd-HH_mm")
                        //env.REPO_URL = "devops-pe-mvn-snapshot/"+values[1]+"/"+pom.version+"-"+now.format("YYYYMMdd-HH_mm")
                        env.REPO_URL = "devops-pe-mvn-snapshot/"
                    } else {
                        //env.REPO_URL = "devops-pe-mvn-snapshot/"+values[1]+"/"+pom.version+"-"+now.format("YYYYMMdd-HH_mm")
                        env.REPO_URL = "devops-pe-mvn-snapshot/"
                    }
                }
            }

        }
        
        stage('Build'){
            steps{
                script {
                    docker.image('maven:3.6-jdk-8-alpine').inside('-v "/home/.m2:/home/.m2"') {
                        sh "mvn -Dmaven.repo.local=C:\Users\pabi1\.m2\repository -f ${env.WORKSPACE}/devops/mediapp-backend/pom.xml --batch-mode clean package -Dmaven.test.skip=true"
                    }
                }
            }
        }
       
        stage('Unit Test'){
            steps{
                script {
                    docker.image('maven:3.6-jdk-8-alpine').inside('-v "/home/.m2:/home/.m2"') {
                        sh "mvn -Dmaven.repo.local=C:\Users\pabi1\.m2\repository -f ${env.WORKSPACE}/devops/mediapp-backend/pom.xml --batch-mode test"
                    }
                }
            }
        }
         /*
        stage('Publish to Artifactory'){
            steps{
                script {
                    docker.image('pgananc/mvn3-jdk8-curso-devops').inside('-v "/home/.m2:/home/.m2" -e ARTIFACTORY_CREDENTIALS_USR=${ARTIFACTORY_USR} -e ARTIFACTORY_CREDENTIALS_PSW=${ARTIFACTORY_PSW} -e ARTIFACTORY_URL_SETTINGS=${ARTIFACTORY_URL_SETTINGS} -v "/var/run/docker.sock:/var/run/docker.sock"') {
                        //sh "cp ${env.WORKSPACE}/aplicativo/monolito/pom.xml ${env.WORKSPACE}/aplicativo/monolito/monolito.pom"
                        //sh "mvn -f ${env.WORKSPACE}/aplicativo/monolito/pom.xml --batch-mode deploy:deploy-file -Dfile=${env.WORKSPACE}/aplicativo/monolito/target/app-aws.jar -DpomFile=${env.WORKSPACE}/aplicativo/monolito/monolito.pom -DrepositoryId=central -Durl=${ARTIFACTORY_HOST}/${REPO_URL} -X"
                        sh "mvn -f ${env.WORKSPACE}/aplicativo/monolito/pom.xml --batch-mode deploy:deploy-file -Dfile=${env.WORKSPACE}/aplicativo/monolito/target/app-aws.jar -Dversion=${env.POM_VERSION} -DgroupId=${env.GROUP_ID} -DartifactId=${env.ARTIFACT_ID} -DrepositoryId=central -Durl=${ARTIFACTORY_HOST}/${REPO_URL}"
                    }
                }
            }
        }
        */
        stage('Build Docker'){
            steps{
                dir('devops/mediapp-backend'){
                    script {
                        docker.image('pgananc/mvn3-jdk8-curso-devops').inside('-v "/home/.m2:/home/.m2" -e ARTIFACTORY_CREDENTIALS_USR=${ARTIFACTORY_USR} -e ARTIFACTORY_CREDENTIALS_PSW=${ARTIFACTORY_PSW} -e ARTIFACTORY_URL_SETTINGS=${ARTIFACTORY_URL_SETTINGS} -v "/var/run/docker.sock:/var/run/docker.sock"') {
                            sh "docker login -u=pgananc -p=${PASSWORD_DOCKER}"
                            sh "docker build -t pgananc/monolito-devops ."
                            sh "docker push pgananc/monolito-devops"
                        }
                    }
                }
            }
        }
        
        stage('Deploy to Environment'){
            steps{
                    script {
                        docker.image('pgananc/aws-cli').inside('-e AWS_ACCESS_KEY_ID=${AWS_CREDENTIALS_USR} -e AWS_SECRET_ACCESS_KEY=${AWS_CREDENTIALS_PSW} -e AWS_DEFAULT_REGION=us-east-1') {
                            sh "aws ecs update-service --cluster cluster-containers-myClusterECS-K6VPOMYD7GBS --service srvMonolitoDevops --force-new-deployment"
                        }
                    }
            }
        }
        
    }
}