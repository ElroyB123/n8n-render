# Base image: Use Debian-based Node for apt compatibility
FROM n8nio/n8n:latest

# Install Chromium dependencies
USER root

RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-6 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libgtk-3-0 \
    libxtst6 \
    libxss1 \
    libx11-xcb1 \
    libdrm2 \
    libxshmfence1 \
    libudev1 \
    libgbm-dev \
    libgcrypt20 \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set Puppeteer to use installed Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Add this so Chromium doesn't crash inside Docker
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

# Create required folders for n8n
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

USER node

# Expose default port
EXPOSE 5678

CMD ["n8n"]
