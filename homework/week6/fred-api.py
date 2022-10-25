# import libraries
import requests
import datetime
import json
import pandas as pd

# api key 
api_key = "abc123"

# define the root url
ROOT_URL = "https://api.stlouisfed.org/fred/series"

# define the endpoint
endpoint = "observations"

# construct request URL
req = "{root_url}/{endpoint}?series_id={series_id}&api_key={api_key}&observation_start={observation_start}" \
     .format(root_url=ROOT_URL,
             endpoint="observations",
             series_id="UNRATE",
             observation_start="2020-01-01",
             api_key=api_key)
print(req)

# send request to the binance server & receive a response
resp = requests.get(req)
print(resp)

# convert to DataFrame
data = pd.DataFrame.from_records(
    resp.json())