FROM n8nio/n8n:latest

USER root

# Устанавливаем необходимые инструменты
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    yarn

# Устанавливаем переменные окружения для Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Устанавливаем community node для Puppeteer
RUN cd /usr/local/lib/node_modules/n8n && npm install n8n-nodes-puppeteer

USER node
