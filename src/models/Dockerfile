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
RUN R -e "remotes::install_version('feather', version = '0.3.5', dependencies= T)"

# copy the app directory into the image
COPY ./src/models/analysis.R .


## create directories
RUN mkdir -p /data/processed/
RUN mkdir -p /src/visualization/data/
COPY ./data/processed/* /data/processed/

# Run the script
CMD ["Rscript",  "analysis.R"]