def DEPLOYMENT_ERR = ""
def MY_NODE_LABEL = "SLAVES"

try {
    node (label: "${MY_NODE_LABEL}") {
        stage('Checkout SCM') {
            checkout scm
        }
        stage('Creating Docker image') {
            def imageContext = "Docker"
            def dockerImgName = "httpd-demo"
            def dockerImgTag = "${env.BUILD_NUMBER}"
            def dockerFile = "Dockerfile"
            dir("${imageContext}") {
                myImage = docker.build("${dockerImgName}:${dockerImgTag}", "-f ${dockerFile} .")
            }
        }
        stage('Updating Deployment Snippet'){
            def K8S_NAMESPACE = "${env.BRANCH_NAME}"
            def SVC_IMG_NAME = "httpd-demo:${env.BUILD_NUMBER}"
            def fileName = "K8s/Deployment.yml"
            def theFileExists = fileExists fileName
            if (theFileExists) {
                sh """
                    sed -i "s|K8S_NAMESPACE_VALUE|${K8S_NAMESPACE}|g" ${fileName}
                    sed -i "s|SVC_IMG_NAME_VALUE|${SVC_IMG_NAME}|g" ${fileName}
                    cat ${fileName}
                """
            } else {
                error("${fileName} not found..!")
            }
        }
        stage('Deploy to Kubernetes'){
            def K8S_NAMESPACE = "${env.BRANCH_NAME}"
            def fileName = "K8s/Deployment.yml"
            def theFileExists = fileExists fileName
            if (theFileExists) {
                sh """
                    kubectl create ns ${K8S_NAMESPACE}
                    kubectl apply -f ${fileName}
                """
            } else {
                error("${fileName} not found..!")
            }
        }
    }
} catch (err) {
    node (label: "${MY_NODE_LABEL}") {
        stage('Job error stage') {
            currentBuild.result = 'FAILURE'
            DEPLOYMENT_ERR = "${err}"
            throw err
        }
    }
} finally {
    node (label: "${MY_NODE_LABEL}") {
        stage('Job final stage') {
            currentBuild.displayName = "${env.BUILD_NUMBER}"
            currentBuild.description = "Demo Jenkins Job"
        }
    }
}