#
# Dockerfile: configuration for building the images for the web app.
#

# Base python image
FROM python:3.12-slim-bookworm
# Add the project to the python path
ENV PYTHONPATH /app
# Send all output on stdout and stderr straight to the container logs
ENV PYTHONUNBUFFERED 1
# Set the locale
ENV LC_ALL C.UTF-8
# Terminals support 256 colours
ENV TERM xterm-256color

# Create the mount point for the project files
RUN mkdir /app
WORKDIR /app

# Install OS dependencies

RUN apt-get update \
    && apt-get install -y --no-install-recommends

RUN apt-get install -y --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install project requirements

# Copy across all the files needed to install the app as an editable
# package since the volume has not been mounted yet. The assumption
# is that, at least initially, Docker is just used to run the demo
# demo site to avoid having to install PostgreSQL natively.

COPY setup.py .
COPY README.md .
COPY src ./src

COPY requirements/demo.txt /tmp/requirements.txt

RUN pip install --upgrade setuptools pip wheel \
    && pip install pip-tools \
    && pip install -r /tmp/requirements.txt
