# Base image for the Ollama service
FROM docker.io/ollama/ollama:latest

# Copy the custom run.sh script into the container
COPY run.sh /usr/local/bin/run.sh

# Make sure the run.sh script is executable
RUN chmod +x /usr/local/bin/run.sh

# Expose a default port (optional, as this will be adjusted via the run.sh script)
EXPOSE 11434  # You can expose any default port here, since it will be overridden dynamically

# Set the default entrypoint to the run.sh script
ENTRYPOINT ["/usr/local/bin/run.sh"]
