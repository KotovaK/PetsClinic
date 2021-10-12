pipeline {
    agent any
    stages {
        stage('build/push docker image') {
            when {
                branch pattern: "PR-.*|master", comparator: "REGEXP"
            }
            steps {
                ansiblePlaybook(
                playbook: 'ansible/ci-dev-build-push.yml',
                extras: '-e tag=$GIT_COMMIT')
            }
        }

        stage('CI env deploy') {
            when {
                branch pattern: "develop|master", comparator: "REGEXP"
            }
            steps {
                ansiblePlaybook(
                playbook: 'ansible/ci-dev-deploy.yml',
                inventory: 'ansible/inventory.txt',
                disableHostKeyChecking: true,
                credentialsId: '1bea4368-c8d3-43e5-adba-89119d7e195f',
                extras: '-e tag=$GIT_COMMIT -e host_port=81 -e env=ci')
            }
        }

    }
}
