FROM mcr.microsoft.com/playwright:v1.46.1-focal

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm install --save-dev prettier

CMD ["npx","playwright","test", "e2e/example.spec.js", "--reporter=html", "format-check", "prettier", "."]