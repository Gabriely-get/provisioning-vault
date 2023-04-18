pipeline {
    agent any

    environment { 
      VAULT_VERSION = credentials('vault-version')
    }
    
    stages {
        stage('Run playbook') {
            steps {
                ansiblePlaybook(
                playbook: 'playbooks/playbook.yml',
                inventory: 'inventory',
                extras: '-e vault_version="$VAULT_VERSION"')
            }
        }
        stage('Start Vault') {
            steps {
                sh 'vault server -config=config-vault.hcl'}
            }
        }
    
}
