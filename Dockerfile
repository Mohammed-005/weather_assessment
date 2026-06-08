FROM python:3.12-slim AS builder
WORKDIR /app
COPY weather.py .

FROM alpine:3.19
WORKDIR /app
RUN apk add --no-cache python3
COPY --from=builder /app/weather.py .
CMD ["python3", "weather.py"]
