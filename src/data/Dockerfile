# get shiny server and R from the rocker project
FROM rocker/r-ver:4.2.0

# system libraries
# Try to only install system libraries you actually need
# Package Manager is a good resource to help discover system deps
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev
  

# install R packages required 
# install packages with versions defined
RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_version('rdbnomics', version = '0.6.4', dependencies= T)"
RUN R -e "remotes::install_version('quantmod', version = '0.4.20', dependencies= T)"
RUN R -e "remotes::install_version('feather', version = '0.3.5', dependencies= T)"

# copy the app directory into the image
RUN mkdir -p /src/data/
COPY ./src/data/upstream.R /src/data/upstream.R 
COPY ./src/data/downstream.R /src/data/downstream.R 
COPY ./src/data/updatedata.R .


## create directories
RUN mkdir -p /data/raw/
RUN mkdir -p /data/processed/
COPY ./data/raw/crb.csv /data/raw/crb.csv
COPY ./data/raw/pce.csv /data/raw/pce.csv

# Run the script
CMD ["Rscript",  "updatedata.R"]