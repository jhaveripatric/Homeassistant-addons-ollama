# Ollama Home Assistant Add-On

The Ollama add-on allows you to run the Ollama AI service as a Docker container in Home Assistant, complete with a web UI for interacting with models. This add-on makes it easy to use AI models for answering questions or generating content directly from the Home Assistant interface.

## Features
- **Run Ollama AI Service**: Run the Ollama AI service in a containerized environment.
- **Web UI Integration**: A built-in web interface to interact with loaded models.
- **Model Management**: Load specific AI models, such as LLaMA 3.1B, directly from the configuration.
- **Ingress Support**: The add-on is accessible directly through Home Assistant's UI using ingress.

## Installation
1. Clone or download the add-on repository from [GitHub](https://github.com/jhaveripatric/Homeassistant-addons-ollama).
2. Add the add-on repository in Home Assistant:
    - Go to **Supervisor** → **Add-On Store** → **Three Dots Menu** → **Repositories**.
    - Paste the URL of the repository and click **Add**.
3. Find the **Ollama** add-on in the list and click **Install**.

## Configuration
To configure the add-on, modify the following settings in the **config.yaml**:

- **`model_name`** (string): The default AI model to load. For example, `"LLaMA 3.1B"`.
- **`debug`** (boolean): Enable or disable debug logging.

## Usage
1. Once installed and configured, start the add-on.
2. Open the add-on web UI through the Home Assistant sidebar to:
    - **View Available Models**: See the list of models currently available.
    - **Chat with the Model**: Send prompts to the loaded AI model and receive responses.

### Web UI
The web interface provides the following capabilities:
- **List Available Models**: Displays a list of the AI models currently available for use.
- **Chat with the Model**: Allows users to input a prompt and receive a response from the AI model.

## Technical Details
- **Ports**:
    - **11434**: Ollama AI service API port.
    - **11435**: Web UI port for interacting with Ollama.
- **Python** is used to serve the web interface.

## Development
### Building the Add-On
To build the add-on, run the following command in the add-on directory:
```bash
docker build -t ollama-addon .
```
### Running the Add-On
To run the add-on manually:
```bash
docker run -p 11434:11434 -p 11435:11435 ollama-addon
```

## Contributing
Feel free to open issues or submit pull requests to improve the add-on. Contributions are welcome!

## License
This project is licensed under the MIT License.