# Base image for the Ollama service
FROM docker.io/ollama/ollama:latest

# Copy the custom run.sh script into the container
COPY run.sh /usr/local/bin/run.sh

# Make sure the run.sh script is executable
RUN chmod +x /usr/local/bin/run.sh

# Copy the web UI files into the container
COPY webui /usr/share/ollama/webui

# Expose the static port
EXPOSE 11434

# Set the default entrypoint to the run.sh script
ENTRYPOINT ["/usr/local/bin/run.sh"]
