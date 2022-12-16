# this script is used to update the data in the docker container
# source the upstream script
source("/src/data/upstream.R")
upstream()
# source the downstream script
source("/src/data/downstream.R")
downstream()
