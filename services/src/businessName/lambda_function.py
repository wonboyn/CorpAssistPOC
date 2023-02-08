# Standard imports
import json
import logging
import os

# Third party imports
import urllib3

# Constants
base_url = "https://data.gov.au/data/api/3/action/datastore_search"
data_set = "resource_id=55ad4b1c-5eeb-44ea-8b29-d410da431be3"


# Setup logging
logging.basicConfig()
logger = logging.getLogger()


def lambda_handler(event, context):

    # Build url
    url = f"{base_url}?{data_set}&limit=1"

    # Establish a handle
    http = urllib3.PoolManager()

    # Make the call
    try:
        response = http.request("GET", url)

    except Exception as error:
        print("Error in request: ", str(error))

    return {
        "statusCode": 200,
        "body": json.loads(response.data.decode("utf-8"))
    }