# Standard imports
import json
import logging
import os

# Third party imports
import boto3


# Setup client
client = boto3.client('lambda')


# Setup logging
logging.basicConfig()
logger = logging.getLogger()


def __router(event):

    # Debug logging
    if os.getenv("DEBUG"):
        logger.debug(f"Received event: {event}")

    # Determine the lambda to call
    intent_name = event['sessionState']['intent']['name']
    fn_name = os.environ.get(intent_name)

    # Debug logging
    if os.getenv("DEBUG"):
        logger.debug(f"Intent: {intent_name} -> Lambda: {fn_name}")

    # Invoke the appropriate lambda
    if (fn_name):

        # Debug logging
        if os.getenv("DEBUG"):
            logger.debug(f"Calling lambda: {fn_name}")

        invoke_response = client.invoke(FunctionName=fn_name, Payload = json.dumps(event))

        # Debug logging
        if os.getenv("DEBUG"):
            logger.debug(f"Received response: {invoke_response}")

        # Return the response
        payload = json.load(invoke_response['Payload'])
        return payload

    raise Exception('No environment variable for intent: ' + intent_name)


def lambda_handler(event, context):
    response = __router(event)
    return response
