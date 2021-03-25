import Vapor
import DockerClientSwift

enum Config {
    static var dockerClient: DockerClient!
}

// configures your application
public func configure(_ app: Application) throws {
    Config.dockerClient = .init(client: app.http.client.shared, logger: app.logger)
    // register routes
    try routes(app)
}

extension Request {
    var dockerClient: DockerClient {
        Config.dockerClient
    }
}
