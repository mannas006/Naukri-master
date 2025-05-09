FROM python:3.11-slim

# Install Chrome dependencies (without libindicator7)
RUN apt-get update && apt-get install -y \
    wget unzip curl gnupg libglib2.0-0 libnss3 libgconf-2-4 libfontconfig1 libxss1 \
    libappindicator1 libasound2 xdg-utils xvfb fonts-liberation \
    libatk-bridge2.0-0 libgtk-3-0 && rm -rf /var/lib/apt/lists/*

# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt-get -fy install

# Set display environment variable
ENV DISPLAY=:99

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Default command to run your script
CMD ["python", "naukri.py"]
