# Use official n8n image as base image
FROM n8nio/n8n

# Install necessary dependencies for Puppeteer (headless Chromium)
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

# Set environment variables for Puppeteer and n8n
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV NODE_ENV=production
ENV N8N_PROTOCOL=https
ENV N8N_PORT=5678

# Install Puppeteer for n8n automation (optional, if using browser automation)
RUN npm install puppeteer

# Set the working directory for n8n
WORKDIR /data

# Expose the n8n port
EXPOSE 5678

# Volume for persistent n8n data
VOLUME ["/data"]

# Start n8n
CMD ["n8n"]

