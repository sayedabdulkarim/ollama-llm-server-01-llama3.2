FROM ollama/ollama

EXPOSE 11434

# Start ollama server, wait 5 sec, pull model, keep running
CMD /bin/sh -c "ollama serve & sleep 5 && ollama pull llama3.2:1b && tail -f /dev/null"
