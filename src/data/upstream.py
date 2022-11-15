# load libraries
import os
from dotenv import load_dotenv
import pandas as pd
import requests

# load environment variables
load_dotenv()

# extract fred api key
fred_api_key = os.getenv('fred_api_key')

def put_inflation_data(series = "CPIAUCSL"):
    """Store inflation data to the DB."""
    # define the root url
    ROOT_URL = "https://api.stlouisfed.org/fred/series"

    # construct request URL
    req = "{root_url}/{endpoint}?series_id={series_id}&api_key={api_key}" \
        .format(root_url=ROOT_URL,
                endpoint="observations",
                series_id=series,
                api_key=fred_api_key)

    # send request to the binance server & receive a response
    resp = requests.get(req + str("&file_type=json"))

    # convert to DataFrame
    data = pd.DataFrame.from_records(
        resp.json())

    obs = [d.get('value') for d in data["observations"]]
    date = [d.get('date') for d in data["observations"]]
    data = pd.DataFrame(list(zip(date, obs)),
                        columns =['date', 'val'])


    data.to_feather("data/raw/CPIAUCSL.ftr")
    print("Data stored to the DB.")

if __name__ == "__main__":
    put_inflation_data()
