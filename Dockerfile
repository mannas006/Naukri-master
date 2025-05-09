FROM python:3.11-slim

# Install dependencies for Chrome and Python
RUN apt-get update && apt-get install -y \
    curl unzip gnupg wget libvulkan1 \
    fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 \
    libcups2 libdbus-1-3 libgdk-pixbuf2.0-0 libnspr4 libnss3 libx11-xcb1 \
    libxcomposite1 libxdamage1 libxrandr2 xdg-utils xvfb libgbm1 libgtk-3-0 \
    && rm -rf /var/lib/apt/lists/*

# Download and install Google Chrome
RUN wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i chrome.deb || apt-get -fy install \
    && rm chrome.deb

# Set display port for headless Chrome
ENV DISPLAY=:99

# Create app directory
WORKDIR /app
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run your script
CMD ["python", "naukri.py"]
