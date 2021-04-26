pipeline {
  agent any
  environment{
    GROUPE_NAME="groupe_name";
    INSTALL_VM="install_vm.yml";
    INSTALL_DOCKER = "instalL_docker"
    DEPLOY_REGISTRY = "deploy-registry"
    DEPLOY_STUDENT_LIST = "deploy_student_list"
    RUN_STUDENT_LIST= "run_student_list"
    TEST_STUDENT_LIST = "test_student_list"
    SCAN_CLAIR = "scan_clair"
    PUSH_IMAGES = "push_images"
    E2E_TEST = "e2e-test"
    SCAN_SPLUNK = "scan_splunk"
  }
  stages {
    stage('Checkout the project'){
      steps {
        checkout scm
      }
    }
    stage('Install packages') {
      steps {
        ansiblePlaybook(vaultCredentialsId: 'AnsibleVaultPassword',inventory: "${env.GROUPE_NAME}",playbook: "${env.INSTALL_VM}",tags: "${INSTALL_DOCKER}")
      }
    }
    stage('Deploy registry server') {
      steps {
        ansiblePlaybook(vaultCredentialsId: 'AnsibleVaultPassword',inventory: "${env.GROUPE_NAME}",playbook: "${env.INSTALL_VM}",tags: "${DEPLOY_REGISTRY}")
      }
    }
    stage('Deploy student list') {
      steps {
        ansiblePlaybook(vaultCredentialsId: 'AnsibleVaultPassword',inventory: "${env.GROUPE_NAME}",playbook: "${env.INSTALL_VM}",tags: "${DEPLOY_STUDENT_LIST}")
      }
    }
    stage('Run the applications') {
      steps {
        ansiblePlaybook(vaultCredentialsId: 'AnsibleVaultPassword',inventory: "${env.GROUPE_NAME}",playbook: "${env.INSTALL_VM}",tags: "${RUN_STUDENT_LIST}")
      }
    }
    stage('Test student list') {
      steps {
        ansiblePlaybook(vaultCredentialsId: 'AnsibleVaultPassword',inventory: "${env.GROUPE_NAME}",playbook: "${env.INSTALL_VM}",tags: "${TEST_STUDENT_LIST}")
      }
    }
    stage('Scan Clair') {
      steps {
        ansiblePlaybook(vaultCredentialsId: 'AnsibleVaultPassword',inventory: "${env.GROUPE_NAME}",playbook: "${env.INSTALL_VM}",tags: "${SCAN_CLAIR}")
      }
    }
    stage('Push images to private registry') {
      steps {
        ansiblePlaybook(vaultCredentialsId: 'AnsibleVaultPassword',inventory: "${env.GROUPE_NAME}",playbook: "${env.INSTALL_VM}",tags: "${PUSH_IMAGES}")
      }
    }

    stage('Tests E2E') {
      steps {
      ansiblePlaybook(vaultCredentialsId: 'AnsibleVaultPassword',inventory: "${env.GROUPE_NAME}",playbook: "${env.INSTALL_VM}",tags: "${E2E_TEST}")
      }
    }
    stage('Scan splunk') {
      steps {
      ansiblePlaybook(vaultCredentialsId: 'AnsibleVaultPassword',inventory: "${env.GROUPE_NAME}",playbook: "${env.INSTALL_VM}",tags: "${SACN_SPLUNK}")
      }
    }
  }
  post{
      always{
        deleteDir()
      }
  }
}
