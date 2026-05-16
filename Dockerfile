FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y curl unzip ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN curl -LO https://github.com/rapiz1/rathole/releases/latest/download/rathole-x86_64-unknown-linux-gnu.zip && \
    unzip rathole-x86_64-unknown-linux-gnu.zip && \
    chmod +x rathole

COPY client.toml /app/client.toml

CMD ["/app/rathole", "/app/client.toml"]
