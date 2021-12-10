node() {

def dockerImg = "ssp25/ssp-nodejs-proj"
    
stage('checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/release']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/awsdevopsssp/nov-devops-1.git']]])
     
    }
stage("Build Docker Image"){
        sh "docker build -t $dockerImg:azm$BUILD_NUMBER ."
    }
    
    stage("Docker Push"){
        withCredentials([string(credentialsId: 'ssp25dockertoken', variable: 'dockercreds')]) {
            sh " echo ${dockercreds} | docker login -u ssp25 --password-stdin "
        }    
        sh "docker push $dockerImg:azm$BUILD_NUMBER " 
    }

    stage('Deploy k8s'){
        withCredentials([usernamePassword(credentialsId: 'awskeys', passwordVariable: 'awssecret', usernameVariable: 'awskey')]) {
            docker.image('jshimko/kube-tools-aws:latest').inside("-u root -e AWS_ACCESS_KEY_ID=$awskey -e AWS_SECRET_ACCESS_KEY=$awssecret -e AWS_DEFAULT_REGION=us-east-1") {
                    sh """
                        aws eks update-kubeconfig --name azmcluster
                        kubectl get pods -A
                    """
                    sh """
                    cd $WORKSPACE
                    echo 'Deployiong the docker image'
                    sed "s/buildNum/azm$BUILD_NUMBER/g" ./k8s/deploy.yaml | kubectl apply --namespace devops-tools -f -
                    kubectl apply -f ./k8s/service.yaml
                    """
                }    
        }
    }
}
