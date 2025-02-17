# test step of the cicd pipeline

import pytest
import boto3

from app import lambda_handler  # import the Lambda function

@pytest.fixture
def mock_dynamodb_table(mocker):
    mock_table = mocker.MagicMock()
    mock_table.get_item.return_value = {
        'Item': {'id': 'views', 'counter': 10}
    }
    mock_table.put_item.return_value = {}

    mock_dynamodb = mocker.patch('boto3.resource')
    mock_dynamodb.return_value.Table.return_value = mock_table

    return mock_table

def test_lambda_handler(mock_dynamodb_table):
    event = {}
    context = {}

    result = lambda_handler(event, context)

    assert result == 11
    mock_dynamodb_table.put_item.assert_called_once_with(
        Item={'id': 'views', 'counter': 11}
    )
