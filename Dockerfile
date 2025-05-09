FROM python:3.11-slim

# Install system dependencies for Chrome
RUN apt-get update && apt-get install -y \
    wget unzip curl gnupg libglib2.0-0 libnss3 libgconf-2-4 libfontconfig1 libxss1 \
    libappindicator1 libindicator7 libasound2 xdg-utils xvfb fonts-liberation \
    libatk-bridge2.0-0 libgtk-3-0 && rm -rf /var/lib/apt/lists/*

# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt-get -fy install

# Environment display for headless
ENV DISPLAY=:99

# Set working directory
WORKDIR /app

# Copy files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run script
CMD ["python", "naukri.py"]
