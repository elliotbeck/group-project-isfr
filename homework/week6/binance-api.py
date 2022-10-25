# import libraries
import requests
import datetime
import json
import pandas as pd

# define the root url
ROOT_URL = "https://api.binance.com/api/v3"

# define the endpoint
endpoint = "klines"

# construct request URL
req = "{root_url}/{endpoint}?symbol={symbol}&interval={interval}&startTime={startTime}&limit={limit}" \
     .format(root_url=ROOT_URL,
             endpoint="klines",
             symbol="BTCUSDT",
             interval='1h',
             startTime='1661983200',
             limit=75)
print(req)

# send request to the binance server & receive a response
resp = requests.get(req)
print(resp)

# convert to DataFrame
data = pd.DataFrame.from_records(
    resp.json())

# define the function
def binance_data(symbol, startTime):
    #construct unix timestamp
    formated_date = datetime.datetime.strptime(startTime,"%Y-%m-%d")
    unix_timestamp = str(round(datetime.datetime.timestamp(formated_date)))

    # construct request URL
    req = "https://api.binance.com/api/v3/klines?" + "symbol=" + symbol + "&interval=1h&startTime=" + unix_timestamp + "&limit=75"
    
    # get the data
    resp = requests.get(req)
    
    # convert to DataFrame
    data = pd.DataFrame.from_records(resp.json())
    
    # cut the data
    return(data)
    
binance_data(symbol = "BTCUSDT", 
             startTime = "2022-09-01")

