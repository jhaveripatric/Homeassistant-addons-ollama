# Base image for the Ollama service
FROM docker.io/ollama/ollama:latest

# Install Python to serve the web UI
RUN apt-get update && apt-get install -y python3

# Copy the custom run.sh script into the container
COPY run.sh /usr/local/bin/run.sh

# Copy the web UI files into the container
COPY webui /usr/share/ollama/webui

# Make sure the run.sh script is executable
RUN chmod +x /usr/local/bin/run.sh

# Expose the static port 11434
EXPOSE 11434
EXPOSE 11435

# Set the default entrypoint to the run.sh script
ENTRYPOINT ["/usr/local/bin/run.sh"]