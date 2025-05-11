#!/bin/bash

# Update package lists
apt-get update -y

# Install dependencies for Google Chrome and ChromeDriver
apt-get install wget curl unzip -y

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
apt-get -f install -y

# Install ChromeDriver dependencies
apt-get install -y libxss1 libappindicator3-1 libgdk-pixbuf2.0-0 libnss3 libgconf-2-4

# Clean up
rm google-chrome-stable_current_amd64.deb
