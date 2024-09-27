FROM mcr.microsoft.com/playwright:v1.46.1-focal

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

COPY . .

FROM smalovitsa/e2eexeua:latest AS format-check

RUN npm run format:check

FROM smalovitsa/e2eexeua:latest AS lint-code

RUN npm run lint-code

FROM smalovitsa/e2eexeua:latest AS spell-check

RUN npm run spell-check

FROM smalovitsa/e2eexeua:latest as test-stage

ARG DATE 

RUN npx playwright test e2e/example.spec.js

FROM scratch as export-report

COPY --from=test-stage /usr/src/app/html-report/index.html /
