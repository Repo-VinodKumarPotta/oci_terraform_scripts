# FibonacciService
The purpose of this Microservice is to fetch weather forecast for next 5 days from OpenWeather API.

## Built With

1. IntelliJ IDEA (2019.3)
2. Dropwizard (https://www.dropwizard.io/en/latest/getting-started.html)
3. Java 8 
4. Maven (3.6.3)
5. Terraform (v1.0.4)
6. Mockito (20.10.7)

## Getting Started

Please follow below steps to import and run the project. 

For Application :
+++++++++++++++++
1. Open IntelliJ IDEA
2. Goto VCS and click on "Get from Version Control" 
3. Select Git and enter Git master repository URL (https://github.com/Repo-VinodKumarPotta/FibonacciService.git)
4. Goto terminal and run "mvn clean install package -U"
5. Once the build is successful then navigate to target folder and run below command 
6. Convert jar to an docker image and upload to docker-hub

For Terraform :
+++++++++++++++
1. Open IntelliJ IDEA
2. Goto VCS and click on "Get from Version Control" 
3. Initialize Git and enter Git main repository URL (https://github.com/Repo-VinodKumarPotta/oci_terraform_scripts.git)
4. Goto respective folder and run below commands to create compartment, vcn, subnet..etc
    terrform init --> To initialize folder with terraform 
    terrform apply --> To create resources
    terrform destroy --> To destroy resource 

## Usage
I have uploaded postman collection in my Github. 

Fibonacci series data will be retrieved,
1. Number eg:7

## Contact

Vinod Kumar Potta

vinodkumar.potta@outlook.com

Project Link: https://github.com/Repo-VinodKumarPotta/WeatherForecastApplication.git

Branch Name: main 
