pipeline {
    agent any
    
    stages {
        stage('Run playbook') {
            steps {
                ansiblePlaybook(playbook: 'playbooks/playbook.yml')
            }
        }
    }
    
}
