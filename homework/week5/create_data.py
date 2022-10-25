# libraries
import numpy as np
import pandas as pd
import pyarrow
import time

# generate the data 
Location = ['USA','India','Prague','Berlin',
            'Dubai','Indonesia','Vienna']
Age = ['Under 18','Between 18 and 64','65 and older']
Gender = ['Female','Male','Other']
Height = [160,165,170,175,180,185,190,200]
data = pd.DataFrame()                                                                                                                                                                     
N = 1000000                                                                                                                                                                                
data["Location"] = np.random.choice(Location, size=N)                                                                                                                                     
data["Age"] = np.random.choice(Age, size=N)                                                                                                                                               
data["Gender"] = np.random.choice(Gender, size=N) 
data["Height"] = np.random.choice(Gender, size=N) 
data["Height2"] = data["Height"]

# save as hdf
start = time.time()
data.to_hdf(path_or_buf = "homework/week5/data.hdf", 
            key = "data")
end = time.time()
time_hdf = end - start

# save data asn feather
start = time.time()
data.to_feather("homework/week5/data.feather")
end = time.time()
time_feater = end - start

# save data as parquet
start = time.time()
data.to_parquet("homework/week5/data.parquet", 
                engine = "pyarrow")
end = time.time()
time_parquet = end - start

# write time to the .txt file
with open('homework/week5/time.txt', 'w') as f:
    f.write("HDF: " + str(time_hdf) + "\n")
    f.write("Feater: " + str(time_feater) + "\n")
    f.write("Parquet: " + str(time_parquet))