def DEPLOYMENT_ERR = ""
def MY_NODE_LABEL = "SLAVES"

try {
    node (label: "${MY_NODE_LABEL}") {
        stage('Checkout SCM') {
            checkout scm
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
            currentBuild.displayName = BUILD_NUMBER
            currentBuild.description = "Demo Jenkins Job"
        }
    }
}