#!/usr/bin/with-contenv bashio

# Log the start of Ollama service
bashio::log.info "Starting Ollama service on port 11434..."

# Declare variables
OLLAMA_MODELS=""
OLLAMA_HOST=""
OLLAMA_MAX_LOADED_MODELS=""
OLLAMA_INTEL_GPU=""
OLLAMA_GPU_OVERHEAD=""
OLLAMA_KEEP_ALIVE=""
OLLAMA_MAX_QUEUE=""
OLLAMA_NUM_PARALLEL=""
OLLAMA_LOAD_TIMEOUT=""

# Assign values from Home Assistant add-on config
OLLAMA_MODELS=$(bashio::config 'model_path')
OLLAMA_HOST=$(bashio::config 'host')
OLLAMA_MAX_LOADED_MODELS=$(bashio::config 'max_loaded_models')
OLLAMA_INTEL_GPU=$(bashio::config 'intel_gpu')
OLLAMA_GPU_OVERHEAD=$(bashio::config 'gpu_overhead')
OLLAMA_KEEP_ALIVE=$(bashio::config 'keep_alive')
OLLAMA_MAX_QUEUE=$(bashio::config 'max_queue')
OLLAMA_NUM_PARALLEL=$(bashio::config 'num_parallel')
OLLAMA_LOAD_TIMEOUT=$(bashio::config 'load_timeout')

# Download models if specified in the configuration
if bashio::config.has_value 'download_models'; then
  for model in $(bashio::config 'download_models'); do
    bashio::log.info "Downloading model: ${model}..."
    # Replace with actual command to download models
    ollama download ${model}
  done
fi

# Load models if specified in the configuration
if bashio::config.has_value 'load_models'; then
  for model in $(bashio::config 'load_models'); do
    bashio::log.info "Loading model: ${model}..."
    # Replace with actual command to load models
    ollama load ${model}
  done
fi

# Start the Ollama service on the static port 11434
bashio::log.info "Ollama service starting on static port 11434..."
ollama serve --port=11434