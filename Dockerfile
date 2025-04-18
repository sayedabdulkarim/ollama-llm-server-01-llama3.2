FROM ollama/ollama

RUN ollama pull llama3.2:1b

EXPOSE 11434

CMD ["ollama", "serve"]
