FROM mcr.microsoft.com/playwright:v1.46.1-focal

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

