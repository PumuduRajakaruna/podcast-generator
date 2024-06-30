FROM ubuntu:latest

# Install Python, pip, and git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git 

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install PyYAML in the virtual environment
RUN pip install --upgrade pip
RUN pip install PyYAML

# Copy the feed.py script to /usr/bin
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint.sh script to the root
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint.sh is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
