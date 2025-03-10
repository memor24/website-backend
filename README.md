# Architecture
![new sitemap](https://github.com/user-attachments/assets/20050cf5-a8e5-454b-a2d5-b6adb7ff6ef0)

# Backend
## Lambda Function
Since we use the serverless function, also known as FaaS-Function as a Service- this is a Python code for the Lambda serverless function that updates a counter when the page is viewd and stores it in a DynamoDB table like this:

![my ddb](https://github.com/memor24/myWebsite-backend/assets/112832477/e1eba4df-9a27-46f2-8681-32054399f111)

The JavaScript invokes the lambda funtion directly and shows the updated view count on the page. \
Also the code for Lambda function is Dockerized and integrated via Jenkins, can be deployed to ECR for scalability. \
An application loadbalancer (AWS-ALB) can also be added and further secured using a web application firewall (WAF).

## Infrastructure as Code
The serverless application modeling (SAM) is used here. Other resources can be defined as Terraform code and deployed automatically. 

