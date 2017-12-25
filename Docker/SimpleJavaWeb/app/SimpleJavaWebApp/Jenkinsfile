node("mvnbuilds"){
    stage("build"){
        git credentialsId: 'effd81a1-72f7-4de6-b502-93018182d69a', url: 'https://github.com/bishwash-devops/SimpleJavaWebApp.git'
        env.M2_HOME="${tool name: 'MAVEN_3_5_2', type: 'maven'}"
        env.PATH="${M2_HOME}/bin:${env.PATH}"
        sh "mvn --version"
        sh "echo bulid complete"
    }
}

parallel firstBranch: {
    node(){
        stage("test1"){
            sh "echo testing.."
        }
    }
}, secondBranch: {
    node(){
        stage("test2"){
            sh "testing.."
        }
    }
}


    
node(){
    stage("INT-DEPLOY"){
        sh "echo Deploying.."
    }
}


node(){
    stage("QA-DEPLOY"){
        input "Are you ready? Do you Approve?"
        sh "echo testing.."
    }
}
