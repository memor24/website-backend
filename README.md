# Architecture
![sitemap](https://github.com/memor24/myWebsite-backend/assets/112832477/c9f9227a-8520-4843-930a-ee418bfe0bce)

# Backend
## Serverless
This is a Python code for Lambda serverless function that updates a counter when the page is viewd and stores it in a DynamoDB database table like this:

![my ddb](https://github.com/memor24/myWebsite-backend/assets/112832477/e1eba4df-9a27-46f2-8681-32054399f111)

The JavaScript invokes the lambda funtion directly and shows the updated view count on the page. An application loadbalancer (AWS-ALB) will be added for additional security and will be secured further using a web application firewall (WAF). A Pytest code will be added into the continuous delivery in the test environment.

## Infrastructure as Code
TBU: All the AWS resources will be defined as Terraform code and deployed using Terraform commands automatically.
Also the code for Lambda function will be Dockerized and integrated via Jenkins to ECR. The Jenkins pipeline will be fully automated with Groovy.
