# Build stage with musl for static linking
FROM clux/muslrust:stable as builder

WORKDIR /app
COPY . .

# Build the app statically
RUN cargo build --release

# Runtime stage: use scratch or alpine
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/elso_axum_projekt ./app

EXPOSE 3000
ENV PORT=3000
CMD ["./app"]
