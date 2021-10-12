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
                credentialsId: '44f0b4dd-3c99-43d3-ab72-9f6c5d0b99a7', '0acf42dd-d420-401f-83b7-e4974cf54461'
                extras: '-e tag=$GIT_COMMIT -e host_port=81 -e env=ci')
            }
        }

    }
}
