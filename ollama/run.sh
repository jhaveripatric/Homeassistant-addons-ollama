#!/usr/bin/with-contenv bashio

# Log the start of Ollama service
bashio::log.info "Starting Ollama service with model: $(bashio::config 'model_name')..."

# Declare and assign configuration values separately to avoid masking return values
MODEL_NAME=$(bashio::config 'model_name')
export MODEL_NAME
DEBUG=$(bashio::config 'debug')
export DEBUG

# Check if the model is already installed, otherwise install it
if [ ! -d "/root/.ollama/models/${MODEL_NAME}" ]; then
  bashio::log.info "Model ${MODEL_NAME} not found. Downloading..."
  ollama run "${MODEL_NAME}"
fi

# Serve the web UI files and start the Ollama service
bashio::log.info "Ollama service starting on static port 11434..."

# Combine serving the web UI and starting Ollama service
ollama serve --port=11434 --static-path=/usr/share/ollama/webui
