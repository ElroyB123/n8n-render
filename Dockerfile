# Use the official n8n image as the base image
FROM n8nio/n8n

# Install Chromium and dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxshmfence-dev \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for Puppeteer
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV NODE_ENV=production

# Install Puppeteer (needed for n8n's browser automation)
RUN npm install puppeteer

# Set the working directory for n8n
WORKDIR /data

# Expose the default n8n port
EXPOSE 5678

# Create a volume for persistent n8n data
VOLUME ["/data"]

# Start n8n
CMD ["n8n"]

