# Architecture
![sitemap](https://github.com/memor24/myWebsite-backend/assets/112832477/1d88183f-5ce9-4343-9bf8-e3a1522e7590)

# Backend
## Serverless
This is a Python code for Lambda serverless function that updates a counter when the page is viewd and stores it in a DynamoDB table like this:

![my ddb](https://github.com/memor24/myWebsite-backend/assets/112832477/e1eba4df-9a27-46f2-8681-32054399f111)

The JavaScript invokes the lambda funtion directly and shows the updated view count on the page. An application loadbalancer (AWS-ALB) will be added for additional security and will be secured further using a web application firewall (WAF). A Pytest code will be added into the continuous delivery in the test environment.

## Infrastructure as Code
TBU: All the AWS resources are defined as Terraform code and deployed using Terraform commands automatically.
Also the code for Lambda function is Dockerized and integrated via Jenkins to ECR. The Jenkins pipeline will be fully automated with Groovy.
