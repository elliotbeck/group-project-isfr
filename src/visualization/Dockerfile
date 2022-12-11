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
RUN R -e "remotes::install_version('gridExtra', version = '2.3', dependencies= T)"
RUN R -e "remotes::install_version('lattice', version = '0.20.41', dependencies= T)"
RUN R -e "remotes::install_version('viridisLite', version = '0.4.0', dependencies= T)"
RUN R -e "remotes::install_version('feather', version = '0.3.5', dependencies= T)"

# copy the app directory into the image
COPY ./src/visualization/visualize.R .


## create directories
RUN mkdir -p /data/processed/
RUN mkdir -p /src/figures/
RUN mkdir -p /reports/figures/data/
COPY ./data/processed/* /data/processed/
COPY ./src/visualization/data/* /src/visualization/data/

# Run the script
CMD ["Rscript",  "visualize.R"]