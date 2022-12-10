# get shiny server and R from the rocker project
FROM rocker/shiny:4.0.5

# system libraries
# Try to only install system libraries you actually need
# Package Manager is a good resource to help discover system deps
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev
  

# install R packages required 
# install packages with versions defined
RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_version('DT', version = '0.17', dependencies= T)"
RUN R -e "remotes::install_version('shinydashboard', version = '0.7.1', dependencies= T)"
RUN R -e "remotes::install_version('lattice', version = '0.20.41', dependencies= T)"
RUN R -e "remotes::install_version('dygraphs', version = '1.1.1.6', dependencies= T)"
RUN R -e "remotes::install_version('feather', version = '0.3.5', dependencies= T)"
RUN R -e "remotes::install_version('xts', version = '0.12.1', dependencies= T)"

# copy the app directory into the image
COPY ./dashboard/* /srv/shiny-server/
COPY ./src/visualization/data/* /srv/shiny-server/
COPY ./data/processed/* /srv/shiny-server/

# run app
CMD ["/usr/bin/shiny-server"]