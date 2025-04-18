FROM debian:bookworm-slim

# Install deps
RUN apt-get update && apt-get install -y curl bash ca-certificates && apt-get clean

# Install Ollama CLI
RUN curl -fsSL https://ollama.com/install.sh | bash

# Symlink ollama in case it lands in ~/.ollama/bin
RUN ln -s /root/.ollama/bin/ollama /usr/local/bin/ollama || true

# Check if it exists
RUN ollama --version

# Expose port
EXPOSE 11434

# Final CMD
CMD bash -c "ollama serve & sleep 5 && ollama pull llama3.2:1b && tail -f /dev/null"