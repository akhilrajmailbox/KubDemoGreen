def DEPLOYMENT_ERR = ""
def MY_NODE_LABEL = "SLAVES"

try {
    node (label: "${MY_NODE_LABEL}") {
        stage('Checkout SCM') {
            checkout scm
            RELEASE_SHA = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
        }
        stage('Post Trigger') {
            build wait: false, propagate: false, job: 'KubDemoCICD', parameters: [string(name: 'DEPLOY_BRANCH', value: BRANCH_NAME)]
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