import boto3

dynamodb = boto3.resource('dynamodb')  #define ddb client
table = dynamodb.Table('views_counter')  #select the ddb table

def lambda_handler(event, context):  
    #get Key
    mydata = table.get_item(Key={
        'id': 'views'
    })

    #update the Item
    counter = mydata ['Item']['counter']
    counter = counter + 1

    #put updated Item into ddb
    mydata = table.put_item(Item={
        'id': 'views',
        'counter': counter
    })

    return counter

