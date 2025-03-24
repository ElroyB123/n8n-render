FROM n8nio/n8n

# Install Chromium dependencies
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
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
    libnss3-dev \
    libx11-xcb1 \
    libdbus-glib-1-2 \
    libnss3 \
    libxshmfence1 \
    libgdk-pixbuf2.0-0 \
    libdrm2 \
    libgbm-dev \
    libgcrypt20 \
    libudev1 \
    && apt-get clean


# Set environment variables for Puppeteer
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV NODE_ENV=production

# Create app directory
WORKDIR /data

# Install n8n globally
RUN npm install -g n8n

# Expose default n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]

