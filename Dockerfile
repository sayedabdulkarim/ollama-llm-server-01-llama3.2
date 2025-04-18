FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl bash

# Install Ollama manually
RUN curl -fsSL https://ollama.com/install.sh | sh

# Expose the port
EXPOSE 11434

# Start server and pull model
CMD bash -c "ollama serve & sleep 5 && ollama pull llama3.2:1b && tail -f /dev/null"
