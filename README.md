# gpt-code-ui-docker
Docker builds for https://github.com/ricklamers/gpt-code-ui




## Run the app
* get `docker-compose.yml`
* update `OPENAI_API_KEY` in this file
* `docker compose up` from same dir
* open `http://localhost:8080` 

### Run different version
`GPTCODEUI_VERSION=0.42.14 docker compose up`

#### Supported versions
See [Releases](https://github.com/localagi/gpt-code-ui-docker/releases)


### updating to latest `main`
`docker compose pull`

### cleanup
`docker compose rm`

## Contributing

Whenever there is a new version of gpt-code-ui or you require the latest main build, feel free to open an issue

## Problems?

https://github.com/localagi/gpt-code-ui-docker/issues
