FROM debian:bookworm-slim

# Install deps
RUN apt-get update && apt-get install -y curl bash ca-certificates && apt-get clean

# Install Ollama CLI
RUN curl -fsSL https://ollama.com/install.sh | bash

# Symlink ollama
RUN ln -s /root/.ollama/bin/ollama /usr/local/bin/ollama || true

# Check version
RUN ollama --version

# Expose Ollama port
EXPOSE 11434

# Start, wait for config, patch host, pull model
CMD ["sh", "-c", "\
ollama serve & \
while [ ! -f /root/.ollama/config.toml ]; do sleep 1; done && \
sed -i 's/localhost/0.0.0.0/g' /root/.ollama/config.toml && \
ollama pull llama3.2:1b && \
tail -f /dev/null"]
