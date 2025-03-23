FROM apache/superset:dockerize
USER root

RUN apk update && apk add --no-cache \
    python3-dev \
    py3-pip \
    build-base \
    pkgconf \
    postgresql-dev

COPY ./requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir --break-system-packages -r /tmp/requirements.txt