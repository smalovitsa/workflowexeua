FROM mcr.microsoft.com/playwright:v1.47.2-noble AS base

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

COPY . .

FROM smalovitsa/e2eexeua:latest AS audit-report

RUN npm run audit-report

FROM smalovitsa/e2eexeua:latest AS check-package-json

RUN npm run check-package-json

FROM smalovitsa/e2eexeua:latest AS format-check

RUN npm run format-check

FROM smalovitsa/e2eexeua:latest AS lint-report

RUN npm run lint-report

FROM smalovitsa/e2eexeua:latest AS spell-check

RUN npm run spell-check

FROM smalovitsa/e2eexeua:latest AS test-stage

ARG DATE 

RUN npx playwright test e2e/example.spec.js

FROM scratch AS export-report

COPY --from=test-stage /usr/src/app/html-report/index.html /

FROM scratch AS export-audit-report

COPY --from=audit-report /usr/src/app/npm-audit-report.html /

FROM scratch AS export-lint-report

COPY --from=lint-report /usr/src/app/eslint.html /
