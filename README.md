# gpt-code-ui-docker

Sophisticated docker builds for parent project [ricklamers/gpt-code-ui](https://github.com/ricklamers/gpt-code-ui). 

![example workflow](https://github.com/localagi/gpt-code-ui-docker/actions/workflows/publish-docker.yml/badge.svg?branch=main)

Easy setup. Compatible. Tweakable. Scaleable.

#### Supported platforms
`amd64`, `arm64`

#### Supported versions
Containers follow the version scheme of the parent project

`main` (default), `0.42.14`, etc.

See [Releases](../../releases)

## Prerequisites

* `docker` and `docker compose` are available on your system

## Run

* get `docker-compose.yml`
* update `OPENAI_API_KEY` in this file
* `docker compose up` from same dir
* open `http://localhost:8080`

### Runtime options
Environment variables to set for the specific service

#### version selection `GPTCODEUI_VERSION`
Prepend, e.g. `GPTCODEUI_VERSION=0.42.14`


### Get the latest builds / update
`docker compose pull`

### Cleanup
`docker compose rm`

## Contributing

When there is a new version and there is need of builds or you require the latest main build, feel free to open an issue

## Problems?

Open an issue on the [Issue Tracker](../../issues)

## Limitations
We cannot support issues regarding the base software. Please refer to the main project page mentioned in the second line of this card.
