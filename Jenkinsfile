// Uses Declarative syntax to run commands inside a container.
pipeline {
    agent any
    
    parameters {
        choice(name: "Env", choices: ["LIVE", "2018"])
        choice(name: "Tiers", choices: ["DEV", "QA"])        
    }
    
    stages {
        stage("Switch Case") {
            steps {
                script {
                    switch(params.Env) {
                        case "LIVE": 
                             switch(params.Tiers) {
                                 case "DEV":  
                                        echo " Running in ${params.Tiers} tier of ${params.Env} Env"
                                        sh " sh ${params.Env}/${params.Tiers}/dev.sh "; break
                                 case "QA":
                                    sh """  
                                        echo "Running in ${params.Tiers} tier of ${params.Env} Env"
                                        pwd
                                        sh ${params.Env}/${params.Tiers}/qa.sh
                                        """; break
                                 defaut: echo " No tier inside ${params.Env}"; break
                             } ; break
                        case "2018": 
                             switch(params.Tiers) {
                                 case "DEV":  
                                        echo " Running in ${params.Tiers} tier of ${params.Env} Env"
                                        sh " sh ${params.Env}/${params.Tiers}/dev.sh "; break
                                 case "QA": 
                                        echo " Running in ${params.Tiers} tier of ${params.Env} Env"
                                        sh " sh ${params.Env}/${params.Tiers}/qa.sh "; break
                             } ; break   
                    }
                }
            }
        }
    }
}

