# Frontend

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/v4224/Frontend.git
   ```
   
2. Run the project manually:
   * Install NodeJS
   * Install all the dependencies inject
     ```sh
     npm install --force
     ```
   * Build and run project
     ```sh
     npm start
     ```
   Open [http://192.168.189.99:3000](http://192.168.189.99:3000) to view it in your browser.

3. Run the project by using docker manually:
   * Build docker image
     ```sh
     docker build -t onlineshop-frontend .
     ```
   * Run container
     ```sh
     docker run --name onlineshop-frontend -dp 3000:80 onlineshop-frontend
     ```

4. Run the project by using docker with Jenkins CI/CD pipeline:
   * Set jenkins agent as lab-server
   * Run pipeline in Jenkinsfile on Jenkins server
---
