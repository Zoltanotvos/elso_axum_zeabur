# Build stage
FROM rust:1.79 as builder
WORKDIR /app
COPY . .
RUN cargo build --release

# Run stage
FROM debian:bullseye-slim
WORKDIR /app
COPY --from=builder /app/target/release/zeabur-rust-demo .
CMD ["./zeabur-rust-demo"]

