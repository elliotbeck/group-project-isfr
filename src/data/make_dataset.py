from src.data import downstream, upstream

def main():
    """ Runs data ingestion and processing scripts to 
        turn raw data from (../raw) into
        cleaned data ready to be analyzed (saved in ../processed).
    """
    # get the raw data from fred
    upstream.put_inflation_data()
    
    # get the processed data
    return(downstream.get_inflation_data())


if __name__ == '__main__':
    main()
