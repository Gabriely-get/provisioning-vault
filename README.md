# Provisioning Vault with Docker and Ansible 

## Required

- Install and configuring Docker (for provision with docker)
- Install and configuring Jenkins (for provision with ansible and jenkins)
- Download this project

## Provisioning with Docker
1. Go to project path on terminal and run
    ``` prompt
        docker build -t ilegra/vault .
    ```
2. Run docker vault image
    ``` prompt
        docker run --rm -p 8200:8200 --name=vault ilegra/vault
    ```

## Provisioning with Jenkins

### Configuring

1. Start Jenkins, go to http://localhost:8282/, install suggested plugins and create a root user
    ###### The password is stored in /var/jenkins_home/secrets/initialAdminPassword
2. Go to **Dashboard** -> **Manage Jenkins** -> **Manage Credentials** -> **Global Credentials**
   - Create a **secret text** named **vault-version** with value **1.13.1** or another

3. Go to **Dashboard** -> **Manage Jenkins** -> **Manage Plugins** -> **Available plugins** and install **Ansible**


### Pipeline

1. Go to **Dashboard** -> **New Item** -> **Pipeline** and name it as *Provisioning_Vault* 
2. Pipeline config:
    - **Definition**: Pipeline script from SCM
    - **SCM**: Git
    - **Repository URL**: https://github.com/Gabriely-get/provisioning-vault.git
    - **Branch Specifier:** */main
    - **Script Path**: resources/Jenkinsfile
3. Save it and Run the pipeline. While pipeline run, vault will be available. Only stops manually.

## Using Vault

1. access: http://127.0.0.1:8200/
2. Unseal Vault to be allowed to use
    - Key shares: Quantity of keys that will be generated. Suggested: **7**
    - Key threshold: Quantity of keys that will be necessary to unseal. Suggested: **3**
3. Initialize and save all the given keys and the initial token
4. Continue and paste three times, three keys from the 7 gived
5. Continue and place the Token with the root_token saved before
6. Now Vault is ready to use!
