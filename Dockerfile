FROM mcr.microsoft.com/playwright:v1.47.2-noble AS base
WORKDIR /usr/src/app

FROM base AS install-dependencies
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci

FROM base AS audit-report
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=bind,source=/usr/src/app/node_modules,target=node_modules,from=install-dependencies \
    --mount=type=cache,target=/root/.npm \
    npm run audit-report

FROM base AS check-package-json
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=/usr/src/app/node_modules,target=node_modules,from=install-dependencies \
    --mount=type=cache,target=/root/.npm \
    npm run check-package-json

FROM base AS format-check
RUN --mount=type=bind,source=.,target=.,readwrite \
    --mount=type=bind,source=/usr/src/app/node_modules,target=node_modules,from=install-dependencies,readwrite \
    --mount=type=cache,target=/root/.npm \
    --mount=type=cache,target=node_modules/.cache/prettier \
    npm run format-check

FROM base AS lint-report
RUN --mount=type=bind,source=.,target=/usr/src/app,readwrite \
    --mount=type=bind,source=/usr/src/app/node_modules,target=node_modules,from=install-dependencies,readwrite \
    --mount=type=cache,target=/root/.npm \
    --mount=type=cache,target=node_modules/.cache/eslint \
    npm run lint-report

FROM base AS spell-check
RUN --mount=type=bind,source=.,target=.,readwrite \
    --mount=type=bind,source=/usr/src/app/node_modules,target=node_modules,from=install-dependencies \
    --mount=type=cache,target=/root/.npm \
    npm run spell-check

FROM base AS test-stage
ARG DATE 
RUN --mount=type=bind,source=e2e,target=e2e \
    --mount=type=bind,source=playwright.config.js,target=playwright.config.js \
    --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=/usr/src/app/node_modules,target=node_modules,from=install-dependencies \
    --mount=type=cache,target=/root/.npm \
    npx playwright test e2e/example.spec.js 

FROM scratch AS export-report
COPY --from=test-stage /usr/src/app/html-report/index.html /

FROM scratch AS export-audit-report
COPY --from=audit-report /usr/src/npm-audit-report.html /

FROM scratch AS export-lint-report
COPY --from=lint-report /usr/src/lint-report.html /
