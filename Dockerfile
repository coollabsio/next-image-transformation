FROM oven/bun:alpine
WORKDIR /app
COPY . .
EXPOSE 3000
CMD bun run start