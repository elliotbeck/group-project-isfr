# Define base image
FROM continuumio/miniconda3

# Create Conda environment from the YAML file
COPY environment.yml .
RUN conda env create -f environment.yml

# Override default shell and use bash
SHELL ["conda", "run", "-n", "env", "/bin/bash", "-c"]
 
# Activate Conda environment and check if it is working properly
RUN echo "Making sure matplotlib is installed correctly..."
RUN python -c "import matplotlib"

RUN mkdir -p /data/

ADD /data/coding-environment-exercise.csv /data/coding-environment-exercise.csv

ADD csv-to-scatter-plot.py .

# The code to run when container is started:
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "env", "python", "csv-to-scatter-plot.py"]