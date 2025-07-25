# 1. Build stage
FROM rust:1.78 as builder
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y pkg-config libssl-dev
RUN cargo build --release

# 2. Runtime stage
FROM debian:buster-slim
WORKDIR /app
COPY --from=builder /app/target/release/elso_axum_projekt /app/app
ENV PORT=3000
EXPOSE 3000
CMD ["./app"]
