FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates curl git jq make gcc libc6-dev pkg-config gh \
    x11-apps libx11-6 libxext6 libxrender1 libxrandr2 libxi6 libsdl2-2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Install Go
ENV GO_VERSION=1.22.5
RUN curl -fsSL https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz -o /tmp/go.tgz && \
    tar -C /usr/local -xzf /tmp/go.tgz && \
    rm /tmp/go.tgz
ENV PATH="/usr/local/go/bin:${PATH}"

# Install boot.dev CLI
RUN go install github.com/bootdotdev/bootdev@latest && \
    ln -sf /root/go/bin/bootdev /usr/local/bin/bootdev

# Python deps
RUN pip install --no-cache-dir uv

WORKDIR /app
