pipeline {
    agent any

    stages {
        stage('checkout'){
            steps {
                checkout scm }
        }
        stage('git') {
            steps {
                // Cloner le référentiel depuis votre système de contrôle de version
                  git branch: 'main', url : 'https://github.com/bouraoui123/Devops_projet.git'
                  }
        }
        stage('Construction') {
            steps {
                // Exécuter votre processus de construction (par exemple, Maven, Gradle, etc.)
                sh 'mvn clean package'
            }
        }
        stage('Tests') {
            steps {
                // Exécuter vos tests unitaires ou tests d'intégration
                sh 'mvn test'
            }
                  post {
        failure {
            script {
                emailext(
                    subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
                    body: "The pipeline has failed. Please check the console output for details.",
                    to: 'mohamediheb.bouraoui@esprit.tn',
                    attachLog: true,
                )
            }
        }
        
        success {
            script {
                emailext(
                    subject: "Pipeline Succeeded: ${currentBuild.fullDisplayName}",
                    body: "The pipeline has succeeded. You can view the results at ${BUILD_URL}",
                    to: 'mohamediheb.bouraoui@esprit.tn',
                    attachLog: true,
                )
            }
        }
    }       

}
       stage('sonarqube') {
           steps {
           withSonarQubeEnv('sonarserver') {
                                      sh 'mvn sonar:sonar -Dsonar.java.binaries=target/classes'
           }
           }
       }
        //
      // stage('Déploiement') {
      //       steps {
      //           // Déployer votre application sur un serveur ou une plateforme spécifique
      //           sh 'mvn deploy'
      //       }
      //   }
    }
}
