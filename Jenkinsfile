pipeline {
    agent any

    tools {
        nodejs 'node22'
    }

    environment {
        BUILD_ENV = 'production'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Cloning repository..."
                git branch: 'main', url: 'https://github.com/sureshvasantha/petclinic-frontend.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo "Installing npm dependencies..."
                sh 'npm ci'
            }
        }

        stage('Build') {
            steps {
                echo "Building Angular app..."
                sh "npx ng build --configuration production"
            }
        }

        stage('Archive Artifacts') {
            steps {
                echo "Archiving build output..."
                archiveArtifacts artifacts: 'dist/**/*', fingerprint: true
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo "Deploying to server..."
                // Example: copy files or trigger deploy
                // sh 'scp -r dist/* user@server:/var/www/html/'
            }
        }
    }

    post {
        success {
            echo 'Build succeeded'
        }
        failure {
            echo 'Build failed'
        }
    }
}
