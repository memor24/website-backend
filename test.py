# test step of the cicd pipeline

import boto3
from app import lambda_handler  # import the Lambda function

def test_lambda_handler():
    event = {}
    context = {}
    response = lambda_handler(event, context)
    assert response["statusCode"] == 200
