FROM python:3-slim

RUN pip install --no-cache-dir numpy matplotlib

RUN mkdir -p /data/

ADD /data/coding-environment-exercise.csv /data/coding-environment-exercise.csv

ADD csv-to-scatter-plot.py .

CMD [ "python", "./csv-to-scatter-plot.py" ]