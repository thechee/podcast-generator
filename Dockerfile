FROM ubuntu:22.04

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3-pip \
    git

RUN python3.10 -m venv /opt/venv
RUN /opt/venv/bin/pip install --upgrade pip
RUN /opt/venv/bin/pip install PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /entrypoint.sh

# Ensure the virtual environment's Python and pip are used
ENV PATH="/opt/venv/bin:$PATH"

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]