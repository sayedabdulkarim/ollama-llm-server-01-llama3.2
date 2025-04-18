FROM debian:bookworm-slim

# Install deps
RUN apt-get update && apt-get install -y curl bash ca-certificates && apt-get clean

# Install Ollama CLI
RUN curl -fsSL https://ollama.com/install.sh | bash

# Symlink ollama
RUN ln -s /root/.ollama/bin/ollama /usr/local/bin/ollama || true

# Check version
RUN ollama --version

# Expose the correct port
EXPOSE 11434

# CMD: run Ollama and pull model, then keep server alive
CMD ["sh", "-c", "ollama serve & sleep 5 && ollama pull llama3.2:1b && tail -f /dev/null"]
