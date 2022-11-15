# downstream.py
import pandas as pd

def get_inflation_data(series = "CPIAUCSL", 
                       start_dt="1960-01-01", 
                       end_dt="2020-01-01"):
    """Get inflation data from the DB."""
    filename = "data/raw/" +  series + ".ftr"

    # get data from the DB
    data = pd.read_feather(filename)
    
    # transform data
    data["date"] = pd.to_datetime(data["date"])
    
    # cut data  
    data = data[(data["date"] >= start_dt) & (data["date"] <= end_dt)]
    
    return data