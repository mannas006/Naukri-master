# Use a base image with Python
FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    chromium \
    libgconf-2-4 \
    libnss3 \
    libx11-xcb1 \
    libgbm1 \
    libasound2 \
    libxss1 \
    libappindicator3-1 \
    libxtst6 \
    x11-utils \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install selenium

# Set Chrome options
ENV CHROME_BIN="/usr/bin/chromium"
ENV DISPLAY=:99

# Set up X virtual framebuffer (Xvfb) for headless mode
RUN apt-get update && apt-get install -y xvfb

# Create a directory for your app
WORKDIR /app

# Copy the local files to the Docker container
COPY . /app

# Set the entrypoint to your script (or main app)
CMD ["python", "naukri.py"]
