# Docker Client Vapor Demo
[![Language](https://img.shields.io/badge/Swift-5.4-brightgreen.svg)](http://swift.org)

This is a demo client implementation of the [Docker Client](https://github.com/alexsteinerde/docker-client-swift) with [Vapor](https://github.com/vapor/vapor/).

Disclaimer: This project is not a demonstration on how to write the best Vapor application but instead on how it is possible to integrate the Docker client into a Vapor project.

## Demo
This demo project shows you how to use the `DockerClient` library and how to implement a service that can update services with newer images.

To use this demo, please make sure you have Docker installed and running. Before running the Vapor application, please run the following docker swarm commands to boot up a demo service.
```bash
docker swarm init
docker stack deploy --compose-file docker-compose.yml demo
```

## License
This project is released under the MIT license. See [LICENSE](LICENSE) for details.

## Contribution
You can contribute to this project by submitting a detailed issue or by forking this project and sending a pull request. Contributions of any kind are very welcome :)
