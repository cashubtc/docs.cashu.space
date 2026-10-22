# syntax = docker/dockerfile:1

# Use a supported LTS release with the October 2026 security fixes.
ARG NODE_VERSION=24.22.1
FROM node:${NODE_VERSION}-slim AS base

LABEL fly_launch_runtime="Next.js"

# Next.js app lives here
WORKDIR /app

# Set production environment
ENV NODE_ENV="production"


# Throw-away build stage to reduce size of final image
FROM base AS build

# Install packages needed to build node modules
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential node-gyp pkg-config python-is-python3

# Install node modules
COPY package-lock.json package.json ./
RUN npm ci --include=dev

# Copy application code
COPY . .

# Build arguments for Next.js public env vars (must be available at build time)
ARG NEXT_PUBLIC_DOCSEARCH_APP_ID
ARG NEXT_PUBLIC_DOCSEARCH_API_KEY
ARG NEXT_PUBLIC_DOCSEARCH_INDEX_NAME

# Build application
RUN npm run build

# Remove development dependencies
RUN npm prune --omit=dev


# Final stage for app image
FROM base

# Copy built application
COPY --from=build /app/.next/standalone /app
COPY --from=build /app/.next/static /app/.next/static
COPY --from=build /app/public /app/public

# Start the server
EXPOSE 3000
CMD [ "node", "server.js" ]
