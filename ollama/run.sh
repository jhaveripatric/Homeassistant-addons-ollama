#!/usr/bin/with-contenv bashio

# Log the start of Ollama service
bashio::log.info "Starting Ollama service on port 11434..."

# Export environment variables from Home Assistant add-on config
export OLLAMA_MODELS=$(bashio::config 'model_path')
export OLLAMA_HOST=$(bashio::config 'host')
export OLLAMA_MAX_LOADED_MODELS=$(bashio::config 'max_loaded_models')
export OLLAMA_INTEL_GPU=$(bashio::config 'intel_gpu')
export OLLAMA_GPU_OVERHEAD=$(bashio::config 'gpu_overhead')
export OLLAMA_KEEP_ALIVE=$(bashio::config 'keep_alive')
export OLLAMA_MAX_QUEUE=$(bashio::config 'max_queue')
export OLLAMA_NUM_PARALLEL=$(bashio::config 'num_parallel')
export OLLAMA_LOAD_TIMEOUT=$(bashio::config 'load_timeout')

# Download models if specified in the configuration
if bashio::config.has_value 'download_models'; then
  for model in $(bashio::config 'download_models'); do
    bashio::log.info "Downloading model: ${model}..."
    # Replace with actual command to download models
    ollama download "${model}"
  done
fi

# Load models if specified in the configuration
if bashio::config.has_value 'load_models'; then
  for model in $(bashio::config 'load_models'); do
    bashio::log.info "Loading model: ${model}..."
    # Replace with actual command to load models
    ollama run "${model}"
  done
fi

# Start the Ollama service using the exported environment variables
bashio::log.info "Ollama service starting with configurations..."
ollama serve \
  --models "${OLLAMA_MODELS}" \
  --host "${OLLAMA_HOST}" \
  --max-loaded-models "${OLLAMA_MAX_LOADED_MODELS}" \
  --intel-gpu "${OLLAMA_INTEL_GPU}" \
  --gpu-overhead "${OLLAMA_GPU_OVERHEAD}" \
  --keep-alive "${OLLAMA_KEEP_ALIVE}" \
  --max-queue "${OLLAMA_MAX_QUEUE}" \
  --num-parallel "${OLLAMA_NUM_PARALLEL}" \
  --load-timeout "${OLLAMA_LOAD_TIMEOUT}" \
  --port 11434
