FROM oven/bun:alpine
WORKDIR /app
COPY . .
CMD bun run start