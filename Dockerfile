FROM python:3.9-slim-buster

# Install Chrome and ChromeDriver
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    wget https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver

# Set Chrome options to avoid common issues in containers
ENV CHROME_OPTS="--headless --no-sandbox --disable-dev-shm-usage --disable-gpu"

# Install Python dependencies
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy your script
COPY naukri.py .
COPY ocv/ .  # Copy the resume directory
COPY mcv/ .

# Run the script
CMD ["python", "naukri.py"]