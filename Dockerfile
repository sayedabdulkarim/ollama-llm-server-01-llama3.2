FROM ollama/ollama

EXPOSE 11434

CMD ["sh", "-c", "ollama serve & sleep 5 && ollama pull llama3.2:1b && tail -f /dev/null"]
