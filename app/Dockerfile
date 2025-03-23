# Extend over the airflow base image
FROM apache/superset:latest
USER root
RUN apt-get update && apt-get install -y \
    python3-dev \
    build-essential \
    pkg-config

COPY ./requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt
RUN pip list