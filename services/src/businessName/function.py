import json
import requests

# Constants
base_url = "https://data.gov.au/data/api/3/action/datastore_search"
data_set = "resource_id=55ad4b1c-5eeb-44ea-8b29-d410da431be3"


def handler(event, context):

    # Build url
    url = f"{base_url}?{data_set}&limit=1"

    # Make the call
    try:
        response = requests.get(url)

    except Exception as error:
        print("Error in request: ", str(error))

    return {
        "statusCode": 200,
        "body": response.json()
    }