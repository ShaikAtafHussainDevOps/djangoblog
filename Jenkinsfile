pipeline{
    agent any
    stages{
        stage("Cloning"){
            steps{
                git url:"https://github.com/ShaikAtafHussainDevOps/djangoblog.git", branch: "master"
            }
        }
        stage("Build"){
            steps{
                sh 'docker build -t djangoblog:v1 .'
            }
        }
        stage("Push to docker hub"){
            steps{ 
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker tag djangoblog:v1 ${env.dockerHubUser}/blogappimg:v1"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/blogappimg:v1"
                }
            }
        }
        stage("Deploy"){
            steps{
                sh 'docker-compose down && docker-compose up -d'
            }
        }
    }
}